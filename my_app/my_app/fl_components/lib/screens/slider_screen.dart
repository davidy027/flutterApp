import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);



  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
 
 
  double _sliderValue = 100;
  bool _sliderEnable = true;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Sliders & Checks")),
      body: Column(children: [
        Slider.adaptive(
          min: 50,
          max: 600,
          activeColor: AppTheme.primary,
          value: _sliderValue,
          onChanged:  _sliderEnable ? (value){ 
            _sliderValue = value;
            setState(() {
              
            });
          }: null),

          // Checkbox(value: _sliderEnable, onChanged: ( value ) {
          //   _sliderEnable = value ?? true;
          //   setState(() {
              
          //   });
          //  }),

          //  Switch(
          //   value: _sliderEnable, 
          //   onChanged: (value) => setState(() {
          //     _sliderEnable = value;
          //   })),

           CheckboxListTile(
            title: const Text("Habilitar el slider"),
            value: _sliderEnable, onChanged: (value)=>setState(() {
              _sliderEnable = value ?? true;
            })),

            SwitchListTile( activeColor: AppTheme.primary,
            title: const Text("Habilitar el slider"),
            value: _sliderEnable, onChanged: (value)=>setState(() {
              _sliderEnable = value;
            })),

            const AboutListTile(),

          Expanded(
            child: SingleChildScrollView
            (child: Image(image: const NetworkImage("https://i.pinimg.com/originals/fd/e1/ab/fde1abf2331273092aa0191ce3a7c03f.png"), fit: BoxFit.contain,width: _sliderValue)
            ),
          ),


      ]),
    );
  }
}
