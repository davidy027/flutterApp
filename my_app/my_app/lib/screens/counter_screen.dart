import 'dart:developer';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;

  void increase(){
    counter++;
  setState(()=>{});
}

  void decrease(){
  setState(()=>counter--);
}

  void restar(){
  setState(()=>counter=0);
}

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterScreen"),
        elevation: 10,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Numero de clicks", style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
      floatingActionButton: CustomFloatingButton(
        increaseFunction: increase, decreaseFunction: decrease, resetFunction: restar,
      ),
    );
  }
}

class CustomFloatingButton extends 
StatelessWidget {

final Function increaseFunction;
final Function decreaseFunction;
final Function resetFunction;

  const CustomFloatingButton({
    Key? key, required this.decreaseFunction, required this.resetFunction,required this.increaseFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: ()=>decreaseFunction(),

        ),
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()=>resetFunction(),

        ),
        
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: ()=>increaseFunction()),

      ],
    );
  }
}
