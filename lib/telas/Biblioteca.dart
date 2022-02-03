import 'package:flutter/material.dart';

class TelaBiblioteca extends StatefulWidget {
  const TelaBiblioteca({Key? key}) : super(key: key);

  @override
  _TelaBibliotecaState createState() => _TelaBibliotecaState();
}

class _TelaBibliotecaState extends State<TelaBiblioteca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Biblioteca",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
