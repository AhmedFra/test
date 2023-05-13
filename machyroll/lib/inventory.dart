import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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
          backgroundColor:Color(0xff232227),
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
            child: SafeArea(
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
                                        SizedBox(height: 20,)
                                  ],
                                );
                              });
                        }))
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

Widget itemDisplay(String title, String description, String imageUrl,
    double price, double sold, String state) {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        SizedBox(
          width: 130,
          height: 130,
          child: Image.network(imageUrl),
          ),
          
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(fontSize: 17),),
              Text(description),
               RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Row(
                children: [
                  Text(price.toString(),style: TextStyle(fontSize: 16,color: Colors.green)),
                  SizedBox(width: 10),
                  Text(sold.toString(),style: TextStyle(fontSize: 16,color: Colors.red,decoration: TextDecoration.lineThrough,decorationThickness: 2.0)),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 163, 59),
                      borderRadius: BorderRadius.circular(5.0),
                     ),
                    
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      child: Text(state,style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12.0,
                      ),),
                    ),
                ],
              ),
              
            ],
          ),
        )
      ],
    ),
  );
}