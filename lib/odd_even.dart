import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class oddeven extends StatefulWidget {
  final String title;
  const oddeven({super.key, required this.title});
  @override
  State<oddeven> createState() => _oddevenState();
}

// ignore: camel_case_types
class _oddevenState extends State<oddeven> {
  int _number = 0;
  String _result = "";

  String _checkNumber() {
    if (_number % 2 == 0) {
      return "Genap";
    } else {
      return "Ganjil";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _middleContainer(),
          ],
        ),
      ),
    );
  }

  Widget _middleContainer() {
    return Column(
      children: [
        Text(
          '$_number itu $_result',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child : TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Angka',
                  hintText: 'Masukkan angka disini',
                ),
                onChanged: (value) {
                  setState(() {
                    try {
                      _number = int.parse(value);
                    } catch (e) {
                      _number = 0;
                      // if string, show snackbar
                      if (value.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Input harus angka'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    }
                    _result = _checkNumber();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}