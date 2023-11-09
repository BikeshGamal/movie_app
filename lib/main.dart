import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widget/toprated.dart';
import 'package:movie_app/widget/trending.dart';
import 'package:movie_app/widget/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
void main()
{
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
      primaryColor: Colors.green
      ),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apikey='c62a9c2a38f1362af1aa042e80ec7755';
  final String readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjJhOWMyYTM4ZjEzNjJhZjFhYTA0MmU4MGVjNzc1NSIsInN1YiI6IjY1NDg5MzI4MzkxYjljMDBhZDcyOTE3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G0zPj3IyodQ8GdcM_dIET6uhX6IGLurND630tyfnW4g';
void initState()
{
  loadmovies();
  super.initState();
}
 loadmovies() async{
  TMDB tmdbwithcustomLogs=TMDB(ApiKeys(apikey,readaccesstoken),
  logConfig: ConfigLogger(
      showErrorLogs: true,
    showLogs: true
  )
  );
  Map trendingresult=await tmdbwithcustomLogs.v3.trending.getTrending();
  Map topratedresult=await tmdbwithcustomLogs.v3.movies.getTopRated();
  Map tvresult=await tmdbwithcustomLogs.v3.tv.getPopular();
  setState(() {
    trendingmovies=trendingresult['results'];
    topratedmovies=topratedresult['results'];
    tv=tvresult['results'];
  });
  print(tv);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: ModifiedText(text:"❤Chalchitra Ghar❤️", color: Colors.white, size: 24.0,)),
      ),
      body: ListView(
        children: [
          TV(tv:tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies,)
        ],
      ),
    );
  }
}

