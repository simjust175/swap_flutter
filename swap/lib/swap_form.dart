import 'package:flutter/material.dart';
import './currency_drop_down.dart';
import './get_rate.dart';
import './display_total.dart';

class SwapForm extends StatefulWidget {
  const SwapForm({super.key});

  @override
  State<SwapForm> createState() => _FormArea();
}

class _FormArea extends State<SwapForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String currency1 = '';
  String currency2 = '';
  double total = 0;
  double rate = 0;

  final TextEditingController _amountController = TextEditingController();

  void updateCurrency(String currency, int currencyNumber) {
    setState(() {
      currencyNumber == 1 ? currency1 = currency : currency2 = currency;
    });
  }

  void _updateTotal(double newRate){
    setState(() {
      rate = newRate;
      total = rate * double.parse(_amountController.text);
      print("the final rate is $total");
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.only(right: 50, left: 50),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 235, 241),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DisplayTotal(total: total, rate: rate, currency: currency2,),
                Container(
                  color: const Color.fromARGB(255, 214, 214, 214),
                  width: 300,
                  //padding: const EdgeInsets.only(right: 5, left: 5),
                  child: TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      // hintText: 'Enter Amount',
                      labelText: 'Enter Amount:',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value != null && value.isNotEmpty) {
                        final numericRegex =
                            RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                        if (!numericRegex.hasMatch(value)) {
                          return 'Only numbers can be inputted';
                        }
                        print("key: $_formKey");
                      }
                      return null;
                    },
                  ),
                ),
                CurrencyDropDown(onCurrencyChanged: (newCurrency) {
                  updateCurrency(newCurrency, 1);
                }),
                CurrencyDropDown(onCurrencyChanged: (newCurrency) {
                  updateCurrency(newCurrency, 2);
                }),
                GetRate(
                    currency1: currency1,
                    currency2: currency2,
                    total: total,
                    rateResults: (rate) {
                      _updateTotal(rate);
                    })
              ],
            ))));
  }
}
