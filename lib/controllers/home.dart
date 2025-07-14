import 'package:flutter/material.dart';

final homeScreens =
    (upcoming: "Upcoming", myBooking: "My booking", post: "Past");

class HomeController {
  ValueNotifier<String> selectButton = ValueNotifier(homeScreens.upcoming);

  final buttons = [
    homeScreens.upcoming,
    homeScreens.myBooking,
    homeScreens.post
  ];

  dispose() {
    selectButton.dispose();
  }
}
