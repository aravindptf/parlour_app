import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final String name;

  AppointmentDetailsPage({required this.name});

  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  bool _isAvailable = true; // Initial availability status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Details',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appointment details text
            Text(
              'Details for ${widget.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            // Availability status switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available for this appointment',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Switch(
                  value: _isAvailable,
                  onChanged: (value) {
                    setState(() {
                      _isAvailable = value;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Show availability status text
            Text(
              _isAvailable ? 'Worker is available.' : 'Worker is not available.',
              style: TextStyle(
                fontSize: 16,
                color: _isAvailable ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
