import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
      final boxDecoration = const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2,0.8],
              colors: [Color(0xff2E305F), Color(0xff202333)]
                )
              );

  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration),
          const Positioned(
            top: -120,
            left: -15,
            
            child: _PinkBox()),
      ],
    );
  }
}


class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/5,
      child: Container(
        width: 460,
        height: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), gradient: const LinearGradient(colors: [
          Color.fromRGBO(236, 98, 188, 1),
          Color.fromRGBO(251, 142, 172, 1),
    
        ])),
      ),
    );
  }
}