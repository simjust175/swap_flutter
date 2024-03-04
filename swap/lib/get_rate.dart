import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetRate extends StatefulWidget {
  final Function(int) rateResults;
  final String currency1;
  final String currency2;
  final int total;
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
  String apiKey = '5562c11f84e1689f7b353756';

  Map<String, dynamic> rate = {};

  Future<void> getRate() async {
    var url =
        'https://v6.exchangerate-api.com/v6/$apiKey/pair/${widget.currency1}/${widget.currency2}';
    var parsedUrl = Uri.parse(url);

    var res = await http.get(parsedUrl);
    if (res.statusCode == 200) {
      setState(() {
        rate = json.decode(res.body);
      });
    } else {
      throw Exception("Aw.. Snap🫰");
    }
    //setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.currency1.isNotEmpty &&
        widget.currency2.isNotEmpty &&
        widget.total > 0) {
      getRate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "the rate is ${rate.isNotEmpty ? double.parse(rate["conversion_rate"]) * widget.total : "..."}",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

/*
Container(
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
        child: Column(children: [
          Text(
            "the rate is ${rate.isNotEmpty ? double.parse(rate["conversion_rate"]) * widget.total : "..."}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          FloatingActionButton.extended(
              onPressed: () async{
                    if (widget.currency1.isNotEmpty &&
                        widget.currency2.isNotEmpty &&
                        widget.total > 0)
                      {
                        print("getting there!");
                        await getRate();
                        
                      }
                   
                  },
              label: const Text("Swap"))
        ]));
*/
//.toStringAsFixed(2)