import 'package:flutter/material.dart';

class TelaEmAlta extends StatefulWidget {
  const TelaEmAlta({Key? key}) : super(key: key);

  @override
  _TelaEmAltaState createState() => _TelaEmAltaState();
}

class _TelaEmAltaState extends State<TelaEmAlta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Em Alta",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
