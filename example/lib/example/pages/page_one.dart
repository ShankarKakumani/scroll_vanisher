import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 300,
            ),
            Container(
              color: Colors.blue,
              height: 300,
            ),
            Container(color: Colors.green, height: 300),
            Container(
              color: Colors.indigoAccent,
              height: 300,
            ),
            Container(
              color: Colors.lightGreen,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
