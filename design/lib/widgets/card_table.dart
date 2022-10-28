import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(mainColor: Colors.blue, mainText: 'General', icon: Icons.grading_sharp,),
          _SingleCard(mainColor: Colors.red, mainText: 'Transport', icon: Icons.car_repair,),
        ]),


        TableRow(children: [
          _SingleCard(mainColor: Colors.purple, mainText: 'food', icon: Icons.food_bank,),
          _SingleCard(mainColor: Colors.orange, mainText: 'bank', icon: Icons.balance,),
        ]),


       TableRow(children: [
          _SingleCard(mainColor: Colors.green, mainText: 'Travel', icon: Icons.travel_explore,),
          _SingleCard(mainColor: Colors.indigo, mainText: 'location', icon: Icons.wrong_location_rounded,),
        ]),

       TableRow(children: [
          _SingleCard(mainColor: Colors.blue, mainText: 'General', icon: Icons.grading_sharp,),
          _SingleCard(mainColor: Colors.red, mainText: 'Transport', icon: Icons.car_repair,),
        ]),

       TableRow(children: [
          _SingleCard(mainColor: Colors.blue, mainText: 'General', icon: Icons.grading_sharp,),
          _SingleCard(mainColor: Colors.red, mainText: 'Transport', icon: Icons.car_repair,),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String mainText;
  final Color mainColor;
  final IconData icon;


  const _SingleCard({super.key, 
  required this.mainColor, 
  required this.mainText, 
  required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Circle(color: mainColor , icon: icon),
                SizedBox(height: 20),
                description(color: mainColor, text: mainText,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Circle extends StatelessWidget {
  
  final Color color;
  final double radio;
  final IconData icon;

  const Circle({
    Key? key, 
    required this.color, 
    required this.icon,
    this.radio = 35, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return CircleAvatar(
        backgroundColor: color,
        radius: radio,
        child: Icon(icon, size: 30, color: Colors.white,));
  }
}

class description extends StatelessWidget {

  final String text;
  final Color color;


  const description({
    Key? key, 
    required this.color,
    required this.text, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style:TextStyle(fontSize: 18, color: color));
  }
}