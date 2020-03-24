import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getworks/animation/fadeanimation.dart';
import 'package:getworks/models/trabajo.dart';
import 'package:getworks/screens/perfil.dart';
import 'package:getworks/services/provider.dart';
import 'package:getworks/widgets/card_swiper.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final trabajos = new Provider();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/plano.jpg'), fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Busca proyectos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            hintText: "Proyectos con tus Habilidades ..."),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Proyectos Recientes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: makeItem(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.web),
            title: new Text('Panel'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Perfil')),
        ],
        onTap: routeToPage,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.face,
              text: 'Mi Perfil',
            ),
            _createDrawerItem(
              icon: Icons.contacts,
              text: 'Contacto',
            ),
            _createDrawerItem(
              icon: Icons.note,
              text: 'Buscar Trabajo',
            ),
            SizedBox(
              height: 3.0,
              child: Container(
                color: Colors.grey,
              ),
            ),
            _createDrawerItem(icon: Icons.collections_bookmark, text: 'Salir'),
            //_createDrawerItem(icon: Icons.face, text: 'Actores'),
            _createDrawerItem(icon: Icons.exit_to_app, text: 'Cerrar Sesión'),
          ],
        ),
      ),
    );
  }

  void routeToPage(int pageTo) {
    //tabController.animateTo(pageTo);
    //Navigator.of(context).pop();

    setState(() {
      switch (pageTo) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (_) => Perfil()));
          break;

        default:
      }
    });
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/men.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Nombre del Usuario",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900))),
        ]));
  }

  Widget makeItem() {
    return FutureBuilder(
      future: trabajos.getTrabajos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            trabajos: snapshot.data,
          );
        } else {
          return Container(
            height: 200.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
