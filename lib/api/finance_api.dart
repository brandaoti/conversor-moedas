import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FinanceApi {
  // Definir url da api
  static const url = "https://api.hgbrasil.com/finance?key=7d3ad237";

  Future<Map> getDate() async {
    
    http.Response response = await http.get(url);
    // print(response.body); // Está funcionando!
    var decode = json.decode(response.body);

    return decode;
  }
}
