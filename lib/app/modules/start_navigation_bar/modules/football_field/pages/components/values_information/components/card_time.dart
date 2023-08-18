import 'package:flutter/material.dart';

class CardTime extends StatelessWidget {
  
  final String price;
  final String text;

  const CardTime({
    super.key, 
    required this.price, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'B\$ $price', 
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          text, 
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}