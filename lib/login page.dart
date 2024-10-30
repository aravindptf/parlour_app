import 'dart:convert'; // For jsonEncode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parlour_app/homepage.dart';
import 'package:parlour_app/registerpage.dart'; // Ensure you import your HomePage widget

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final String username = _usernameController.text;
      final String password = _passwordController.text;

      // Replace with your backend URL
      final url = 'http://192.168.1.8:8086/parlour/ParlourLogin';

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': username, // Use the text value here
            'password': password, // Use the text value here
          }),
        );
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode >= 200 && response.statusCode < 300) {
          // Handle successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          // Handle login error (e.g., show an alert)
          _showErrorDialog('Login failed. Please check your credentials.');
        }
      } catch (error) {
        // Handle exceptions (e.g., show an alert)
        _showErrorDialog('An error occurred. Please try again later.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void _forgotPassword() {
    // Implement forgot password functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/IMG_20240810_125448.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Form Overlay
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 350), // Adjust height as needed
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _usernameController,
                          label: 'Username or Email',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username or email';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 100),
                  _buildBottomTexts(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildBottomTexts() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextButton(
              onPressed: _navigateToRegisterPage,
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _forgotPassword,
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.white, fontSize: 16, decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}