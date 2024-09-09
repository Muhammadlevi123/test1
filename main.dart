import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  int _count = 0;

  void _calculateOccurrences() {
    int start = int.parse(_startController.text);
    int end = int.parse(_endController.text);
    String target = _targetController.text;

    int count = 0;

    for (int i = start; i <= end; i++) {
      count += i.toString().split(target).length - 1;
    }

    setState(() {
      _count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Kemunculan Angka'),
      ),
      body: Center( 
        child: Container(
          width: 400, 
          child: Card(  
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),  
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _startController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan angka awal',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _endController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan angka akhir',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _targetController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan angka yang ingin dihitung kemunculannya',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateOccurrences,
                    child: Text('Hitung'),
                  ),
                  SizedBox(height: 20),
                  Text("Jumlah kemunculan: $_count"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
