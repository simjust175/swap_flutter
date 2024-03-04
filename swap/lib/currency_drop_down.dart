import 'package:flutter/material.dart';

List<String> currencyList = ['USD', 'EUR', 'ILS', 'GBP', 'CAD', 'AUD', 'CHF'];

class CurrencyDropDown extends StatefulWidget {
  final ValueChanged<String> onCurrencyChanged;
  const CurrencyDropDown({super.key, required this.onCurrencyChanged});

  @override
  State<CurrencyDropDown> createState() => _DropDown();
}

class _DropDown extends State<CurrencyDropDown> {
  String _selectedCurrency = "USD";
  void _selectCurrency(String currencySelection) {
    setState(() {
      _selectedCurrency = currencySelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.lightBlueAccent,
        width: 300,
        color: const Color.fromARGB(255, 214, 214, 214),
        child: DropdownButton<String>(
          value: _selectedCurrency,
          onChanged: (currency) {
            if (currency != null) {
              _selectCurrency(currency);
              widget.onCurrencyChanged(currency);
            }
          },
          items: currencyList.map<DropdownMenuItem<String>>((String currency) {
            return DropdownMenuItem(
                value: currency, child: Container(child: Text(currency)));
          }).toList(),
        ));
  }
}
