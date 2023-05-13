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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  itemDisplay(
                                      //dakhal les information manually hnaya b tartib t3 al function li mn ta7t b3d
                                      "Demon Slayer The Movie: Mugen Train - Akaza Figure",
                                      "Size approx: 9” inches tall",
                                      "https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwbd5b458b/images/6610071781420-1-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634693271596.jpg",
                                      20.00,
                                      29.99,
                                      "in Stock"),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
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

Widget itemDisplay(String title, String description, String imageUrl,
    double price, double sold, String state) {
  return Row(
    children: [
      SizedBox(
        width: 50,
        height: 50,
        child: Image.network(imageUrl),
      ),
      Column(
        children: [
          Text(title),
          Text(description),
          Text(price.toString()),
          Text(sold.toString()),
          Text(state),
        ],
      )
    ],
  );
}
