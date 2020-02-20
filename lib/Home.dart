import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {



    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
            width: 98,
            height: 22,

        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async{
              String res = await showSearch(context: context,
                  delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                title: Text("Início"),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot),
              ),
              BottomNavigationBarItem(
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions),
              ),
              BottomNavigationBarItem(
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder),
              ),

            ]
      ),
    );
  }
}
