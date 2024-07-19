import 'package:flutter/material.dart';
import 'package:my_flutter_project/pages/page_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login sharedPreference'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: _isLoading
            ? Center(
                child: Text('Wait..'),
              )
            : Column(
                children: [
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _pass,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ],
              ),
      ),
    );
  }

  // email = 'admin@domain.com' | pass = '12345'
  Future<void> _login() async {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      if (_email.text == 'admin@domain.com' && _pass.text == '12345') {
        setState(() {
          _isLoading = true;
        });

        // Shared Preferences di sini
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isUser', true);

        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      } else {
        // Tambahkan handling error jika diperlukan
      }
    } else {
      // Tambahkan handling error jika input kosong
    }
  }
}
class SharedPreferences {
  static getInstance() {}
  
  setBool(String s, bool bool) {}
}
