import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/constants/size_of_texts.dart';
import 'package:movie_app/core/constants/text_constants.dart';
import 'package:movie_app/data/models/movies.dart';
import 'package:movie_app/presentetion/widgets/top_rated_movies.dart';
import 'package:movie_app/presentetion/widgets/trending_movies.dart';
import 'package:movie_app/presentetion/widgets/up_coming_movies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovies;
  late Future<List<Movies>> upComingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRated();
    upComingMovies = Api().getUpComing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        'assets/netflix.png',
        fit: BoxFit.cover,
        height: 80,
        filterQuality: FilterQuality.high,
      ),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 Texts.trendingMovies,
                style: SizeOfTexts.textStyle,
              ),
              const Gap(
                20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Trending_movies_slider(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              // const Trending_movies_slider(),
              const Gap(
                20,
              ),
              Text(
               Texts.topRatedMovies,
                style: SizeOfTexts.textStyle,
              ),
              const Gap(
                20,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Top_rated_movies_slider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              //  Top_rated_movies_slider(),
              const Gap(
                20,
              ),
              Text(
                 Texts.upcomingMovies,
                style: SizeOfTexts.textStyle,
              ),
              const Gap(
                20,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return UpComing_movies_slider(
                        snapshot: snapshot,
                      );
                    } else {
                      return  const Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

