import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final v1, v2, v3, v4;
  const DetailsPage(this.v1, this.v2, this.v3, this.v4, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail of " + _v1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(_v1, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_v2, style: const TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 20),
            Image.network(_v3),
            const SizedBox(height: 20),
            Text(_v4, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}