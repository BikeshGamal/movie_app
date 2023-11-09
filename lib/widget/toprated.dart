import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/text.dart';
class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({super.key, required this.toprated});@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:"Top Rated Movies", color: Colors.pink, size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: toprated.length,itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: toprated[index]['title'] ,
                              description: toprated[index]['overview'],
                              bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                  toprated[index]['backdrop_path'],
                              posterurl: 'http://image.tmdb.org/t/p/w500' +
                                  toprated[index]['poster_path'],
                              vote: toprated[index]['vote_average'].toString(),
                              launch_on: toprated[index]['release_date'])));
                },
                child: toprated[index]['title']!=null?Container(
                  width: 140,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(
                          height:200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                  )
                              )
                          ),
                        ),
                      ),
                      Container(
                        child: ModifiedText(
                          text: toprated[index]['title'], color: Colors.white, size: 16,
                        ),
                      )
                    ],
                  ),
                ):Container(),
              );
            }),
          )
        ],
      ),
    );
  }
}
