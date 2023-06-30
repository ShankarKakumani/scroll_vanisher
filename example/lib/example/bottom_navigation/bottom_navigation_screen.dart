import 'package:example/example/pages/page_one.dart';
import 'package:flutter/material.dart';
import 'package:scroll_vanisher/scroll_vanisher.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final ScrollController pageOneScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getBottomNavRow(context),
      body: PageView(
        controller: PageController(),
        onPageChanged: (page) {},
        physics: const NeverScrollableScrollPhysics(),
        children: getBottomNavPages(),
      ),
    );
  }

  List<Widget> getBottomNavPages() {
    return [
      PageOne(scrollController: pageOneScrollController),
    ];
  }

  Widget getBottomNavRow(BuildContext context) {
    return ScrollVanisher(
      startingOffset: 0,
      controller: pageOneScrollController,
      scrollVanisherDirection: ScrollVanisherDirection.forward,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {},
      ),
    );
  }
}
