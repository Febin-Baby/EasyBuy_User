import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  UserModel({
    this.id,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      id: map.id,
      name: map['name'],
      email: map['email'],
    );
  }
}
