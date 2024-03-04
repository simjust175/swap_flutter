import 'package:flutter/material.dart';

class DisplayTotal extends StatelessWidget {
  final int total;
  final int rate;
  const DisplayTotal({super.key, this.total = 0, this.rate = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 221, 235, 241),
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Text(
          "the rate is ${total > 0 ? total * rate : "..."}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}