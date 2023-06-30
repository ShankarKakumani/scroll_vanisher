//
// Copyright (c) 2023 Shankar Kakumani. All rights reserved.
// Use of this source code is governed by MIT license
// that can be found in the LICENSE file.
//

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:scroll_vanisher/scroll_vanisher.dart';
import 'package:scroll_vanisher/src/scroll_vanisher_direction.dart';

/// Simple extension to generate [VanisherController] from scroll controller instance directly.
extension VanisherControllerExtension on ScrollController {
  static final hidableControllers = <int, VanisherController>{};

  /// Shortcut way of creating hidable controller
  VanisherController vanisher(
    ScrollVanisherDirection scrollVanisherDirection,
    bool resetStateWhenScrolledToStart,
    double startingOffset,
  ) {
    // If the same instance was created before, we should keep using it.
    if (hidableControllers.containsKey(hashCode)) {
      return hidableControllers[hashCode]!;
    }

    return hidableControllers[hashCode] = VanisherController(
      scrollController: this,
      scrollVanisherDirection: scrollVanisherDirection,
      resetStateWhenScrolledToStart: resetStateWhenScrolledToStart,
      startingOffset: startingOffset,
    );
  }
}

/// A custom wrapper for scroll controller.
///
/// Implements the main listener method for [ScrollController].
/// And the [sizeNotifier] for providing/updating the Vanisher status.
class VanisherController {
  /// The main scroll controller.
  /// The main scroll controller.
  ScrollController scrollController;
  ScrollVanisherDirection scrollVanisherDirection;
  bool resetStateWhenScrolledToStart;
  double startingOffset;

  VanisherController({
    required this.scrollController,
    required this.scrollVanisherDirection,
    required this.resetStateWhenScrolledToStart,
    this.startingOffset = 0,
  }) {
    scrollController.addListener(listener);
  }

  final sizeNotifier = ValueNotifier<double>(1.0);

  /// Listener is the main "extension" method for the [ScrollController],
  /// which calculates the position of scroll and decides wheter it should collapse or
  /// show-up the static located widget.
  ///
  /// The calculation data will be emitted to the [sizeNotifier]. Where 0 to 1 is the
  /// static-located-widget appearing status. (0 = closed) and (1 = opened).
  void listener() {
    final p = scrollController.position;
    if (scrollController.offset <= p.minScrollExtent) {
      sizeNotifier.value = 1.0;
      return;
    }

    /// forward means upside
    if (p.userScrollDirection == ScrollDirection.forward) {
      if (sizeNotifier.value == 1.0) return;
      sizeNotifier.value = 1.0;
      return;
    }

    /// reverse means downside
    if (p.userScrollDirection == ScrollDirection.reverse) {
      if (sizeNotifier.value == 0.0) return;
      sizeNotifier.value = 0.0;
      return;
    }
  }

  void close() => sizeNotifier.dispose();
}
