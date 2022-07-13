import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:try_amazon_app/constants/global_variable.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // image slider
    return CarouselSlider(
      // images from global variable assets
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
            height: 200,
          ),
        );
      }).toList(),
      // image to fit screens
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
