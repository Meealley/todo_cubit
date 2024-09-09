// import 'dart:async';

// import 'package:flutter/material.dart';

// class Debounce {
//   final int milliseconds;

//   Debounce({
//     this.milliseconds = 500,
//   });

//   Timer? _timer;

//   void run(VoidCallback action) {
//     if (_timer != null) {
//       _timer!.cancel();
//     }

//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({this.milliseconds = 500});

  void run(VoidCallback action) {
    // Cancel the previous timer if still active
    if (_timer != null) {
      _timer!.cancel();
    }

    // Start a new timer with the specified delay
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
