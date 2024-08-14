import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:onco/constants.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _confirmController = TextEditingController();

  String number = "";

  String code = "";

  bool checked = false;

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Text(
                'O N C O\nConnect',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              // Sign Up Text
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Create an account and get started text
              Text(
                'Create an account and get started',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              // Username TextField
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Phone Number TextField
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                languageCode: "en",
                onChanged: (value) {
                  setState(() {
                    number = value.completeNumber;
                  });
                },
              ),
              SizedBox(height: 20),
              // Confirm Password TextField
              TextField(
                controller: _confirmController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Agree to terms and conditions
              Row(
                children: [
                  Checkbox(value: checked, onChanged: (value) {
                    setState(() {
                      checked = !checked;
                    });
                  }),
                  Text("Agree to terms & conditions"),
                ],
              ),
              SizedBox(height: 20),
              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_confirmController.text != _passwordController.text) {
                      Get.snackbar(
                        'Error Creating account',
                        'Password do not match',
                      );
                    } else if (!checked || _usernameController.text.isEmpty || _passwordController.text.isEmpty || _emailController.text.isEmpty || number.isEmpty) {
                      Get.snackbar(
                        'Error Creating account',
                        'Some Fields are empty',
                      );
                    } else if (!_emailController.text.contains("@") || !_emailController.text.contains(".com")) {
                      Get.snackbar(
                        'Error Creating account',
                        'Invalid Email Address',
                      );
                    } else {
                      authController.registerUser(_usernameController.text, _emailController.text, _passwordController.text, number);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDD6B4E), // Button color
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Create Account'),
                ),
              ),
              SizedBox(height: 20),
              // Already have an account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Log in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
