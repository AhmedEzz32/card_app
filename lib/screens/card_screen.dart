import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/membership.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  Membership? membership;

  @override
  void initState() {
    super.initState();
    _loadMembership();
  }

  void _loadMembership() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('current_membership');
    if (data != null) {
      Map<String, dynamic> json = jsonDecode(data);
      setState(() {
        membership = Membership.fromJson(json);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (membership == null) return Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(title: Text('Membership Card')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Name: ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: membership!.name,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'ID: ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: membership!.id,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Contact: ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: membership!.contact,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'Registered: ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: membership!.formattedRegistrationDate,
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'Expires: ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: membership!.formattedExpirationDate,
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                QrImageView(
                  data: jsonEncode(membership!.toJson()),
                  size: 250,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/scan'),
                  child: Text('Scan QR'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/database'),
        tooltip: 'View memberships',
        label: Row(
          children: [
            Icon(Icons.list),
            SizedBox(width: 4),
            Text('View memberships'),
          ],
        ),
      ),
    );
  }
}