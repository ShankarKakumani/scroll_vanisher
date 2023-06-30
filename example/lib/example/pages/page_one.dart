import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
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
    );
  }
}
