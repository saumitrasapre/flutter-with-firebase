import 'package:flutter/material.dart';

const textInputDecoration=InputDecoration(
    fillColor: const Color(0xFF303030),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:const Color(0xFF303030),
        width:2.0
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:Colors.pinkAccent,
        width:2.0
      )
    )
  );