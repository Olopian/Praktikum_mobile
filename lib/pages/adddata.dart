import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController controllerCode = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPrice = TextEditingController();
  final TextEditingController controllerStock = TextEditingController();

  Future<void> addData() async {
    var url =
        "http://127.0.0.1/api/adddata.php"; // Ganti dengan URL server Anda

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "itemcode": controllerCode.text,
          "itemname": controllerName.text,
          "price": controllerPrice.text,
          "stock": controllerStock.text,
        },
      );

      var data = json.decode(response.body);

      if (data['status'] == 'success') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data added successfully'),
            backgroundColor: Colors.green,
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const Home()),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add data: ${data['message']}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controllerCode,
              decoration: const InputDecoration(
                hintText: "Item Code",
                labelText: "Item Code",
              ),
            ),
            TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                hintText: "Item Name",
                labelText: "Item Name",
              ),
            ),
            TextField(
              controller: controllerPrice,
              decoration: const InputDecoration(
                hintText: "Price",
                labelText: "Price",
              ),
            ),
            TextField(
              controller: controllerStock,
              decoration: const InputDecoration(
                hintText: "Stock",
                labelText: "Stock",
              ),
            ),
            const SizedBox(height: 20), // Tambahkan sedikit jarak
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Warna tombol
              ),
              onPressed: addData,
              child: const Text("ADD DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
