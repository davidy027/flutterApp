import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar (String message){
    final snackBar = SnackBar(content: Text(message, style: const TextStyle(fontSize: 20, color: Colors.white),));

    messengerKey.currentState!.showSnackBar(snackBar);
  }



}