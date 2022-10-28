import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class customCard extends StatelessWidget {
  const customCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column (
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: AppTheme.primary,),
            title: Text("soy un titulo"),
            subtitle: Text("Aute enim est est sunt proident aute esse minim exercitation. Voluptate aute elit culpa ea. Nisi do ea eiusmod do sint ullamco. Dolore sunt elit id do deserunt officia consequat consectetur aliqua ea duis veniam commodo mollit. Consequat ullamco in adipisicing cupidatat est ipsum Lorem deserunt ea sunt reprehenderit qui."),
          ),
          Padding(padding: const EdgeInsets.only(right: 8.0), child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(onPressed: ()=>{}, child: const Text("Cancel")), 
              TextButton(onPressed: ()=>{}, child: const Text("Ok"))
            ],
          )
          )
        ],
      ),
    );
  }
}