import 'package:flutter/material.dart';

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
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Pattama Shop'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Control Data
  var price = TextEditingController();
  var amount = TextEditingController();
  var receive = TextEditingController();

  double _total = 0;
  double _change = 0;

  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "price per item",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget amountTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "amount of items",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: receive,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "get money",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget calculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (price.text.isNotEmpty && amount.text.isNotEmpty) {
            setState(() {
              _total = double.parse(price.text) * double.parse(amount.text);
            });
          }
        },
        child: const Text("Calculate Total"),
      ),
    );
  }

  Widget showTotalText() {
    return Text("Total : $_total Baht");
  }

  Widget changeCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (receive.text.isNotEmpty) {
            if (double.parse(receive.text) < _total) {
              //Not enough money
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Not enough money!")),
              );
            } else {
              setState(() {
                _change =
                    double.parse(receive.text) - _total;
              });
            }
          }
        },
        child: const Text("Calculate Change"),
      ),
    );
  }

  Widget showChangeText() {
    return Text("Change : $_change Baht");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          priceTextField(),
          amountTextField(),
          calculateButton(),
          showTotalText(),
          receiveMoneyTextField(),
          changeCalculateButton(),
          showChangeText(),
        ],
      ),
    );
  }
}
