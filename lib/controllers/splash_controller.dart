
import 'package:bank_mobile_app/views/screen/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController implements GetxService {

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<Widget> mainPages = <Widget>[
    const HomeScreen(),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Profile Page')),
  ];

  onChangeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  onItemTapped() {
    _selectedIndex = _selectedIndex;
    _pageController.jumpToPage(_selectedIndex);
    update();
  }
}