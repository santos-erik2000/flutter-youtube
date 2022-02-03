import 'package:flutter/material.dart';

class TelaInscricao extends StatefulWidget {
  const TelaInscricao({Key? key}) : super(key: key);

  @override
  _TelaInscricaoState createState() => _TelaInscricaoState();
}

class _TelaInscricaoState extends State<TelaInscricao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
