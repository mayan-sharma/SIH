import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class SendPothole extends StatefulWidget{

final DatabaseReference database = FirebaseDatabase.instance.reference().child("potholeInfo");

sendData(){
  database.push().set({
    'potholeID':'87yf90vb10'
    'location' : 'location'
    'report time': 'time'
    'status' : 'True'

  });


}

 } 