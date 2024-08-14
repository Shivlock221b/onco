import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco/controllers/question_controller.dart';
import 'package:onco/models/question.dart';

import '../constants.dart';

class CancerRiskAssessmentQuestion extends StatelessWidget {

  QuestionController questionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'My OncoCheck',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image asset
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 2 / 46,
              color: Colors.orange,
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 10),
            Text('2/46 questions answered'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/couple.png', // Replace with your image asset
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    questionController.questions[1].question,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      authController.updateResponse(questionController.questions[1].options[0].toString(), questionController.questions[1].index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(questionController.questions[1].options[0].toString(), style: TextStyle(color: Colors.black),),
                        Icon(Icons.add, color: Colors.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      authController.updateResponse(questionController.questions[1].options[1].toString(), questionController.questions[1].index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(questionController.questions[1].options[1].toString(), style: TextStyle(color: Colors.black),),
                        Icon(Icons.add, color: Colors.black,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDD6B4E), // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Next Step'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
