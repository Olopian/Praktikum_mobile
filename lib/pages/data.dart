import 'package:shared_preferences/shared_preferences.dart'; // import module untuk baca dan tulis Shared Preferences
import 'dart:convert'; // import module untuk mengubah data Shared Preferences yang berupa string menjadi list atau map dart

class Data {
  // Metode untuk membaca data dari smartphone
  static Future<List<dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Membaca data dengan key tertentu dari SharedPreferences
    var savedData = prefs.getString('ID.NGASTURI.TUTORIAL.PREF');
    
    // Jika nilai masih null, misal saat pertama kali install, beri nilai default
    if (savedData == null) {
      savedData = '[]'; // Nilai default berupa list kosong dalam format JSON
    }
    
    // Mengubah string JSON menjadi list atau map dart
    return json.decode(savedData);
  }

  // Metode untuk menyimpan data ke smartphone
  static Future<void> saveData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Menyimpan data sebagai string JSON di SharedPreferences
    prefs.setString('ID.NGASTURI.TUTORIAL.PREF', json.encode(data));
  }
}
