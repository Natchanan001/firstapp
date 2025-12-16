import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/calc.dart';
import 'pages/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tui Shop',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        useMaterial3: false
      ),
      home: const MyBottomNav(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {

  int _index = 0;


  final List<Widget> _pages = [
    const HomePage(),
    const CalculatePage(),
    const ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        onTap: (value) {
          setState(() {
            _index = value;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}
