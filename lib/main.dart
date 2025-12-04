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
      home: const MyHomePage(title: 'Natchanan Shop'),
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
  // Control Data
  var price = TextEditingController();
  var amount = TextEditingController();
  var receive = TextEditingController();

  double _total = 0;
  double _change = 0;

  // Widgets ---------------------------------------------

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
    return Text(
      _total == 0 ? "Total : Baht" : "Total : $_total Baht",
    );
  }

  Widget changeCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (receive.text.isNotEmpty) {
            if (double.parse(receive.text) < _total) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Not enough money!")),
              );
            } else {
              setState(() {
                _change = double.parse(receive.text) - _total;
              });
            }
          }
        },
        child: const Text("Calculate Change"),
      ),
    );
  }

  Widget showChangeText() {
    return Text(
      _change == 0 ? "Change : Baht" : "Change : $_change Baht",
    );
  }

  // -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'maaja',
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 31, 31),  
            ),
        child: const Text(
          "Calculate",
        style: TextStyle(
       fontFamily: 'maaja',
       fontSize: 28,
       fontWeight: FontWeight.bold,
       fontStyle: FontStyle.italic,
       color: Colors.blue, 
         ),
      ),
    ),
   Center(
      child: Image.asset(
        "assets/delicious-ramen-with-chopsticks.jpg",
        height: 200,
      ),
    ),
              const SizedBox(height: 20),

              priceTextField(),
              amountTextField(),
              calculateButton(),
              showTotalText(),
              receiveMoneyTextField(),
              changeCalculateButton(),
              showChangeText(),
            ],
          ),
        ),
      ),
    );
  }
}
