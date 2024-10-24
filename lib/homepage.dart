
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parlour_app/Notification.dart';
import 'package:parlour_app/profile.dart'; // Import the ProfilePage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Variable to store picked image
  int _currentIndex = 0; // Track the current index for the bottom navigation bar

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image; // Update the state with the new image
    });
  }

  // Function to navigate to appointment details (dummy implementation)
  void _viewAppointmentDetails(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentDetailsPage(name: name),
      ),
    );
  }

  // List of pages for the bottom navigation
  final List<Widget> _pages = [
    HomeContent(), // Home content as a separate widget
    NotificationsPage(), // Placeholder for Notifications page
    ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body section with the selected page
      body: _pages[_currentIndex],

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current index
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update current index
          });
        },
        backgroundColor: Colors.white,
      ),
    );
  }
}

// Home content as a separate widget
class HomeContent extends StatelessWidget {
  // Function to create appointment cards with a black gradient design
  Widget _buildAppointmentCard(String name, String time, String service) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.5), // Soft shadow
      child: Stack(
        children: [
          // Background black and white gradient
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey[700]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Custom icon with a circle background
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Icon(
                    Icons.event_available,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(width: 16),
                // Appointment details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        service,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.white70, size: 18),
                          SizedBox(width: 6),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Trailing arrow
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.black, // Set the app bar color to black
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Dhanoop!',
                    style: GoogleFonts.adamina(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'SPA SPECIALIST',
                    style: GoogleFonts.adamina(
                      textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today's Appointments
              Text(
                'Today\'s Appointments',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _viewAppointmentDetails('Jane Doe'), // View details for Jane Doe
                child: _buildAppointmentCard(
                  'Jane Doe',
                  '10:00 AM',
                  'Haircut & Styling',
                ),
              ),
              GestureDetector(
                onTap: () => _viewAppointmentDetails('John Smith'), // View details for John Smith
                child: _buildAppointmentCard(
                  'John Smith',
                  '12:00 PM',
                  'Full Body Massage',
                ),
              ),
              SizedBox(height: 20),

              // Quick Access Section
              Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildQuickAccessButton('Manage Clients', Icons.people),
              _buildQuickAccessButton('Services', Icons.build),
              _buildQuickAccessButton('Sales Reports', Icons.bar_chart),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper method to create quick access buttons with a gradient background
Widget _buildQuickAccessButton(String label, IconData icon) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: Colors.white,
    elevation: 3,
    child: ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        // Implement navigation to relevant screen here
        // You can replace this with your actual navigation logic
        print('Navigating to $label');
      },
    ),
  );
}

void _viewAppointmentDetails(String name) {
  // Function to navigate to appointment details
  // This should be implemented as per your requirement
  // Using Navigator to push the AppointmentDetailsPage
}

// Placeholder for AppointmentDetailsPage
class AppointmentDetailsPage extends StatelessWidget {
  final String name;

  AppointmentDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Details',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Details for $name'),
      ),
    );
  }
}



