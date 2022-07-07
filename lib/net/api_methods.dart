import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getPrice(String id) async {
  try {
    // var url = "https://coingecko.p.rapidapi.com/simple/price$id";
    var response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=$id&vs_currencies=inr'));
    var json = jsonDecode(response.body);
    var value = json[id]['inr'];
    return double.parse(value.toString());
  } catch (e) {
    // print(e.toString());
    return 0;
  }
}
