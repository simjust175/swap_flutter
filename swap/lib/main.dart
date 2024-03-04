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
              alignment: Alignment.bottomLeft,
              child: Image.asset('../assets/images/Swap_green.png', width: 150, height: 100,)),
          ),
          //body: FormAction(),
          body: SwapForm(),
          
        ));
  }
}

// class FormAction extends StatefulWidget {
//    @override
//    State<FormAction> createState()=> _FormActionState();
// }

// class _FormActionState extends State<FormAction> {
//   String currency1= '';
//   String currency2= '';
//   int total = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             color: const Color.fromARGB(31, 233, 161, 161),
//             child:Row(
//             children: [
//               SwapForm(
//                 onSwap: (currency1, currency2, amount){
//                   setState(() {
//                     currency1 = currency1;
//                     currency2 = currency2;
//                     total = amount;
//                   });
//                 },
//               ),
//               if(total > 0) GetRate(currency1: currency1, currency2: currency2, total: total)
//             ],
//           ));
//   }
// }
