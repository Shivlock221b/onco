

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants.dart';
import '../models/question.dart';

class QuestionController extends GetxController {
  final Rx<List<Question>> _question = Rx<List<Question>>([]);
  List<Question> get questions => _question.value;

  getQuestionaire() async{
    DocumentSnapshot userDoc =
        await firestore.collection('questionaire').doc(qid).get();
    Map<String, dynamic> questionaire = userDoc.data() as Map<String, dynamic>;
    List<Question> questions = [];
    int index = 0;
    for (dynamic elem in questionaire['questions']) {
      questions.add(Question.fromJson({"question": elem['question'], "options": elem['options'], "index": index++}));
    }
    _question.value = questions;
    update();
  }

}