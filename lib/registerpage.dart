import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parlour_app/preview_page.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.1.8:8086/parlour/ParlourReg'; // Replace with your API base URL

  Future<bool> registerUser(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'), // Update with your endpoint
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    return response.statusCode == 200;
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _parlourname,
      _email,
      _phone,
      _password,
      _location,
      _description,
      _licenceNumber;
  String? _confirmPassword;
  final ApiService _apiService = ApiService(); // Create an instance of ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/IMG_20240810_125448.jpg', // Replace with your actual image path
            fit: BoxFit.cover,
          ),
          // Form Overlay
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      title: Center(
                          child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      )),
                      backgroundColor:
                          Colors.transparent, // Make AppBar transparent
                      elevation: 0, // Remove shadow
                    ),
                    const SizedBox(height: 16.0),

                    // Parlour Name Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Parlour Name',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your parlour name';
                        }
                        return null;
                      },
                      onSaved: (value) => _parlourname = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Description Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description about your parlour';
                        }
                        return null;
                      },
                      onSaved: (value) => _description = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Location Field with Icon Button
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Location',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            print("Select Location button pressed");
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                      onSaved: (value) => _location = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Email Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Phone Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length != 10 ||
                            !RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                      onSaved: (value) => _phone = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Parlour Licence Number Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Parlour Licence Number',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your parlour licence number';
                        }
                        return null;
                      },
                      onSaved: (value) => _licenceNumber = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Password Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                    ),
                    const SizedBox(height: 16.0),

                    // Confirm Password Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (_password != null && value != _password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSaved: (value) => _confirmPassword = value,
                    ),
                    const SizedBox(height: 20.0),

                    // Next Button
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // Create a map with the registration data
                          final registrationData = {
                            'parlourName': _parlourname!,
                            'location': _location!,
                            'email': _email!,
                            'phone': _phone!,
                            'password': _password!,
                            'description': _description!,
                            'licenceNumber': _licenceNumber!,
                          };

                          // Call the API to register the user
                          bool success = await _apiService.registerUser(registrationData);

                          if (success) {
                            // Navigate to PreviewPage and pass data
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreviewPage(
                                  parlourName: _parlourname!,
                                  location: _location!,
                                  email: _email!,
                                  phone: _phone!,
                                  password: _password!,
                                  description: _description!,
                                  licenceNumber: _licenceNumber!,
                                ),
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registration successful for $_parlourname')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registration failed. Please try again.')),
                            );
                          }
                        }
                      },
                      child: const Text('Next', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
