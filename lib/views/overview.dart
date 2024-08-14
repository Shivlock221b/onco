import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco/constants.dart';
import 'package:onco/controllers/auth_controller.dart';
import 'package:onco/controllers/question_controller.dart';
import 'package:onco/models/question.dart';
import 'package:onco/views/assessment.dart';


class CancerRiskAssessmentOverview extends StatefulWidget {
  @override
  State<CancerRiskAssessmentOverview> createState() => _CancerRiskAssessmentOverviewState();
}

class _CancerRiskAssessmentOverviewState extends State<CancerRiskAssessmentOverview> {

  QuestionController questionController = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
    questionController.getQuestionaire();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            authController.signOut();
          },
        ),
        title: Text(
          'My OncoCheck',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/default_user.jpg'), // Replace with your image asset
          ),
          SizedBox(width: 16),
        ],
      ),
      body: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          if (controller.questions.isEmpty) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Take Your Cancer Risk Assessment',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
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
                      Text('Complete the questionnaire at your own pace'),
                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 1 / 46,
                        color: Colors.orange,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(height: 10),
                      Text('1/46 questions answered'),
                    ],
                  ),
                ),
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
                    children: [
                      Image.asset(
                        'assets/couple.png', // Replace with your image asset
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.questions[0].question,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                authController.updateResponse(questionController.questions[0].options[0].toString(), questionController.questions[0].index);
                                Get.to(CancerRiskAssessmentQuestion());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(questionController.questions[0].options[0].toString()),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                authController.updateResponse(questionController.questions[0].options[1].toString(), questionController.questions[0].index);
                                Get.to(CancerRiskAssessmentQuestion());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(questionController.questions[0].options[1].toString()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          // setState(() {
          //   pageIdx = idx;
          // });
        },
        type: BottomNavigationBarType.fixed,
        // backgroundColor: backgroundColor,
        // selectedItemColor: Color.fromARGB(255, 255, 235, 201),
        // unselectedItemColor: Colors.white,
        // currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2, color: Colors.grey,),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services, color: Colors.grey,),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes, color: Colors.grey,),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, color: Colors.grey,),
            label: 'Articles',
          ),
        ],
      ),
    );
  }
}