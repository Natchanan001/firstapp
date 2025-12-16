import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var receive = TextEditingController();

  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            color: Colors.redAccent,
            child: const Text(
              "Calculate",
              style: TextStyle(
                fontFamily: 'maaja',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        Image.asset(
          "assets/delicious-ramen-with-chopsticks.jpg",
          height: 200,
        ),

        const SizedBox(height: 20),

        TextField(
          controller: price,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "price per item",
          ),
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 10),

        TextField(
          controller: amount,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "amount of items",
          ),
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            if (price.text.isNotEmpty && amount.text.isNotEmpty) {
              setState(() {
                _total = double.parse(price.text) * double.parse(amount.text);
              });
            }
          },
          child: const Text("Calculate Total"),
        ),

        const SizedBox(height: 10),

        Center(
          child: Text(
            _total == 0 ? "Total : Baht" : "Total : $_total Baht",
            style: const TextStyle(fontSize: 18),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: receive,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "get money",
          ),
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            if (receive.text.isNotEmpty) {
              double money = double.parse(receive.text);

              if (money < _total) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Not enough money!")),
                );
              } else {
                setState(() {
                  _change = money - _total;
                });
              }
            }
          },
          child: const Text("Calculate Change"),
        ),

        const SizedBox(height: 10),

        Center(
          child: Text(
            _change == 0 ? "Change : Baht" : "Change : $_change Baht",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
