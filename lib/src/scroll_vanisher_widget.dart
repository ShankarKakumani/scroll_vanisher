//
// Copyright (c) 2023 Shankar Kakumani. All rights reserved.
// Use of this source code is governed by MIT license
// that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:scroll_vanisher/src/scroll_vanisher_controller.dart';
import 'package:scroll_vanisher/src/scroll_vanisher_direction.dart';

/// ScrollVanisher is a widget that makes any widget vanish while scrolling.
///
/// To Use:
/// Wrap your widget with [ScrollVanisher],
/// then your widget will support scroll to hide/show feature.
///
/// Note: scroll controller that you give to [ScrollVanisher], also must be given to your scrollable widget,
/// It could, [ListView], [GridView], [SingleChildScrollView] etc.
///

class ScrollVanisher extends StatelessWidget implements PreferredSizeWidget {
  /// Child widget, which you want to add scroll-to-hide effect to it.
  ///
  /// It can be any widget:
  /// [BottomNavigationBar], [FloatingActionButton], [AppBar] etc.
  final Widget child;

  final Widget replacement;

  /// The main scroll controller to listen user's scrolls.
  ///
  /// It must be given to your scrollable widget.
  final ScrollController controller;

  /// A customization field for [ScrollVanisher]'s `preferredSize`.
  ///
  /// As default the preferred size is is the [AppBar]'s `preferredSize`.
  /// (56 heights with page-size width).
  final Size preferredWidgetSize;

  /// The duration of the whole orchestrated animation.
  final Duration childDuration;

  /// The duration of the whole orchestrated animation when running in reverse.
  ///
  /// If not supplied, this defaults to [childDuration].
  final Duration? replacementDuration;

  /// The fade curve of the first child.
  ///
  /// Defaults to [Curves.linear].
  final Curve childCurve;

  /// The fade curve of the replacement.
  ///
  /// Defaults to [Curves.linear].
  final Curve replacementCurve;

  final bool resetStateWhenScrolledToStart;

  final double startingOffset;

  final ScrollVanisherDirection scrollVanisherDirection;

  final bool isEnabled;

  const ScrollVanisher({
    Key? key,
    required this.child,
    required this.controller,
    this.replacement = const SizedBox(),
    this.preferredWidgetSize = const Size.fromHeight(56),
    this.childDuration = const Duration(milliseconds: 200),
    this.replacementDuration,
    this.childCurve = Curves.linear,
    this.replacementCurve = Curves.linear,
    this.scrollVanisherDirection = ScrollVanisherDirection.forward,
    this.resetStateWhenScrolledToStart = true,
    this.startingOffset = 0,
    this.isEnabled = true
  }) : super(key: key);

  @override
  Size get preferredSize => preferredWidgetSize;

  @override
  Widget build(BuildContext context) {
    final vanisher = controller.vanisher(
      scrollVanisherDirection,
      resetStateWhenScrolledToStart,
      startingOffset,
    );

    return ValueListenableBuilder<double>(
      valueListenable: vanisher.sizeNotifier,
      builder: (_, factor, __) {
        return AnimatedCrossFade(
          secondChild: replacement,
          firstChild: child,
          crossFadeState: getCrossFadeState(factor),
          duration: childDuration,
          reverseDuration: replacementDuration ?? childDuration,
          firstCurve: childCurve,
          secondCurve: replacementCurve,
        );
      },
    );
  }

  /// Determines the state of the cross fade based on the provided factor.
  CrossFadeState getCrossFadeState(double factor) {
    if (factor >= 1 || !isEnabled) {
      return CrossFadeState.showFirst;
    } else {
      return CrossFadeState.showSecond;
    }
  }
}
