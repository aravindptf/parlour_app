import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  // List of mock notifications
  final List<String> notifications = [
    'Appointment confirmed for 25th Oct, 2 PM',
    'Reminder: Team meeting at 11 AM tomorrow',
    'New message from manager',
    'Your leave has been approved',
    'Product training session on 28th Oct'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text('No notifications yet.'),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.notifications, color: Colors.blue),
                    title: Text(
                      notifications[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
