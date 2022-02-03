import 'package:flutter/material.dart';
import 'package:youtube/CustomSearhDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class TelaPrincipal extends StatefulWidget {

  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  int _indexAtual = 0;
  String res ="";


  @override
  Widget build(BuildContext context) {

    List<Widget> _listaTelas = [
      TelaInicio(res),
      TelaEmAlta(),
      TelaInscricao(),
      TelaBiblioteca()
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? resultado = await showSearch(context: context, delegate: CustomSearhDelegate());
                setState(() {
                  res = resultado!;
                });
              },
              icon: Icon(Icons.search)),
          /* IconButton(
              onPressed: () {
                print("Acão Video");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("Ação: Conta Circle");
              },
              icon: Icon(Icons.account_circle)) */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _listaTelas[_indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: (index) {
          setState(() {
            _indexAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Início"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text("Em alta"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text("Inscrições"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text("Biblioteca"),
          ),
        ],
      ),
    );
  }
}
