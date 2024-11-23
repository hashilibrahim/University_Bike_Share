import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/extensions.dart';
import '../view model/bottom_nav_provider.dart';

// ignore: use_key_in_widget_constructors
class UniBikeBottomNav extends StatefulWidget {
  @override
  State<UniBikeBottomNav> createState() => _UniBikeBottomNavState();
}

class _UniBikeBottomNavState extends State<UniBikeBottomNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      body: Stack(
        children: [
          Center(
            child: Selector<BottomNavProvider, Widget>(
              selector: (context, model) =>
                  model.screens.elementAt(model.selectedIndex),
              builder: (context, screen, child) {
                return screen;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Selector<BottomNavProvider, int>(
              selector: (context, model) => model.selectedIndex,
              builder: (context, selectedIndex, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppConstants.drawerBgColor,
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: Responsive.width * 4.5, vertical: 30),
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.width * 4, vertical: 8),
                  child: GNav(
                    rippleColor: AppConstants.appPrimaryColor,
                    hoverColor: AppConstants.appPrimaryColor,
                    gap: 8,
                    activeColor: AppConstants.black,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.width * 5,
                      vertical: Responsive.height * 2,
                    ),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: AppConstants.appPrimaryColor,
                    color: AppConstants.white,
                    tabs: [
                      GButton(
                        icon: selectedIndex == 0
                            ? IconlyBold.home
                            : IconlyLight.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: selectedIndex == 1
                            ? IconlyBold.bag
                            : IconlyLight.bag,
                        text: 'Ride',
                      ),
                      GButton(
                        icon: selectedIndex == 3
                            ? IconlyBold.profile
                            : IconlyLight.profile,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      Provider.of<BottomNavProvider>(context, listen: false)
                          .setSelectedIndex(index);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
