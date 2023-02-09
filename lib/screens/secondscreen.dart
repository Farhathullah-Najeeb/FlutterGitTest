// ignore_for_file: unused_import, prefer_const_constructors, must_be_immutable
import 'package:firbseprovdrtask/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
import '../shortcuts/textfield.dart';

class SecondScreen extends StatelessWidget {
  String from;
  String oldId;

  SecondScreen({super.key, required this.from, required this.oldId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Consumer<ProviderClass>(
                    builder: (context, vaue, child) {
                      return Column(
                        children: [
                          TextFiels(
                              Htext: "NAME",
                              cntrl: vaue.NameController,
                              txtTyp: TextInputType.text,
                              maxLength: TextField.noMaxLength),
                          TextFiels(
                            Htext: "PHONE NUMBER",
                            cntrl: vaue.PhoneController,
                            txtTyp: TextInputType.number,
                            maxLength: 10,
                          ),
                          TextFiels(
                            Htext: "AGE",
                            cntrl: vaue.AgeController,
                            txtTyp: TextInputType.number,
                            maxLength: 2,
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.blue,
                      child: Consumer<ProviderClass>(
                        builder: (context, val, child) {
                          return InkWell(
                            child: Center(
                                child: Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            )),
                            onTap: () {
                              // val.getdataa();

                              val.addData(from, oldId, val.PhoneController.text,context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
