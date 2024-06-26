import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hotel.dart';

class HotelService {
  static Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(
      Uri.parse('https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('data')) {
        List<dynamic> hotelsJson = jsonResponse['data'];
        return hotelsJson.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected JSON format');
      }
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
