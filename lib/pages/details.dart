import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"), 
      ),
      body: ListView(
        padding: const EdgeInsets.all(20), 
        children: const [
          Text(
            "Details Explanation", 
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}