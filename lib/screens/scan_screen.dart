import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../models/membership.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: Stack(
                  children: [
                    MobileScanner(
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          setState(() {
                            result = barcode.rawValue ?? '';
                            try {
                              Map<String, dynamic> json = jsonDecode(result);
                              Membership membership = Membership.fromJson(json);
                              if (membership.isValid()) {
                                result = 'Valid membership for ${membership.name}';
                              } else {
                                result = 'Expired membership';
                              }
                            } catch (e) {
                              result = 'Invalid QR code';
                            }
                          });
                        }
                      },
                    ),
                    // Corner borders
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 40,
                        height: 4,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 4,
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 4,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 4,
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 40,
                        height: 4,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 4,
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 4,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 4,
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: result.startsWith('Valid membership')
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Valid membership ',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                            text: result.split(' for ')[1],
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      result,
                      style: result == 'Expired membership'
                          ? TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)
                          : TextStyle(color: Colors.black, fontSize: 16),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}