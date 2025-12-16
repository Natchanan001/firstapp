import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 20),
        Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 28, fontFamily: "maaja"),
          ),
        ),
        SizedBox(height: 20),
        Icon(Icons.home, size: 150, color: Colors.blueAccent),
      ],
    );
  }
}
