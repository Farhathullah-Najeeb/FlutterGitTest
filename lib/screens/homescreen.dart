// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:firbseprovdrtask/provider.dart';
import 'package:firbseprovdrtask/screens/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderClass get = Provider.of<ProviderClass>(context, listen: false);
    get.getdataa();//ivde get data vilichale pagel datal adhyam thanne varu

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondScreen(from: "new", oldId: "")));//ivide new k pakaram edit anel kodthirunnel edit function work avm..bcz edit nn pass cheydal edit option work avananu providerl code
        },
        isExtended: true,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 40),
            child: TextField(
              onChanged: (typ){get.searchmodel(typ);},
              decoration: InputDecoration(
                  hintText: "SEARCH",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.redAccent))),
            ),
          ),
          Expanded(
            child: Consumer<ProviderClass>(builder: (context, value, child) {
              // value.getdataa();
              return value.searchlist.isNotEmpty? ListView.builder(//value.searchlist.isNotEmpty[search listil search value ndo ennariyan],else ettom thazhe
                itemCount: value.searchlist.length,
                itemBuilder: (context, index) {
                  var item = value.searchlist[index]; //varieble declaration

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Alert Dialog Box"),
                            content: const Text(
                                "You have raised a Alert Dialog Box"),
                            actions: <Widget>[
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.storing(item.Name, item.Phonenumber,
                                          item.Age);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondScreen(
                                                      from: 'edit',//edit pass cheydond edit function worck cheyyanu[bcz provideril aggananu pass cheyde]
                                                      oldId: item.id.toString())));
                                    },
                                    child: Container(
                                      color: Colors.blue,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text(
                                        "EDIT",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // print(item.id);
                                      value.deleteData(item.id);
                                      value.getdataa();
                                    },
                                    child: Container(
                                      color: Colors.blue,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<ProviderClass>(
                                builder: (context, value, child) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text(
                                      "Name:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80),
                                    child: Text(
                                      value.modellist[index].Name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            Consumer<ProviderClass>(
                                builder: (context, value, child) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text(
                                      "Phone Number :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text(
                                      value.modellist[index].Phonenumber
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            Consumer<ProviderClass>(
                                builder: (context, value, child) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text("Age:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 93),
                                    child: Text(
                                      value.modellist[index].Age.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ):Center(child: Text('Value is Empty'));
            }),
          ),
        ],
      ),
    );
  }
}
