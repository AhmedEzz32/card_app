import 'package:intl/intl.dart';

class Membership {
  String id;
  String name;
  String contact; // email or mobile
  DateTime registrationDate;
  DateTime expirationDate;

  Membership({
    required this.id,
    required this.name,
    required this.contact,
    required this.registrationDate,
    required this.expirationDate,
  });

  String get formattedRegistrationDate => DateFormat('MMM d, y h:mm a').format(registrationDate);
  String get formattedExpirationDate => DateFormat('MMM d, y').format(expirationDate);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'contact': contact,
        'registrationDate': registrationDate.toIso8601String(),
        'expirationDate': expirationDate.toIso8601String(),
      };

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        id: json['id'],
        name: json['name'],
        contact: json['contact'],
        registrationDate: DateTime.parse(json['registrationDate']),
        expirationDate: DateTime.parse(json['expirationDate']),
      );

  bool isValid() => DateTime.now().isBefore(expirationDate);
}