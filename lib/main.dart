import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'addData.dart';
import 'detail.dart';

void main() {
  runApp(const MaterialApp(
    title: "My Store",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = getData();
  }

  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://127.0.0.1/api/getdata.php"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'success') {
        return data['data'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  void refreshData() {
    setState(() {
      _dataFuture = getData();
    });
  }

  void navigateToAddData() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddData()),
    );
    if (result == true) {
      refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY STORE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshData,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddData,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ItemList(list: snapshot.data!);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        var item = list[i];
        var title = item['item_name'] ?? 'Unknown'; // Jika NULL
        var stock =
            item['stock'] != null ? item['stock'].toString() : 'Unknown';

        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(list: list, index: i),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(title),
                leading: const Icon(Icons.widgets),
                subtitle: Text("Stock: $stock"),
              ),
            ),
          ),
        );
      },
    );
  }
}
