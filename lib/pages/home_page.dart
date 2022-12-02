import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    Provider.of<MovieProvider>(context, listen: false).getData();
    super.didChangeDependencies();
  }

  late int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        centerTitle: true,
        leading: (page > 1)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      page--;
                      Provider.of<MovieProvider>(context, listen: false)
                          .getData(page: page);
                    });
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              )
            : null,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  page++;
                  Provider.of<MovieProvider>(context, listen: false)
                      .getData(page: page);
                });
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) => provider.hasDataLoaded
            ? ListView.builder(
                itemCount: provider.movieResponse!.data!.movies!.length,
                itemBuilder: (context, index) {
                  final movie =
                      provider.movieResponse!.data!.movies![index];
                  final genresList = movie.genres;
                  final torrentMapList = movie.torrents;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetailsPage.routeName, arguments: movie);
                      },
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.blue,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                      movie.largeCoverImage!),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(movie.year!.toString()),
                                    Wrap(
                                      children: genresList!
                                          .map((e) => Text(
                                                '$e  ',
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Available in: ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: torrentMapList!.map((e) {
                                            return Text(
                                              '${e.quality}  ${e.type} ',
                                              style: const TextStyle(
                                                color: Colors.teal,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.amber.shade300),
                                          child: const Text(
                                            'IMDb',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              movie.rating.toString()),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
