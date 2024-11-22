import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/back_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movies});
  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.medium(
          leading: const Backbutton(),
          backgroundColor: Colours.scaffoldBgColor,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft:  Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagepath}${movies.poster_path}',
                  filterQuality: FilterQuality.high,
                  fit:BoxFit.fill,
                ),
              ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:const  EdgeInsets.all(12),
            child :Column(
              children: [
                Text("Overview",style:GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                )),
                const SizedBox(height: 16),
                Text(movies.overview,
                style:GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                )),
                const SizedBox(height: 16),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text("Release date:",style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                          Text(
                            movies.release_date,
                            style: GoogleFonts.roboto(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius:BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text("Rating:",style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                           const Icon(
                            Icons.star,
                            color: Colors.amber,
                            ),
                           Text('${movies.vote_average.toStringAsFixed(1)}/10',
                           style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                           ),
                           ),
                        ],
                      ),
                    )
                  ],),
                )
              ],
            )),
        )
      ],),

      );
  }
}

