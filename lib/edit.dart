// import 'package:firbseprovdrtask/provider.dart';
// import 'package:firbseprovdrtask/shortcuts/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class edit extends StatelessWidget {
//   const edit({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//       body: Column(
//       children: [
//       Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Consumer<ProviderClass>(
//               builder: (context, value, child) {
//                 return Column(
//                   children: [
//                     TextFiels(
//                         Htext: "NAME",
//                         cntrl: value.NameController,
//                         txtTyp: TextInputType.text, maxLength:TextField.noMaxLength
//                     ),
//                     TextFiels(
//                       Htext: "PHONE NUMBER",
//                       cntrl: value.PhoneController,
//                       txtTyp: TextInputType.number, maxLength: 10,
//                     ),
//                     TextFiels(
//                       Htext: "AGE",
//                       cntrl: value.AgeController,
//                       txtTyp: TextInputType.number, maxLength: 2,
//                     ),
//                   ],
//                 );
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Container(
//                 height: 40,
//                 width: 100,
//                 color: Colors.blue,
//                 child: Consumer<ProviderClass>(
//                   builder: (context, val, child) {
//                     return InkWell(
//                       child: Center(
//                           child: Text(
//                             "SUBMIT",
//                             style: TextStyle(color: Colors.white),
//                           )),
//                       onTap: () {
//                         val.updateData();
//                         val.getdataa();
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )
//       ],
//       ),
//       ),
//     );
//   }
// }
