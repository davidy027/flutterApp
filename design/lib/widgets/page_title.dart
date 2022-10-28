import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Classify Transaction", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text("Classify this transaction into a particular category", style: TextStyle(fontSize: 18, color: Colors.white),maxLines: 2,)
          ],
        ),
    
      ),
    );
  }
}