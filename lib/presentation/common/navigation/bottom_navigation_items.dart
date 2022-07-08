import 'package:flutter/material.dart';

class BottomNavigationItems {
  static List<BottomNavigationBarItem> getBottomNavigationItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.timer_rounded), label: "Routines"),
      BottomNavigationBarItem(
          icon: Icon(Icons.monitor_weight_rounded), label: "Weight"),
      BottomNavigationBarItem(
          icon: Icon(Icons.bug_report_rounded), label: "Debug")
    ];
  }
}
