import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class customCard1 extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const customCard1({super.key, required this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        elevation: 50,
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Column(
          children: [
             FadeInImage(
              placeholder: const AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  imageUrl),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (name != null)
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text(name?? "no tittle"))
          ],
        ));
  }
}
