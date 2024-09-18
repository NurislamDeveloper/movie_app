import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class UpComing_movies_slider extends StatelessWidget {
  const UpComing_movies_slider({
    super.key,
    required this.snapshot
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              child: SizedBox(
                height: 200,
                width: 150,
                child: Image.network('${ApiConstants.imagePath}${snapshot.data[index].posterPath}'),
              ),
            ),
          );
        },
      ),
    );
  }
}