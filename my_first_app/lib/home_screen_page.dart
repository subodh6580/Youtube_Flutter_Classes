import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:my_first_app/homepage.dart';
import 'package:my_first_app/login_screen_page.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _currentIndex = 0;

  final List<String> imagesList = [
    'assets/images/banner/banner_1.jpg',
    'assets/images/banner/banner_2.jpg',
    'assets/images/banner/banner_3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //width: 500,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enlargeFactor: 0.5,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imagesList
                  .map(
                    (item) => Card(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      elevation: 3.0,
                      shadowColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                        /* borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ), */
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            const Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.black45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
