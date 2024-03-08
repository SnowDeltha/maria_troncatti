import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../util/AulasModelos.dart';
import '../model/apirespuesta.dart';
import '../../config/constants/environment.dart';
//import 'package:maria_troncatti/lib/config/constants/environment.dart';




/* class CallApi {
    final String Environment.mainUrl = 'http://192.168.1.7:8000/api/';
    postData(data, apiUrl) async {
    var fullUrl = Environment.mainUrl + apiUrl  ;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
    } 
  Future<ApiRespuesta> getCategoria(apiUrl) async {
    ApiRespuesta apiRespuesta = ApiRespuesta();
    try {
      var fullUrl = Environment.mainUrl + apiUrl;
      String token = await guardarToken();
      final respuesta = await http.get(Uri.parse(fullUrl), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      switch (respuesta.statusCode) {
        case 200:
          apiRespuesta.data = jsonDecode(respuesta.body)['data']
              .map((p) => Aulas.fromJson(p))
              .toList();
          apiRespuesta.data as List<dynamic>;
          break;
      }
    } catch (e) {
      apiRespuesta.error = serverError;
    }
    return apiRespuesta;
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
} */

/* Future<String> guardarToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('access_token') ?? '';
} */


const serverError = 'Server error';
const datosVacios = "No existe datos";
const unauthorized = 'Unauthorized';
const somethingWentWrong = "Error del servidor";


class CallApi{

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getMainToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?access_token=$token';
  }

  getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    return '?user=$user';
  }

  
  
  // Servidor local
  final String _url = 'http://192.168.1.7:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  putData(data, apiUrl, id) async {
    var fullUrl = Environment.mainUrl + apiUrl + id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return await http.put(Uri.parse(fullUrl), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  getData(apiUrl) async {
    var fullUrl = Environment.mainUrl + apiUrl;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('access_token');
    return await http.get(Uri.parse(fullUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }







 




  Future<ApiRespuesta> getRegistros(apiUrl) async {
    ApiRespuesta apiRespuesta = ApiRespuesta();
    try {
      var fullUrl = Environment.mainUrl + apiUrl;
      //var token = await guardarToken();
      final respuesta = await http.get(Uri.parse(fullUrl), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      switch (respuesta.statusCode) {
        case 200:
          apiRespuesta.data = jsonDecode(respuesta.body)['data']
              .map((p) => Aulas.fromJson(p))
              .toList();
          apiRespuesta.data as List<dynamic>;
          break;
        case 401:
          apiRespuesta.error = unauthorized;
          break;
        case 204:
          apiRespuesta.error = datosVacios;
          break;
        default:
          apiRespuesta.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiRespuesta.error = serverError;
    }
    return apiRespuesta;
  }






 Future<ApiRespuesta> getAulas(apiUrl) async {
    ApiRespuesta apiRespuesta = ApiRespuesta();
    try {
      var fullUrl = Environment.mainUrl + apiUrl;
      //var token = await guardarToken();
      final respuesta = await http.get(Uri.parse(fullUrl), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      switch (respuesta.statusCode) {
        case 200:
          apiRespuesta.data = jsonDecode(respuesta.body)['data']
              .map((p) => Aulas.fromJson(p))
              .toList();
          apiRespuesta.data as List<dynamic>;
          break;
        case 401:
          apiRespuesta.error = unauthorized;
          break;
        case 204:
          apiRespuesta.error = datosVacios;
          break;
        default:
          apiRespuesta.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiRespuesta.error = serverError;
    }
    return apiRespuesta;
  }



  Future<String> guardarToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('access_token') ?? '';
}



}







