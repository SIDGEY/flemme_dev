import 'package:flemme/src/config_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import 'time_func.dart';

extension FlemmeWidget on Widget {
  Padding withPadding({
    EdgeInsets? padding,
  }) {
    return Padding(padding: padding ?? FlemmeConfig().paddingAllM, child: this);
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

  Future<dynamic> showHimself(
    BuildContext currentContext, {
    Key? key,
    Widget? title,
    EdgeInsetsGeometry titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    TextStyle? titleTextStyle,
    List<Widget>? children,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    Color? backgroundColor,
    double? elevation,
    String? semanticLabel,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
  }) {
    return showDialog(
      context: currentContext,
      builder: (context) {
        return SimpleDialog(
          alignment: alignment,
          key: key,
          clipBehavior: clipBehavior,
          elevation: elevation,
          title: title,
          contentPadding: contentPadding,
          semanticLabel: semanticLabel,
          shape: shape,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          backgroundColor: backgroundColor ?? FlemmeConfig().modalBackgroundColors,
          children: [
            this,
          ],
        );
      },
    );
  }

  Container withContainer({
    Key? key,
    dynamic alignment,
    dynamic padding,
    dynamic color,
    dynamic decoration,
    dynamic foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    dynamic margin,
    dynamic transform,
    dynamic transformAlignment,
    dynamic clipBehavior = Clip.none,
  }) {
    return Container(
      color: color,
      key: key,
      width: width,
      alignment: alignment,
      height: height,
      decoration: decoration,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: decoration,
      margin: margin,
      padding: padding,
      transform: transform,
      transformAlignment: transformAlignment,
      child: this,
    );
  }

  SizedBox withSizeBox({
    Key? key,
    double? width,
    double? height,
  }) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }

  FractionallySizedBox withFractionallySizedBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) {
    return FractionallySizedBox(
      key: key,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }
}

extension FlemmeString on String {
  String ellipse({int lenght = 140}) {
    if (length >= lenght) {
      return "${substring(0, lenght - 1)} ...";
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
    TextScaler? textScaler,
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
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }
}

extension FlemmeDate on DateTime {
  String returnDateSmall({String defaultPattern = "E dd-MM-yyyy HH:mm", String? locale}) {
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
      return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
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

extension FlemmeList on List<Widget> {
  Row listToRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Key? key,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      key: key,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: this,
    );
  }

  Column listToColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Key? key,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      key: key,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: this,
    );
  }
}
