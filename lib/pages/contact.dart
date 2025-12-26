import 'package:flutter/material.dart';
import 'details.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    List mydata =['apple','banana','cherry'];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact"),
        ),
        body: ListView.builder(
          itemCount: mydata.length, 
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(mydata[index]), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage(mydata[index], '', '', '')),
                );
              },
            ); 
          },
        ),
    );// ปิด ListView.builder [
}
}