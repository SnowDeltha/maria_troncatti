import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

 String servidor = "http://127.0.0.1:8000";


const serverError = 'Server error';
const datosVacios = "No existe datos";
const unauthorized = 'Unauthorized';
const somethingWentWrong = "Error del servidor";

class CallApi {
    final String _url = 'http://127.0.0.1:8000/api/';


    postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl ;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }
   _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('access_token');
    return '?access_token=$token';
  }

}
