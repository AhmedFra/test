import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class FiguierPage extends StatelessWidget {
  const FiguierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(186, 8, 8, 8),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
           
      // Handle button press
      },
    ),

        title: Text('Details'),
      ),
      body: Stack(
        children: [
          Image.asset(
          'assets/pics/bg_alone.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: [
          
              CarouselSlider(
              items: [
                Image.network('https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwbd5b458b/images/6610071781420-1-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634693271596.jpg'),
                Image.network('https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwe04d56bc/images/6610071781420-5-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28718420623404.jpg'),
                Image.network('https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwa6a01a8d/images/6610071781420-3-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634348388396.jpg'),
                Image.network("https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dw57a9d791/images/6610071781420-7-ultra-tokyo-connection-pvc-scale-figures-demon-slayer-the-movie-mugen-train-akaza-figure-28634102693932.jpg"),
              ],
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}
