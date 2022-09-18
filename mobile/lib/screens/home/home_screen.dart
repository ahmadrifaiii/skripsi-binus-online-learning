import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pln/screens/home/dashboard_screen.dart';
import 'package:pln/screens/notification.dart';

import '../../utility/style.dart';
import '../auth/profile.dart';
import '../workorder/list_workorder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          DashboardScreen(),
          WorkOrderListScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clipboardList),
              label: "Work Order"),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: navigationTapped,
        currentIndex: _page,
        // fixedColor: whiteColor,
        backgroundColor: primaryColor,
        selectedItemColor: blackColor,
        selectedFontSize: 14,
        unselectedItemColor: whiteColor,
        // ignore: prefer_const_constructors
        selectedIconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
    );
  }
}
