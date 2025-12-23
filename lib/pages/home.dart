import 'package:flutter/material.dart';
import 'details.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Computer Knowledge"), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), 
        child: ListView(
          children: [
            MyBox(
              "What is a computer?", 
              "Computer is a things to calculate and fo any other works", 
              "https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_960_720.jpg"
            ),
            const SizedBox(height: 20), 
            MyBox(
              "What is Flutter?", 
              "Flutter is a tool to create a mobile application", 
              "https://cdn.pixabay.com/photo/2015/12/01/08/42/banner-1071789_960_720.jpg"
            ),
            const SizedBox(height: 20),
MyBox(
  "What is Dart?", 
  "Dart is the language used in Flutter", 
  "https://cdn.pixabay.com/photo/2018/05/08/08/44/artificial-intelligence-3382507_960_720.jpg" // ใช้ URL นี้แทน รันติดชัวร์!
),
          ],
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
      padding: const EdgeInsets.all(20), 
      height: 180, 
      decoration: BoxDecoration(
        color: Colors.blue[200], 
        borderRadius: BorderRadius.circular(20), 
        image: DecorationImage(
          image: NetworkImage(img_url), 
          fit: BoxFit.cover, 
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), 
            BlendMode.darken
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text(
            title, 
            style: const TextStyle(
              fontSize: 25, 
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ), 
          ),
          const SizedBox(height: 10), 
          Text(
            subtitle, 
            style: const TextStyle(
              fontSize: 15, 
              color: Colors.white
            ), 
          ),
          const Spacer(), 
          TextButton(
            onPressed: () {
              print("next page >>"); 
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const DetailsPage())
              );
            },
            child: const Text(
              "read more", 
              style: TextStyle(color: Colors.yellowAccent)
            ), 
          )
        ],
      ),
    );
  }
}