import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/explore_screen/view/explore_view.dart';
import 'package:online_exam_app/presentation/result_screen/view/result_view.dart';
import 'package:online_exam_app/presentation/screens/profile/profile/profile_screen.dart';


class MainLayoutViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
   const ExploreScreen(),
    const ResultScreen(),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => _screens[_selectedIndex];

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}