import 'package:design/widgets/card_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:design/widgets/background.dart';
import 'package:design/widgets/custom_bottom_navigation.dart';
import 'package:design/widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(children:  [
        const Background(),

        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(50),
            child: Column(children: const [
              PageTitle(),
              SizedBox(height: 50,),
              CardTable()
            ]),
          ),
        )


      ],
      ),
      bottomNavigationBar: CustomBottomNavigation() ,
    );
  }
}

