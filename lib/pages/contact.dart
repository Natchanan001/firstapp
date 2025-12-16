import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 20),
        Center(
          child: Text(
            "Contact Aj Tui",
            style: TextStyle(fontSize: 28, fontFamily: "maaja"),
          ),
        ),
        SizedBox(height: 20),
        Icon(Icons.contact_mail, size: 150, color: Colors.purple),
        SizedBox(height: 20),
        Center(
          child: Text("📧 Email: ajtui@example.com",
              style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
