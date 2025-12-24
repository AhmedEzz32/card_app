import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/membership.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  String name = '';
  String contact = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _nameController.clear();
      _contactController.clear();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString('memberships');
      List<Membership> memberships = [];
      if (data != null) {
        List<dynamic> jsonList = jsonDecode(data);
        memberships = jsonList.map((json) => Membership.fromJson(json)).toList();
      }

      // Check if contact already exists
      bool exists = memberships.any((m) => m.contact == contact);
      if (exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Contact already registered!')),
        );
        return;
      }

      String id = Random().nextInt(999999).toString().padLeft(6, '0');
      DateTime regDate = DateTime.now();
      DateTime expDate = regDate.add(Duration(days: 365));
      Membership membership = Membership(
        id: id,
        name: name,
        contact: contact,
        registrationDate: regDate,
        expirationDate: expDate,
      );

      memberships.add(membership);
      await prefs.setString('memberships', jsonEncode(memberships.map((m) => m.toJson()).toList()));
      await prefs.setString('current_membership', jsonEncode(membership.toJson()));

      if (mounted) {
        Navigator.pushNamed(context, '/card');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
                onSaved: (value) => name = value!,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Email or Mobile'),
                validator: (value) {
                  if (value!.isEmpty) return 'Enter contact';
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                  if (emailRegex.hasMatch(value) || phoneRegex.hasMatch(value)) {
                    return null;
                  }
                  return 'Enter a valid email or phone number';
                },
                onSaved: (value) => contact = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _contactController.dispose();
  }
}