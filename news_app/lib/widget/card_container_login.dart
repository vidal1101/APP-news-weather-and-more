import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget childcard;

  const CardContainer({key,  this.childcard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _bodyCardDecoration(),
        child: childcard,
      ),
    );
  }

  BoxDecoration _bodyCardDecoration ()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(10, 0),
      )
    ]

  );
}