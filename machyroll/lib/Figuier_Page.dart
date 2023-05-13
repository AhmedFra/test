import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:machyroll/inventory.dart';

class FiguierPage extends StatelessWidget {
  const FiguierPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:Container(
          padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 22,
                                  color: Colors.white,
                                ),

        ) ,
      ),
      body: SafeArea(
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
            Padding(padding: EdgeInsets.only(top :8 ,left :15 ,right : 15),
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
                          color: Color.fromARGB(255, 46, 46, 46),
                        ),
                        
                      ),
                      
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18,horizontal: 70),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text("\$29",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 228, 39, 39),)
                        ),
                        
                      ),
                    )
                    
                  ],
                ),)
              ],
            ),),
            
            
          ],
            
        ),
        ));
    
  }
}
