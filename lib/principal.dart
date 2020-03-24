import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getworks/models/user.dart';
import 'package:getworks/screens/inicio.dart';
import 'package:getworks/screens/seleccion_user.dart';
import 'package:getworks/services/provider.dart';
import 'package:getworks/utils/alertas.dart';
import 'package:getworks/utils/clipper.dart';
import 'package:http/http.dart' as http;

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController _controlleremail = new TextEditingController();
  TextEditingController _controllerpassword = new TextEditingController();
  final user = new Provider();
  User usuario = new User();
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 320,
                //width: screenWidth,
                child: ClipPath(
                  clipper: Clipper(),
                  child: Container(
                    width: screenWidth,
                    height: 320.0,
                    child: Stack(children: <Widget>[
                      Image.asset(
                        "assets/ui.jpg",
                        fit: BoxFit.cover,
                        height: screenHeight,
                        width: screenWidth,
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                //color: Colors.red,
                //height: screenHeight,
                //width: screenWidth,
                padding: EdgeInsets.only(
                    top: 0.0, right: 20.0, left: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'GetWork',
                      style: TextStyle(
                          //backgroundColor: Colors.red,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    buildTextField("Correo", 30, _controlleremail),
                    SizedBox(
                      height: 20.0,
                    ),
                    buildTextField("Contraseña", 20, _controllerpassword),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Olvidaste tu contraseña?",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    buildButtonContainer(context),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("No posees una cuenta?"),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Seleccion()));
                              },
                              child: Text("Registrate",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String hintText, int largo, TextEditingController controlador) {
    return TextField(
      maxLength: largo,
      controller: controlador,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Correo" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Contraseña"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  void _logindata(BuildContext context) async {
    String url = "https://getworks-api.herokuapp.com/api/User/login";

    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      "email": _controlleremail.text,
      "password": _controllerpassword.text,
    }).then((response) async {
      if (response.statusCode == 201) {
        print("usuario correcto");
        print(response.body);
        final decodedData = jsonDecode(response.body);
        final variable = new User.mapeado(decodedData['data']);
        print(variable.id.toString());
        usuario = await user.getUser(variable.id.toString());

        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        print("usuario invalido");
        _controllerpassword.clear();
        //_alerta(context);
        AlertFormState().showDialogBox(context);
      }
    });
  }

  Widget buildButtonContainer(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
              colors: [Color(0xFFFB415B), Color(0xFFEE5623)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Center(
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      onTap: () {
        _logindata(context);
      },
    );
  }
}
