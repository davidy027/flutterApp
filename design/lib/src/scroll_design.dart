import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration( gradient: LinearGradient (begin: Alignment.topCenter, end:Alignment.bottomCenter,stops: [0.2,0.2], colors: [Color(0xff5EE8c5), Color(0xff30BAD6)]) ),
        child: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            page1(),
            page2()

            ],
        ),
      )
    );
  }
}


class background extends StatelessWidget {
  const background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xff30BAD6), height: double.infinity, alignment: Alignment.topCenter,child: const Image(image: AssetImage("assets/scroll-1.png")));
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60);

    return SafeArea(
      bottom: false,
      child: Column(children: [
        const SizedBox(height: 100),
        const Text("11", style: textStyle),
        const Text("Miércoles", style: textStyle),
        Expanded(child: Container()),
        const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white,),
    
      ],),
    );
  }
}


class page1 extends StatelessWidget {
  const page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack( 
      children: const [
        background(),
    
        MainContent()
      ],
    );
  }
}

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(color:  const Color(0xff30BAD6),
        child:
        Center(child: ElevatedButton(onPressed: (){}, child: const Text("Bienvenido", style: TextStyle(fontSize: 60)))
      )
  
    );
  }
}