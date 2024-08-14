import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  int index;
  String question;
  List<dynamic> options;

  Question(
      {required this.question,
        required this.options,
        required this.index
      });

  Map<String, dynamic> toJson() => {
    "question": question,
    "responses": options,
  };

  static Question fromJson(Map<String, dynamic> snap) {
    return Question(
        question: snap['question'],
        options: snap['options'],
      index: snap['index']
    );
  }
}