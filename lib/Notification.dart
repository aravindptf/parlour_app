import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  // Sample notifications list
  final List<String> notifications = [
    'Your appointment with Jane Doe is confirmed at 10:00 AM.',
    'John Smith has canceled his Full Body Massage appointment.',
    'New promotional offer: 20% off on all services this weekend!',
    'Reminder: Don’t forget to submit your weekly sales report.',
    'New client request: Alice Johnson.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.adamina(
            color: Colors.white, // Title color for visibility
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 20, // Adjust the font size as needed
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, // Back button color for visibility
        ),
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications, // Notification icon
                      color: Colors.black, // Icon color
                    ),
                    title: Text(
                      notifications[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'No notifications available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
    );
  }
}
