import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;

  const Detail({super.key, required this.index, required this.list});

  @override
  // ignore: library_private_types_in_public_api
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Menghapus data dari server
  Future<void> deleteData() async {
    var url = "http://127.0.0.1/api/deleteData.php";
    var response = await http
        .post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});

    if (response.statusCode == 200) {
      // Data berhasil dihapus
    } else {
      // Tangani error jika terjadi
      throw Exception('Failed to delete data');
    }
  }

  // Konfirmasi penghapusan data
  void confirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to delete '${widget.list[widget.index]['item_name']}'?"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                await deleteData();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("OK DELETE!",
                  style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pop(context),
              child:
                  const Text("CANCEL", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Code: ${widget.list[widget.index]['item_code']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Price: ${widget.list[widget.index]['price']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Stock: ${widget.list[widget.index]['stock']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditData(
                              list: widget.list,
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                      child: const Text("EDIT"),
                    ),
                    const SizedBox(
                        width: 10), // Menambahkan jarak antara tombol
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: confirm,
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
