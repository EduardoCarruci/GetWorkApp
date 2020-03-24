import 'package:flutter/material.dart';
import 'package:getworks/principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'GetWork',
        initialRoute: 'principal',

        //MAPA DE RUTAS
        routes: {
          'principal': (BuildContext context) => Principal(),
        });
  }
}
