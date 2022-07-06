
import 'dart:async';
import 'package:flutter/material.dart';


abstract class Debouncer {

  static Timer _timer;

  static void runDebouncer(VoidCallback callback ){
    _timer?.cancel();
    _timer = Timer(
      const Duration(seconds: 1),
      callback
    );
  }

}