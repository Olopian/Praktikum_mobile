import 'package:shared_preferences/shared_preferences.dart'; // import module untuk baca dan tulis Shared Preferences
import 'dart:convert'; // import module untuk mengubah data Shared Preferences yang berupa string menjadi list atau map Dart

class Data {
  // baca data dari smartphone
  static Future<List<dynamic>> getData() async {
    var prefs = await SharedPreferences.getInstance();

    // shared preferences menggunakan format key-value pair
    // untuk membaca data kita perlu memasukkan key pada method getString
    // pastikan key adalah unik, jadi lebih baik gunakan nama domain
    var savedData = prefs.getString('ID.NGASTURI.TUTORIAL.PREF');

    // jika nilai masih null, misal saat pertama kali install
    // kita beri nilai default agar tidak error saat diconvert dengan perintah json.decode
    if (savedData == null) {
      savedData = '[]';
    }
    // data yang disimpan di shared preferences sebaiknya string dengan format JSON
    // agar bisa dengan mudah diolah menjadi list atau map Dart
    return json.decode(savedData);
  }

  static Future<void> saveData(dynamic data) async {
    var prefs = await SharedPreferences.getInstance();

    // untuk menulis data kita memasukkan key dan value
    // value dalam hal ini adalah variabel data yang masih dalam bentuk list atau map
    // jadi perlu diubah jadi string dengan format JSON
    prefs.setString('ID.NGASTURI.TUTORIAL.PREF', json.encode(data));
  }
}
