


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controllers/auth_controller.dart';

var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
const qid = "d4StPQuNFo5pwbW9QVzT";