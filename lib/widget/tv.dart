import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/text.dart';
class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text:"Popular TV Shows", color: Colors.pink, size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 207,
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: tv.length,itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: tv[index]['original_name'].toString(),
                              description: tv[index]['overview'].toString(),
                              bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                  tv[index]['backdrop_path'],
                              posterurl: 'http://image.tmdb.org/t/p/w500' +
                                  tv[index]['poster_path'],
                              vote: tv[index]['vote_average'].toString(),
                              launch_on: tv[index]['first_air_date'])));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(
                          width: 250,
                          height:140,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                                  ),fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Container(
                        child: ModifiedText(
                          text: tv[index]['original_name'], color: Colors.white, size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
