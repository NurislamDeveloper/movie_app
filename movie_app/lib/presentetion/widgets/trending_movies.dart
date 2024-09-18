import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class Trending_movies_slider extends StatelessWidget {
  const Trending_movies_slider({
    super.key,
    required this.snapshot
  });
 final AsyncSnapshot  snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          viewportFraction: 0.55,
          autoPlayAnimationDuration: const Duration(
            seconds: 1,
          ),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
        itemBuilder:
            (BuildContext context, int index, int realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                '${ApiConstants.imagePath}${snapshot.data[index].posterPath}',
                filterQuality: FilterQuality.high,
                fit:   BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
