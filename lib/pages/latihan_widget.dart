import 'package:flutter/material.dart';

class LatihanKedua extends StatefulWidget {
  @override
  _LatihanKeduaState createState() => _LatihanKeduaState();
}

class _LatihanKeduaState extends State<LatihanKedua> {
  int nomor = 0;

  void tambahBilangan() {
    setState(() {
      nomor = nomor + 1;
      print(nomor);
    });
  }

  void kurangBilangan() {
    setState(() {
      nomor = nomor - 1;
      print(nomor);
    });
  }

  void hapusBilangan() {
    setState(() {
      nomor = 0;
      print(nomor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Stateful Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nomor.toString(),
              style: TextStyle(fontSize: 50.0, color: Colors.black),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 141, 253), // background (button) color
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Tambahi Bilangan',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: tambahBilangan,
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background (button) color
              ),
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
              label: Text(
                'Kurangi Bilangan',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: kurangBilangan,
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // background (button) color
              ),
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: Text(
                'Hapus Bilangan',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: hapusBilangan,
            ),
          ],
        ),
      ),
    );
  }
}
