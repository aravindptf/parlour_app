import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parlour_app/appoinmentpage.dart';
import 'package:parlour_app/profile.dart';
import 'package:parlour_app/Notification.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  int _currentIndex = 0;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  final List<Widget> _pages = [
    HomeContent(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final token = (context.findAncestorWidgetOfExactType<HomePage>() as HomePage).token;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Dhanoop!',
                      style: GoogleFonts.adamina(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'SPA SPECIALIST',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.location_on, color: Colors.white, size: 28),
                onPressed: () {
                  print('Location button pressed');
                },
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
              Text(
                'Today\'s Appointments',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildAppointmentCard(context, 'Jane Doe', '10:00 AM', 'Haircut & Styling'),
              _buildAppointmentCard(context, 'John Smith', '12:00 PM', 'Full Body Massage'),
              SizedBox(height: 20),
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

  Widget _buildAppointmentCard(BuildContext context, String name, String time, String service) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentDetailsPage(name: name),
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.5),
        child: Stack(
          children: [
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        print('Navigating to $label');
      },
    ),
  );
}
