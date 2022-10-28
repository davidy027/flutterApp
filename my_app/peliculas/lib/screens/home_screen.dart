import 'package:flutter/material.dart';

import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
   
    @override
  Widget build(BuildContext context) {
    
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Peliculas en cines"),
        actions: [
          IconButton(onPressed: ()=>showSearch(context: context, delegate: MovieSearchDelegate ()), icon: const Icon(Icons.search_outlined),)
        ],
        
        
        
      ),
      body: SingleChildScrollView (child: Column(children: [
        //Tarjeta Principales
        CardSwiper( movies: moviesProvider.onDisplayMovie),
        
        //Slider de Peliculas
        MovieWidget(movies: moviesProvider.popularMovie, title: "populares", onNextPage: ()=> moviesProvider.getPopularMovies())  
      ],
      ),)

      
      );
  }
}