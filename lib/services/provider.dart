import 'dart:convert';

import 'package:getworks/models/trabajo.dart';
import 'package:getworks/models/user.dart';
import 'package:http/http.dart' as http;

class Provider {
  Future<List<Trabajo>> getTrabajos() async {
    String url = "https://getworks-api.herokuapp.com/api/Oferta-trabajo";
    final respuesta = await http.get(url);
    final decodedData = jsonDecode(respuesta.body);

    final trabajos = new Trabajos.fromJsonList(decodedData['data']);

    return trabajos.items;
  }

  Future<User> getUser(String id) async {
    String url = "https://getworks-api.herokuapp.com/api/User/${id}";
    final respuesta = await http.get(url);

    final decodedData = jsonDecode(respuesta.body);

    User usuario = new User.fromJson(decodedData['data']);

    return usuario;
  }
}
