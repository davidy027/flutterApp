import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  const [
           //Image
           FadeInImage(placeholder: AssetImage("assets/jar-loading.gif"), image: AssetImage("assets/landscape.jpg")),

          //Tittle
          _information(),

          //Buttons
          _Buttons_section(),

          //Paragraph
          _paragraph()
        ],
      ),
    );
  }
}


class _information extends StatelessWidget {
  const _information({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: const [
            Text("Oeschinen Lake Campground", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Kandersteg, Switzerland", style: TextStyle(color: Colors.black26),)
          ]),
          Expanded(child: Container(),),
          Icon(Icons.star, color: Colors.orange[900],),
          const Text("41")
        ],
      ),
    );
  }
}


class _Buttons_section extends StatelessWidget {
  const _Buttons_section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,children: const [
        _CustonButton(icon: Icons.phone, text: 'CALL', color: Colors.blue,),
        _CustonButton(icon: Icons.telegram, text: 'ROUTE', color: Colors.blue,),
        _CustonButton(icon: Icons.share, text: 'SHARE', color: Colors.blue,),

      ],),
    );
  }
}


class _CustonButton extends StatelessWidget {

  final Color? color;
  final IconData icon; 
  final String text;

  const _CustonButton({
    Key? key, required this.icon, required this.text, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon, color: color,), Text(text, style: TextStyle(color: color),)]);
  }
}


class _paragraph extends StatelessWidget {
  const _paragraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 400, margin: const EdgeInsets.symmetric(vertical: 20),
    child: const Text("Consectetur proident ut do ea proident incididunt. Ad dolor velit culpa enim consectetur dolore. Commodo sint duis eu deserunt anim sit magna veniam sint officia ullamco pariatur tempor. Mollit eu eiusmod cupidatat occaecat."),);
  }
}
