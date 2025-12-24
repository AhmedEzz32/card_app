import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/membership.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  List<Membership> memberships = [];

  @override
  void initState() {
    super.initState();
    _loadMemberships();
  }

  void _loadMemberships() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('memberships');
    if (data != null) {
      List<dynamic> jsonList = jsonDecode(data);
      setState(() {
        memberships = jsonList.map((json) => Membership.fromJson(json)).toList();
      });
    }
  }

  void _login(Membership member) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_membership', jsonEncode(member.toJson()));
    Navigator.pushNamed(context, '/card');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text('Register New Member'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: memberships.isEmpty
                  ? Center(child: Text('No members registered. Register first.'))
                  : ListView.builder(
                      itemCount: memberships.length,
                      itemBuilder: (context, index) {
                        Membership member = memberships[index];
                        return Card(
                          child: ListTile(
                            title: Text(member.name),
                            subtitle: Text('ID: ${member.id}'),
                            trailing: ElevatedButton(
                              onPressed: () => _login(member),
                              child: Text('Login'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}