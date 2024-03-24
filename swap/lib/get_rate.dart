import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetRate extends StatefulWidget {
  final Function(double) rateResults;
  final String currency1;
  final String currency2;
  final double total;
  const GetRate(
      {super.key,
      required this.currency1,
      required this.currency2,
      required this.total,
      required this.rateResults});

  @override
  State<GetRate> createState() => _GetRateState();
}

class _GetRateState extends State<GetRate> {
  //dynamic apiKey = dotenv.env['API_KEY'];
  String apiKey = ''; //get you Api key on https://app.exchangerate-api.com/sign-up

  Map<String, dynamic> rate = {};

  Future<void> getRate() async {
    var url =
        'https://v6.exchangerate-api.com/v6/$apiKey/pair/${widget.currency1}/${widget.currency2}';
    var parsedUrl = Uri.parse(url);

    var res = await http.get(parsedUrl);
    if (res.statusCode == 200) {
      setState(() {
        rate = json.decode(res.body);
        print('the rate is: ${rate["conversion_rate"]}');
        widget.rateResults(rate["conversion_rate"]);
      });
    } else {
      throw Exception("Aw.. Snap🫰");
    }
  }

  @override
  Widget build(BuildContext context) {

  return GestureDetector(
    onTap: ()=> getRate(),
    child: Ink(
    color: Colors.teal,
    width: 250,
    child: Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(8),
    color: Colors.teal,
    child: InkWell(
      onTap: () => getRate(),
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 250,
        height: 56.0,
        child: Center(child: Text("Get rate in ${widget.currency2}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),)),
      ),
    ),
  ),));
}
}