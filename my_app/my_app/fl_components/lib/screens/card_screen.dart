import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/customCard.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card Widget"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
        children: const [
          customCard(),
          SizedBox(height: 10),
          customCard1(imageUrl: "https://img.freepik.com/free-vector/hand-drawn-flat-design-mountain-landscape_52683-79195.jpg?w=2000", name: "un hermoso paisanje",),
          SizedBox(height: 10),
          customCard1(imageUrl: "https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg?w=2000", ),
          SizedBox(height: 10),
          customCard1(imageUrl: "https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg", name: "suiza",),
          SizedBox(height: 10),
          customCard1(imageUrl: "https://www.theolivepress.es/wp-content/uploads/2019/02/High-frontier.jpg",),
          SizedBox(height: 100),
        ],
      )
    );
  }
}

