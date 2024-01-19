// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // final

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Settings')
        ],
        currentIndex: 0,
      ),
    );
  }
}
