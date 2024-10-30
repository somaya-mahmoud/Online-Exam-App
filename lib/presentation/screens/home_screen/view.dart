import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/screens/Exam/explore/explore_subjects_screen.dart';
import 'package:online_exam_app/presentation/screens/Exam/results/results_screen.dart';
import 'package:online_exam_app/presentation/screens/profile/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> screens = [
    const ExploreSubjectsScreen(),
    const ResultsScreen(),
    const ProfileScreen(),
  ];
  void changeBottomNavigationState(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/explore.svg'), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/result.png'), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/profile.svg'), label: ''),
        ],
        currentIndex: index,
        onTap: (value) {
          changeBottomNavigationState(value);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.lightBlue,
      ),
      body: screens[index],
    );
  }
}
