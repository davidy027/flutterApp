import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = "identitytoolkit.googleapis.com";
  final String _firebaseToken = "AIzaSyApGkeDOwWwMkHGGHL-suZu8Ai5TPnEzcw";

  final storage = FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    // se crea la petición
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    //Se configura la Url donde se va a pedir la petición
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    //Se espera la respuesta
    final resp = await http.post(url, body: json.encode(authData));

    //se mapea la respuesta
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey("idToken")) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    // se crea la petición
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    //Se configura la Url donde se va a pedir la petición
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    //Se espera la respuesta
    final resp = await http.post(url, body: json.encode(authData));

    //se mapea la respuesta
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey("idToken")) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token')?? '';
  }

}
