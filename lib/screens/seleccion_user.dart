import 'package:flutter/material.dart';
import 'package:getworks/animation/fadeanimation.dart';

import 'aspirante.dart';
import 'business.dart';

class Seleccion extends StatefulWidget {
  Seleccion({Key key}) : super(key: key);

  @override
  _SeleccionState createState() => _SeleccionState();
}

class _SeleccionState extends State<Seleccion> {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: _screenHeight,
            width: _screenWidth,
            child: FadeAnimation(
              1.3,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: RaisedButton(
                      splashColor: Colors.blueAccent,
                      color: Colors.white,
                      child: Image(
                        image: AssetImage("assets/user.png"),
                        fit: BoxFit.cover,
                        color: Colors.black,
                        height: 100,
                        width: 100,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Aspirante()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Soy Aspirante",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: RaisedButton(
                      splashColor: Colors.blueAccent,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Business()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "assets/building.png",
                            ),
                            color: Colors.black,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Soy Empresa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
