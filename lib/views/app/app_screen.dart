import 'package:bank_mobile_app/component/widget/custom_icon_widget.dart';
import 'package:bank_mobile_app/controllers/splash_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:bank_mobile_app/views/screen/home/home_screen.dart';
import 'package:bank_mobile_app/views/screen/profile/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}
class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Center(child: Text('Search Page')),
    Center(child: Text('Search Page')),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Switch without animation
    // Alternatively, use:
    // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _pages,
            physics: const NeverScrollableScrollPhysics(), // Disable swipe gestures if undesired
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoTabBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: customIconImage(
                    imageName: "assets/icons/icon_home.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  activeIcon: customIconImage(
                    imageName: "assets/icons/icon_home_active.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: customIconImage(
                    imageName: "assets/icons/icon_love.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  activeIcon: customIconImage(
                    imageName: "assets/icons/icon_love_active.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: customIconImage(
                    imageName: "assets/icons/icon_notification.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  activeIcon: customIconImage(
                    imageName: "assets/icons/icon_notification_active.png",
                    radios: 22,
                    color: ColorResources.getGoldColor(context),
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              activeColor: CupertinoColors.activeBlue,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}


/*
class _AppScreenState extends State<AppScreen> {

  SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return CupertinoPageScaffold(
          child: Stack(
            children: [
              PageView(
                controller: splashController.pageController,
                onPageChanged: (index) => splashController.onChangeIndex(index),
                physics: const NeverScrollableScrollPhysics(),
                children: splashController.mainPages,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoTabBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.settings),
                      label: 'Settings',
                    ),
                  ],
                  currentIndex: splashController.selectedIndex,
                  activeColor: CupertinoColors.activeBlue,
                  onTap: splashController.onItemTapped(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    splashController.pageController.dispose();
    super.dispose();
  }
}*/
