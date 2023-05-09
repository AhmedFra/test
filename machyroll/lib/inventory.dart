// ignore_for_file: unused_import

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class inventory extends StatefulWidget {
  const inventory({Key? key}) : super(key: key);

  @override
  State<inventory> createState() => _inventoryState();
}

// ignore: camel_case_types
class _inventoryState extends State<inventory> {
  TextStyle linkStyle = const TextStyle(color: Colors.grey, fontSize: 20.0);
  List<String> items = [];

  //fetch data
  Future getItemsIds() async {
    await FirebaseFirestore.instance
        .collection("figures")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                print(doc.reference.id);
                items.add(doc.reference.id);
              })
            });
  }

  @override
  void initState() {
    getItemsIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/pics/bg_alone.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(186, 8, 8, 8),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.local_fire_department_sharp),
                Text("My recommendation"),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.search_rounded,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 60,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: getItemsIds(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(items[index]),
                              );
                            });
                      }))
            ]),
          ),
        ),
      ],
    );
  }
}

Widget itemDisplay(
  String item,
  String image_url,
  Float price,
) {
  return Row(
    children: [
      //  Image.network(item.image_url)
    ],
  );
}
