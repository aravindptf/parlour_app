import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Jane!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Salon Worker',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // KPI Dashboard
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildKPICard('Earnings', '\$120', Icons.attach_money, Colors.green),
                _buildKPICard('Appointments', '5', Icons.calendar_today, Colors.orange),
                _buildKPICard('Rating', '4.8 ★', Icons.star, Colors.amber),
              ],
            ),
            SizedBox(height: 20),

            // Section Title: Upcoming Appointments
            Text(
              'Upcoming Appointments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAppointmentCard('Emily', 'Haircut', '12:00 PM', Colors.purple),
                  _buildAppointmentCard('Michael', 'Shave', '1:00 PM', Colors.blue),
                  _buildAppointmentCard('Sarah', 'Hair Color', '2:30 PM', Colors.orange),
                ],
              ),
            ),

            SizedBox(height: 20),
            
            // Tasks / To-Do List Section
            _buildSectionTitle('Your Tasks'),
            _buildTaskCard('Check Supplies', 'Pending'),
            _buildTaskCard('Client Follow-up', 'Completed'),

            SizedBox(height: 20),

            // Notifications Section
            _buildSectionTitle('Notifications'),
            _buildNotificationCard('New booking from Anna', '5 min ago'),
            _buildNotificationCard('John rescheduled his appointment', '30 min ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildKPICard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(String clientName, String service, String time, Color color) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                clientName,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                service,
                style: TextStyle(color: Colors.white70),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.schedule, color: Colors.white),
                  Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(String taskName, String status) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.task, color: Colors.blue),
        title: Text(taskName),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == 'Completed' ? Colors.green : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(String notification, String time) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.redAccent),
        title: Text(notification),
        subtitle: Text(time),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

