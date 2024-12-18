// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';

const InputDecorationCustom = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    contentPadding: EdgeInsets.all(20),

    fillColor: Color.fromRGBO(192, 192, 192, 0.20),
    filled: true);