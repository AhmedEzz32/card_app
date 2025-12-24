import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/membership.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  DatabaseScreenState createState() => DatabaseScreenState();
}

class DatabaseScreenState extends State<DatabaseScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Members Database')),
      body: memberships.isEmpty
          ? Center(child: Text('No members registered yet.'))
          : ListView.builder(
              itemCount: memberships.length,
              itemBuilder: (context, index) {
                Membership member = memberships[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${member.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('ID: ${member.id}'),
                        Text('Contact: ${member.contact}'),
                        Text('Registered: ${member.formattedRegistrationDate}'),
                        Text('Expires: ${member.formattedExpirationDate}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}