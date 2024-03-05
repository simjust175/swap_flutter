import 'package:flutter/material.dart';

class DisplayTotal extends StatelessWidget {
  final double total;
  final double rate;
  final String currency;
  const DisplayTotal(
      {super.key, required this.total, this.rate = 0, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 280,
        decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 221, 235, 241),
          color: const Color.fromARGB(255, 127, 218, 209),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(child: Text(
          "The rate is ${total == 0 ? "..." : "${double.parse(total.toStringAsFixed(5))} $currency"}",
          style: const TextStyle(fontSize: 20)),
        ));
  }
}
