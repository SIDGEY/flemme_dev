import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import 'time_func.dart';

extension SidgeyWidget on Widget {
  Padding withPadding({
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) {
    return Padding(padding: padding, child: this);
  }

  Flexible withFlexible({
    int flex = 1,
    FlexFit fit = FlexFit.tight,
  }) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  Expanded withExpanded({
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Center withCenter() {
    return Center(
      child: this,
    );
  }

  Future<dynamic> showHimself(BuildContext currentContext,
      {Color bgColor = Colors.transparent}) {
    return showDialog(
      context: currentContext,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: bgColor,
          children: [
            this,
          ],
        );
      },
    );
  }
}

extension SidgeyString on String {
  String ellipse({int number = 140}) {
    if (length >= number) {
      return "${substring(0, number - 1)} ...";
    }
    return this;
  }

  void debugPrintWeb() {
    if (kDebugMode) print(this);
  }

  Text toTextWidget({
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return Text(this,
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }
}

extension SidgeyDate on DateTime {
  String returnDateSmall(
      {String defaultPattern = "E dd-MM-yyyy HH:mm", String? locale}) {
    if (isAfter(DateTime.now())) {
      return GetTimeAfter.parse(this, locale: locale, pattern: defaultPattern);
    } else {
      return GetTimeAgo.parse(this, locale: locale, pattern: defaultPattern);
    }
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }

  List<double> getPositions(duration) {
    RenderBox? renderBox = currentContext!.findRenderObject() as RenderBox;
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    double start = dy - 0;
    double end = renderBox.size.height + start;
    double step = 75;
    List<double> positions = [];
    for (double x = start; x < end; x = x + step) {
      positions.add(x);
    }

    renderBox.paintBounds;
    return positions;
  }

  Rect getRect() {
    RenderBox? renderBox = currentContext!.findRenderObject() as RenderBox;
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    double start = dy - 0;
    double end = renderBox.size.height + start;
    double step = 75;
    List<double> positions = [];
    for (double x = start; x < end; x = x + step) {
      positions.add(x);
    }
    return renderBox.paintBounds;
  }
}

extension SidgeyList on List<Widget> {
  Row listToRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }

  Column listToColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }
}
