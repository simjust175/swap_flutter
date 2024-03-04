import 'package:flutter/material.dart';
import './currency_drop_down.dart';
import './get_rate.dart';
import './display_total.dart';

class SwapForm extends StatefulWidget {
  //final Function(String, String, int) onSwap;
  //const SwapForm({super.key, required this.onSwap});
  const SwapForm({super.key});

  @override
  State<SwapForm> createState() => _FormArea();
}

class _FormArea extends State<SwapForm> {
  String currency1 = '';
  String currency2 = '';
  int total = 0;
  dynamic rate = 0;

  final TextEditingController _amountController = TextEditingController();

  void updateCurrency(String currency, int currencyNumber) {
    setState(() {
      currencyNumber == 1 ? currency1 = currency : currency2 = currency;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   color: Colors.red,
                //     child: ),
                DisplayTotal(total: total, rate: rate),
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
                FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        total = int.parse(_amountController.text);
                        GetRate(
                          currency1: currency1,
                          currency2: currency2,
                          total: total,
                          rateResults: (rating) {
                            print("totototot $rating");
                            // setState(() {
                            // rate = total;
                            // });
                          },
                        );
                      });
                    },
                    label: const Text("Swap rates",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)))
              ],
            )));
  }
}
