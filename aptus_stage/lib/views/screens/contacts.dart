import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Beautiful Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your own image asset
              height: 200,
            ),
            SizedBox(height: 32),
            Text(
              'Welcome to Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We provide innovative solutions to help your business thrive.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('Explore Our Solutions'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text('Learn More About Us'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}
