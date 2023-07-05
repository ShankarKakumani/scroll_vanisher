# ScrollVanisher

ScrollVanisher is a Flutter package that allows any widget to vanish while scrolling. This package is perfect for creating a clean and minimalistic user interface by vanishing widgets as user scrolls.

## Features

- Vanish/Hide any widget while scrolling.
- Customize the duration and curve of the hide/show animation.
- Choose the direction of the scroll that triggers the hide/show effect.
- Reset the state of the widget when scrolled to the start.

## Getting Started

To use this package, follow the below instructions.


### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  scroll_vanisher: ^1.0.0
```

Then install packages from the command line:

```bash
$ flutter pub get
```

Now in your Dart code, you can use:

```dart
import 'package:scroll_vanisher/scroll_vanisher.dart';
```

### Usage

Wrap your widget with `ScrollVanisher`, then your widget will support scroll to hide/show feature. The scroll controller that you give to `ScrollVanisher`, also must be given to your scrollable widget, It could be `ListView`, `GridView`, `SingleChildScrollView` etc.

Here is a basic example:

```dart
ScrollVanisher(
  controller: _scrollController,
  child: AppBar(
    title: Text('Scroll Vanisher'),
  ),
);
```

In the above example, the `AppBar` will vanish when the user scrolls the `ListView`, `GridView`, or `SingleChildScrollView` that is attached to `_scrollController`.

### Customization

You can customize the `ScrollVanisher` with the following parameters:

- `child`: The widget you want to add the scroll-to-hide effect to.
- `controller`: The main scroll controller to listen to user's scrolls.
- `replacement`: The widget that will replace the `child` when it's hidden.
- `preferredWidgetSize`: The preferred size of the `ScrollVanisher`.
- `childDuration`: The duration of the hide/show animation.
- `replacementDuration`: The duration of the replacement animation.
- `childCurve`: The fade curve of the `child`.
- `replacementCurve`: The fade curve of the `replacement`.
- `scrollVanisherDirection`: The direction of the scroll that triggers the hide/show effect.
- `resetStateWhenScrolledToStart`: Whether to reset the state of the widget when scrolled to the start.
- `startingOffset`: The starting offset of the scroll.
- `isEnabled`: To control the vanish functionality.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgements

This project was inspired by the [`hidable`](https://pub.dev/packages/hidable) library, developed by [insolite.io](https://pub.dev/publishers/insolite.io). We used the code from the `hidable` library as a foundation to build upon and extend its functionality to meet our project's requirements.

