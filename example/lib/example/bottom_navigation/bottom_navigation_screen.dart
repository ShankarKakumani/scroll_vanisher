import 'package:example/example/pages/page_one.dart';
import 'package:flutter/material.dart';
import 'package:scroll_vanisher/scroll_vanisher.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final ScrollController pageOneScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getBottomNavRow(context),
      body: SafeArea(
        top: false,
        bottom: false,
        child: PageView(
          controller: PageController(),
          onPageChanged: (page) {},
          physics: const NeverScrollableScrollPhysics(),
          children: getBottomNavPages(),
        ),
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
      child: Container(
        height: 56 + MediaQuery.of(context).padding.bottom,
        color: Colors.white,
        width: double.infinity,
      ),
    );
  }
}
