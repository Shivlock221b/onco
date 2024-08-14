import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String? profilePhoto;
  String email;
  String uid;
  String number;
  List<dynamic> responses;

  User(
      {required this.name,
        required this.email,
        required this.uid,
        required this.number,
        required this.responses,
        this.profilePhoto});

  Map<String, dynamic> toJson() => {
    "name": name,
    "profilePhoto": profilePhoto,
    "email": email,
    "uid": uid,
    "number": number,
    "responses": responses
  };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid'],
        name: snapshot['name'],
        number: snapshot['number'],
        responses: snapshot['responses']
    );
  }
}