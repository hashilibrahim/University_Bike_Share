import 'package:flutter/material.dart';
import 'package:uni_bike/app/modules/home/view/home_screen.dart';

import '../../create ride/view/create_ride_scree.dart';
import '../../home/view/profile_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  //BOTTOM NAV
  final screens = [
    const HomeScreen(),
    const CreateRideScreen(),
    const ProfileScreen()
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  //BOTTOM NAV END
}
