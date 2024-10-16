import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parlour App'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeSection(),
            _buildServiceGrid(),
            _buildScheduleOverview(),
            _buildEarningsTracker(),
            _buildResourcesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back, [Name]!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Book Appointments')),
              ElevatedButton(onPressed: () {}, child: Text('Manage Schedule')),
              ElevatedButton(onPressed: () {}, child: Text('View Earnings')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.ac_unit, size: 50),
                SizedBox(height: 10),
                Text('Service ${index + 1}'),
                ElevatedButton(onPressed: () {}, child: Text('Book Now')),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildScheduleOverview() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today’s Schedule', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            title: Text('10:00 AM - Haircut'),
            subtitle: Text('Client: John Doe'),
            trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          ),
          // Add more ListTiles for additional appointments
        ],
      ),
    );
  }

  Widget _buildEarningsTracker() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Earnings Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Use a simple bar graph or text to show earnings
          Text('Today’s Earnings: \$150', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildResourcesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Training and Resources', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: () {}, child: Text('View Tutorials')),
          ElevatedButton(onPressed: () {}, child: Text('Current Promotions')),
        ],
      ),
    );
  }
}
