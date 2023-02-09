// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbseprovdrtask/model/showdatamodel.dart';
import 'package:firbseprovdrtask/screens/homescreen.dart';
import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  List modellist = [];
  List searchlist = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;// [create a INSTANCE(OBJECT) in firebaseStore]
  String time = DateTime.now().microsecondsSinceEpoch.toString(); //this code is genarate auto id;

//below code is (USER DETAILS ADD AND EDITING)(add function code is typing below)

  void addData(String from, String oldId,String phone,BuildContext context) { //String from, String oldId[editing purpose],String phone,BuildContext context[phone number use cheydondnnariyan]
    Map<String, Object> dataMap = HashMap();
    dataMap["Name"] = NameController.text;
    dataMap["Age"] = AgeController.text;
    dataMap["PhoneNumber"] = PhoneController.text;

    if (from == "edit") {
      db.collection("STUDENTS").where('PhoneNumber', isEqualTo: phone).get().then((value) {
        if (value.docs.isEmpty) {
          db.collection("STUDENTS").doc(time).update(dataMap);

          Navigator.push(
            context,
            MaterialPageRoute(                                                  //Editing
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text("Phone Number Already exist")));
        }
      });
    } else {
      db.collection("STUDENTS").where('PhoneNumber', isEqualTo: phone).get().then((value) {
        if (value.docs.isEmpty) {
          db.collection("STUDENTS").doc(time).set(dataMap);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),                               //adding
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Phone Number Already exist")));
        }
      });
    }


    //below code is

    // void addData() {
    //   String id = DateTime.now().microsecondsSinceEpoch.toString();  //this code is genarate auto id;
    //   Map<String, Object> dataMap = HashMap();
    //   dataMap["Name"] = NameController.text;
    //   dataMap["Age"] = AgeController.text;
    //   dataMap["PhoneNumber"] = PhoneController.text;
    //
    //
    //   db.collection("STUDENTS").doc(id).set(dataMap);
    //   notifyListeners();
    // }

//below code is (DELETE DATAS)
  }
    void deleteData(String id) {
      db.collection("STUDENTS").doc(id).delete();
    }

    //below code is (EDITING TIME WHATS WAS AN EDIT,THAT DATAS HAS SHOWN TEXTFIELD)

    void storing(name, phone, age) {
    modellist.clear();
      db.collection("STUDENTS").get().then((value) {
        NameController.text = name;
        PhoneController.text = phone;
        AgeController.text = age;
      });
    }

    //below code is (FIRESTORE ALL USER DATAS HAS SHOWN IN OUR UI)
    void getdataa() {
      modellist.clear();
      db.collection("STUDENTS").get().then((value) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          modellist.add(
            DetailsModel(
              map["Name"].toString(),
              map["Age"].toString(),
              map["PhoneNumber"].toString(),
              element.id,
            ),
          );
          searchlist = modellist;
          notifyListeners();

          // print(modellist.length.toString() + "ASas");
          //  print(map);
        }
        notifyListeners();
      });
    }

    //below code is Searching

    searchmodel(String type) {
      // searchlist.clear();
      searchlist = modellist
          .where((element) => element.Name!.toLowerCase().contains(type))
          .toList();
      notifyListeners();
    }
  }
