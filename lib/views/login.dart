import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:onco/constants.dart';


class LoginPage extends StatelessWidget {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
      body: Padding(
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
            SizedBox(height: 50),
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
            SizedBox(height: 10),
            // "Don't forget me!" checkbox and "Forgot Password?"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Don't forget me!"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Log in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                    Get.snackbar(
                      'Error Logging in',
                      'Some Fields are Empty.',
                    );
                  } else {
                    authController.loginUser(_usernameController.text, _passwordController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDD6B4E), // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Log in'),
              ),
            ),
            SizedBox(height: 20),
            // Create an account text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an account? "),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}