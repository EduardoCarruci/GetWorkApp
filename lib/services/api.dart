import 'package:flutter/material.dart';
import 'package:getworks/utils/alertas.dart';
import 'package:http/http.dart' as http;

class Services extends StatelessWidget {
  String nombre;
  String nickname;
  String email;
  String password;

  Services(String nombre, String nickname, String email, String password) {
    this.nombre = nombre;
    this.nickname = nickname;
    this.email = email;
    this.password = password;
  }

  void addAspirante(BuildContext context) {
    String url = "https://getworks-api.herokuapp.com/api/User/signin";

    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      "nombre": nombre,
      "nickname": nickname,
      "email": email,
      "password": password
    }).then((response) {
      print("Estatus de la respuesta: ${response.statusCode}");
      print("Respuesta del body: ${response.body}");
      print("${response.body} ");
      AlertFormState().showSaludo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
