import 'package:flutter/material.dart';
import 'package:getworks/animation/fadeanimation.dart';
import 'package:getworks/screens/inicio.dart';

import 'package:getworks/utils/clipper.dart';

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
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
              FadeAnimation(
                1.3,
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
              ),
              FadeAnimation(
                1.3,
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
                      buildTextField("Rif"),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildTextField("Nombre"),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildTextField("Numero de Contacto"),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildTextField("Direccion"),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildTextField("Descripcion"),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            padding: EdgeInsets.only(
                                top: 12.0,
                                bottom: 12.0,
                                right: 110.0,
                                left: 110.0),
                            child: Text(
                              "Registrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            },
                          ),
                        ),
                      ),
                      //buildButtonContainer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
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

  Widget buildButtonContainer() {
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      },
    );
  }
}
