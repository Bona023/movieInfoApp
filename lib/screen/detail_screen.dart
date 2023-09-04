import 'package:flutter/material.dart';
import 'package:movie_info_app/model/movie_detail_model.dart';
import 'package:movie_info_app/service/api_service.dart';

class DetailScreen extends StatefulWidget {
  final num id;
  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movieInfo;
  late Future<List<String>> genreList;

  @override
  void initState() {
    super.initState();
    movieInfo = ApiService.getMoveDetailById(widget.id);
    genreList = ApiService.getGenresById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Back to home",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                blurRadius: 12.0, // shadow blur
                color: Colors.blueGrey.shade600, // shadow color
                offset: const Offset(3.0, 3.0),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: movieInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 40, 72),
                image: DecorationImage(
                  opacity: 0.45,
                  image: NetworkImage(
                    snapshot.data!.poster,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 260,
                    ),
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: FutureBuilder(
                        future: genreList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var genres = snapshot.data!.join(", ");
                            return Text(
                              genres,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                          return const Text(
                            "genre : ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                    const Text(
                      "Story Line",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      snapshot.data!.overview,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                ),
                              ]),
                          child: const Text(
                            "Buy Ticket",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Text(
              "Loading...",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.indigo.shade900,
              ),
            ),
          );
        },
      ),
    );
  }
}
