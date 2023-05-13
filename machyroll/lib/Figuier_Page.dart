import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:machyroll/inventory.dart';

class FiguierPage extends StatelessWidget {
  const FiguierPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 24, 28),
        leading:Container(
          
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 22,
                                  color: Colors.white,
                                ),

        ) ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.7,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  items: [
                    "https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwbd5b458b/images/6610071781420-1-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634693271596.jpg",
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
                
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height,
                
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 24, 28),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: Padding(padding: EdgeInsets.only(top :8 ,left :15 ,right : 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(right:8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Demon Slayer The Movie: Mugen Train - Akaza Figure",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            
                          ),
                          
                        ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon( CupertinoIcons.minus),
                          ),
                          Container(
                            margin:EdgeInsets.symmetric(horizontal: 10) ,
                            child: Text(
                              "01",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0.1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon( CupertinoIcons.plus),
                          ),
                        ],
                      )
                      ],
                      
                    ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25.0,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text("(255)",style: TextStyle(
                        color: Colors.white,
                      ),)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                        Text("Description:",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("-Size approx: 9” inches tall",style: TextStyle(color: Colors.white,fontSize:15),),
                            Text("-Material: PVC",style: TextStyle(color: Colors.white,fontSize:15),),
                            Text("-Manufacturer: SEGA",style: TextStyle(color: Colors.white,fontSize:15),),
                            SizedBox(height: 15,),
                            Row(children: [
                              Text("\$15.00",style: TextStyle(color: Color.fromARGB(255, 243, 161, 39),fontSize: 30),),
                              SizedBox(width: 10),
                          Text("\$29.99",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.0)),
                                  

                            ],),
                            Text("-50% off",style: TextStyle(color: Color.fromARGB(255, 248, 13, 13),fontSize: 15),)
                          ],
                        ),
                        

                      
                      ]),)
                  ],
                ),),
              ),
              
              
            ],
              
          ),
        ),
        ),
        bottomNavigationBar: BottomAppBar(
          
          child: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 43, 43),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$15",style: TextStyle(
                    fontSize :25,
                    fontWeight: FontWeight.bold,
                    color :Color.fromARGB(255, 81, 248, 75)
                  ),
                  
                ),
                InkWell(
                  onTap:() {
                    
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15 ,horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size :28,
                        ),
                        SizedBox(width: 5,),
                        Text("Add to Cart", style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),)

                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        )
         ,);
    
  }
}
