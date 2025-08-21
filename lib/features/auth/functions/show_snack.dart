import 'package:flutter/material.dart';

void showSnack(String msg ,context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating),
    );
  }