import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/widgets/custom_input.dart';

class appointment extends StatefulWidget {
  const appointment({super.key});


  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  bool _sliderEnable = false;
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  


  @override
  void initState() {
    super.initState();
    dateInput.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    timeInput.text = DateFormat('hh:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: CustomInputField(
                hintText: "Quien te visita?",
                porcentageWidth: 0.6,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: size.width*0.4,
                    child: TextField(
                      controller: dateInput,
                      keyboardType: TextInputType.none,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          dateInput.text = formattedDate;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),

             Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                    width: size.width*0.4,
                    child: TextField(
                      controller: timeInput,
                      keyboardType: TextInputType.none,
                      onTap: () async {
                        final TimeOfDay? dayTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                        if (dayTime != null) {
                          // ignore: use_build_context_synchronously
                          timeInput.text = dayTime.format(context);
                          setState(() {});
                        }
                      },
                    ),
                  ),
              ),


              ],
              
            ),
            
            ElevatedButton(onPressed: (){}, child: Text("Generar"))

           
          ],
          
        ),
        
      ),
    );
  }
}










//  SwitchListTile(value: _sliderEnable, onChanged: (value){
//               _sliderEnable = value;
//             setState(() {
              
//             });
//             }
//             )
