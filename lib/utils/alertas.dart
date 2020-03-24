import 'package:flutter/material.dart';

class AlertForm extends StatefulWidget {
  @override
  AlertFormState createState() => AlertFormState();
}

class AlertFormState extends State<AlertForm> {
  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(
                // Aligns the container to center
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                // A simplified version of dialog.
                width: 230, //ancho
                height: 250, // alto
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Datos Incorrectos",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Image(
                        image: AssetImage('assets/200.gif'),
                        fit: BoxFit.contain,
                      ),
                    )),
                  ],
                ),
              ),
            )));
  }

  void showSaludo(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(
                // Aligns the container to center
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                // A simplified version of dialog.
                width: 230, //ancho
                height: 250, // alto
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Aspirante Registrado",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Image(
                        image: AssetImage('assets/tenor.gif'),
                        fit: BoxFit.cover,
                      ),
                    )),
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
