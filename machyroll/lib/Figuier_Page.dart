import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:machyroll/inventory.dart';

class FiguierPage extends StatelessWidget {
  String id;
  dynamic data;
  FiguierPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference figure =
        FirebaseFirestore.instance.collection('figures');

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 24, 28),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 25, 24, 28),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder(
            future: figure.doc(id).get(),
            builder: (context, snapshot) {
              data = snapshot.data!.data() as Map<String, dynamic>;
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 1.7,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: [
                        data["imageUrl"],
                        "https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwe04d56bc/images/6610071781420-5-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28718420623404.jpg",
                        "https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwa6a01a8d/images/6610071781420-3-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634348388396.jpg",
                        "https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dw57a9d791/images/6610071781420-7-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634102693932.jpg",
                        // Add more image URLs here
                      ].map((imageUrl) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    data["title"],
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromARGB(255, 46, 46, 46),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 70),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("\$${data["price"].toString()}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromARGB(255, 228, 39, 39),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
