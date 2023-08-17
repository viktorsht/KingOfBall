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
    return Column(
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
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}