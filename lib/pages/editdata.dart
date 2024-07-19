import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({super.key, required this.list, required this.index});

  @override
  // ignore: library_private_types_in_public_api
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;

  @override
  void initState() {
    super.initState();
    controllerCode =
        TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        TextEditingController(text: widget.list[widget.index]['stock']);
  }

  Future<void> editData() async {
    var url =
        "http://127.0.0.1/api/editdata.php"; // Ganti dengan URL server Anda

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "id": widget.list[widget.index]['id'],
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
            content: Text('Data updated successfully'),
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
            content: Text('Failed to update data: ${data['message']}'),
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
  void dispose() {
    controllerCode.dispose();
    controllerName.dispose();
    controllerPrice.dispose();
    controllerStock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT DATA"),
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
              onPressed: editData,
              child: const Text("EDIT DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
