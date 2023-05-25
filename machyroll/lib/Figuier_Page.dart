import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class FiguierPage extends StatefulWidget {
  final String id;

  const FiguierPage(this.id, {Key? key}) : super(key: key);

  @override
  _FiguierPageState createState() => _FiguierPageState();
}

class _FiguierPageState extends State<FiguierPage> {
  int quantity = 1;
  late dynamic data;
  CollectionReference figure = FirebaseFirestore.instance.collection('figures');
  Future loadData() async {
    return figure.doc(widget.id).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
          future: loadData(),
          builder: (context, snapshot) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            return SafeArea(
              child: Expanded(
                child: SingleChildScrollView(
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
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 25, 24, 28),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        data["title"],
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (quantity >= 2) {
                                              setState(() {
                                                quantity--;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(0.1),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                                CupertinoIcons.minus),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            quantity.toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(0.1),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child:
                                                const Icon(CupertinoIcons.plus),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: data["rating"].toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 25.0,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const Text(
                                    "(255)",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Description:",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["description"][0],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            data["description"][1]!,
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            data["description"][2]!,
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "\$${data['price']}",
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 243, 161, 39),
                                                    fontSize: 30),
                                              ),
                                              const SizedBox(width: 10),
                                              Text("\$${data['sold']}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.red,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationThickness:
                                                          2.0)),
                                            ],
                                          ),
                                          const Text(
                                            "-50% off",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 248, 13, 13),
                                                fontSize: 15),
                                          ),
                                          const Divider(
                                            color: Colors.white,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.local_shipping,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    "Delivery:",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 130,),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                    children: const [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "To El Khroub",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 20,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                "Shiping: \$4.64",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              const Text(
                                                "From Kais Khenchela via Yalidine ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              const Text(
                                                  "Estimated delivery: 20-20 days ,item ships within 7 days ",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              const Divider(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "Service:",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                "3-days Buyer Protection. ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              const Text(
                                                "Get a refund if the item arrives late or not as described. ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "contact Us",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Button 1 onPressed action
                                                _openMaps();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        207, 54, 200, 244),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Button 2 onPressed action
                                                _sendEmail();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              child: const Icon(Icons.email),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Button 3 onPressed action
                                                launchTel();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              child: const Icon(Icons.phone),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Button 4 onPressed action
                                                launchSms();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 59, 72, 255),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              child: const Icon(Icons.sms),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Expanded(
                                            child: Divider(
                                              color: Colors.white,
                                              height: 40,
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Recommendation",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: Colors.white,
                                              height: 40,
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          )
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              data = snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 25, 24, 28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${data["price"] * quantity}",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 81, 248, 75)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Buy Now !",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

Widget makeDesc(List desc) {
  return ListView.builder(
    itemCount: desc.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Text(
            desc[index],
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    },
  );
}

_sendEmail() async {
  // Remplacez l'adresse e-mail du destinataire par la vôtre
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'machyroll@yahoo.com',
  );

  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible d\'ouvrir l\'application de messagerie.';
  }
}

dynamic launchTel() async {
  try {
    Uri telUri = Uri(
      scheme: 'tel',
      path: "+0659717949",
    );
    await launchUrl(telUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}

dynamic launchSms() async {
  try {
    Uri smsUri = Uri(
      scheme: 'sms',
      path: "+0659717949",
    );
    await launchUrl(smsUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}

_openMaps() async {
  // Remplacez les coordonnées par celles de votre choix
  final String coords = "el khroub";

  String url = "https://www.google.com/maps/search/?api=1&query=$coords";
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Impossible d\'ouvrir l\'application de cartographie.';
  }
}
