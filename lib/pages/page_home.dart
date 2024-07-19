import 'package:my_flutter_project/main.dart';
import 'package:my_flutter_project/pages/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared_prefs;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switch = false;
  bool? isUser;

  @override
  void initState() {
    super.initState();
    _setData();
    _switch = ThemeSettings.darkMode;
  }

  void _setData() async {
    shared_prefs.SharedPreferences prefs =
        await shared_prefs.SharedPreferences.getInstance();
    setState(() {
      isUser = prefs.getBool('isUser');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selamat Datang'),
          SizedBox(height: 10.0),
          Text('Pilih Tema'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Light'),
              Switch(
                value: _switch,
                onChanged: _onChangeSwitch,
              ),
              Text('Dark'),
            ],
          ),
          Text(
              'Status Login: ${isUser == true ? "Logged in" : "Not logged in"}'),
        ],
      ),
    );
  }

  void _onChangeSwitch(bool val) async {
    shared_prefs.SharedPreferences prefs =
        await shared_prefs.SharedPreferences.getInstance();
    setState(() {
      _switch = val;
    });
    await prefs.setBool('darkMode', _switch);
    ReloadApp.of(context)?.rebuild();
  }

  void _logOut() async {
    shared_prefs.SharedPreferences prefs =
        await shared_prefs.SharedPreferences.getInstance();
    await prefs.remove('isUser');
    var pushReplacement = Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}

class MyApp {
}
