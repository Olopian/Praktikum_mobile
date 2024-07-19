import 'package:flutter/material.dart';

class LatihanKedua extends StatefulWidget {
  @override
  _LatihanKeduaState createState() => _LatihanKeduaState();
}

class _LatihanKeduaState extends State<LatihanKedua> {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double area = 0.0;

  void calculateArea() {
    double base = double.tryParse(baseController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    setState(() {
      area = 0.5 * base * height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Rumus Luas Segitiga'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: baseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Alas',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Tinggi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background (button) color
                ),
                icon: Icon(
                  Icons.calculate,
                  color: Colors.white,
                ),
                label: Text(
                  'Hitung Luas',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: calculateArea,
              ),
              SizedBox(height: 20.0),
              Text(
                'Luas Segitiga: $area',
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
