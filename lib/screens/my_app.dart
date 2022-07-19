import 'package:ebook_flutter_app/constant.dart';
import 'package:ebook_flutter_app/screens/Setting.dart';
import 'package:ebook_flutter_app/screens/home_screen.dart';
import 'package:ebook_flutter_app/screens/intro_screen.dart';
import 'package:ebook_flutter_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyAppComplete extends StatefulWidget {
  const MyAppComplete({Key? key}) : super(key: key);

  @override
  State<MyAppComplete> createState() => _MyAppCompleteState();
}

class _MyAppCompleteState extends State<MyAppComplete> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [IntroScreen(), HomeScreen(), SearchScreen(), Setting()],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style13,
        backgroundColor: Color.fromARGB(255, 92, 107, 192)),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.arrow_back),
        title: ("Back"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white38,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white38,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white38,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Setting"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white38,
      ),
    ];
  }
}
