import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Information',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10),
              _buildInfoRow('Email', 'dhanoop@example.com'),
              _buildInfoRow('Phone', '+1 234 567 890'),
              SizedBox(height: 20),
              Text(
                'Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10),
              _buildActionButton('Edit Profile', Icons.edit, () {
                // Navigate to edit profile screen
              }),
              _buildActionButton('Change Password', Icons.lock, () {
                // Navigate to change password screen
              }),
              _buildActionButton('Logout', Icons.logout, () {
                _showLogoutConfirmationDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create an information row
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create action buttons
  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(label),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onPressed,
      ),
    );
  }

  // Method to show logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Handle logout functionality
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged out successfully')),
                );

                // Navigate to login page (replace with your actual login page route)
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }
}
