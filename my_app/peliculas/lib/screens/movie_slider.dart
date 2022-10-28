import 'package:flutter/material.dart';
import 'package:peliculas/themes/app_theme.dart';

import '../models/models.dart';

class MovieWidget extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieWidget(
      {super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 50) {
        fetchData();
        
      }
      
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    widget.onNextPage();
    

    isLoading = false;


    scrollController.animateTo(scrollController.position.pixels-75, duration: const Duration(microseconds:300), curve: Curves.fastOutSlowIn);
    setState(() {});


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 300,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(widget.title!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold))),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, int index) {
                  return _MoviePoster(movie: widget.movies[index], heroId: '${widget.movies[index]}-$index${widget.movies[index].id}', );                  
                },
              ),
              if (isLoading)
          const Positioned(right:0, top:70, child: loadingIcon())
          

      

              
            ],
            
            
          ),
        ),
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const _MoviePoster({super.key, required this.movie, required this.heroId});

  @override
  Widget build(BuildContext context) {

    movie.heroId = heroId;
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details",
                arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage("assets/no-image.jpg"),
                    image: NetworkImage(movie.fullPosterImg),
                    height: 190,
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Text(movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center)
        ],
      ),
      
    );
  }
}

class loadingIcon extends StatelessWidget {
  const loadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle ),
      child: const CircularProgressIndicator(color: AppTheme.primary),
    );
  }
}
