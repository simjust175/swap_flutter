import 'package:flutter/material.dart';
import 'swap_form.dart';
import 'get_rate.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main(){
  //await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Swap with Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            //title: const Text("Swap"),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('../assets/images/Swap_green.png', width: 150, height: 100,)),
          ),
          //body: FormAction(),
          body: const SwapForm(),
          
        ));
  }
}

