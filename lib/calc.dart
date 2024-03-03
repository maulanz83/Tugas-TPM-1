import 'package:flutter/material.dart';

// ignore: camel_case_types
class crement extends StatefulWidget {
  final String title;
  const crement({super.key, required this.title});

  @override
  State<crement> createState() => _crementState();
}

// ignore: camel_case_types
class _crementState extends State<crement> {
  int firtNumber = 0;
  int secondNumber = 0;
  int total = 0;

  void _pengurangan() {
    setState(() {
      total = firtNumber - secondNumber;
    });
  }

  void _penjumlahan() {
    setState(() {
      total = firtNumber + secondNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: _bodyContainer(),
      ),
    );
  }

  // two text field side by side
  Widget _doubletextfield(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Angka Pertama',
            ),
            onChanged: (value) => firtNumber = int.parse(value),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Angka Kedua',
            ),
            onChanged: (value) => secondNumber = int.parse(value),
          ),
        ),
      ],
    );
  }

  Widget _actionbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              _pengurangan();
            },
            child: const Icon(Icons.remove),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              _penjumlahan();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget _finnalresult() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Result:',
          ),
          Text(
            '$total',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
  Widget _bodyContainer() {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _doubletextfield(),
            const SizedBox(height: 20,),
            _actionbuttons(),
            _finnalresult(),
          ],
        );
  }
  // Widget _middleContainer() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 20),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const Text(
  //           'You have pushed the button this many times:',
  //         ),
  //         Text(
  //           '$_counter',
  //           style: Theme.of(context).textTheme.headlineMedium,
  //         ),
  //         _actionbuttons(),
  //       ],
  //     ),
  //   );
  // } 
}