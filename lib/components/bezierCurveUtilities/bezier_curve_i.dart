import 'package:flutter/material.dart';

class BezierClipperI extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 325;
    final double _yScaling = size.height / 600;
    path.lineTo(240.66663642408554 * _xScaling, 209.4145733664248 * _yScaling);
    path.cubicTo(
      267.26663642408556 * _xScaling,
      231.4145733664248 * _yScaling,
      287.66663642408554 * _xScaling,
      264.4145733664248 * _yScaling,
      280.66663642408554 * _xScaling,
      290.5145733664248 * _yScaling,
    );
    path.cubicTo(
      273.76663642408556 * _xScaling,
      316.6145733664248 * _yScaling,
      239.56663642408554 * _xScaling,
      335.7145733664248 * _yScaling,
      212.96663642408555 * _xScaling,
      361.4145733664248 * _yScaling,
    );
    path.cubicTo(
      186.26663642408556 * _xScaling,
      387.01457336642477 * _yScaling,
      167.16663642408554 * _xScaling,
      419.2145733664248 * _yScaling,
      141.66663642408554 * _xScaling,
      425.6145733664248 * _yScaling,
    );
    path.cubicTo(
      116.16663642408555 * _xScaling,
      431.9145733664248 * _yScaling,
      84.36663642408556 * _xScaling,
      412.4145733664248 * _yScaling,
      67.66663642408555 * _xScaling,
      386.7145733664248 * _yScaling,
    );
    path.cubicTo(
      50.96663642408555 * _xScaling,
      361.0145733664248 * _yScaling,
      49.46663642408555 * _xScaling,
      329.2145733664248 * _yScaling,
      46.26663642408555 * _xScaling,
      294.2145733664248 * _yScaling,
    );
    path.cubicTo(
      42.96663642408555 * _xScaling,
      259.1145733664248 * _yScaling,
      38.066636424085544 * _xScaling,
      220.8145733664248 * _yScaling,
      54.66663642408555 * _xScaling,
      198.8145733664248 * _yScaling,
    );
    path.cubicTo(
      71.36663642408556 * _xScaling,
      176.8145733664248 * _yScaling,
      109.66663642408555 * _xScaling,
      171.1145733664248 * _yScaling,
      145.26663642408556 * _xScaling,
      173.8145733664248 * _yScaling,
    );
    path.cubicTo(
      180.96663642408555 * _xScaling,
      176.4145733664248 * _yScaling,
      213.96663642408555 * _xScaling,
      187.4145733664248 * _yScaling,
      240.66663642408554 * _xScaling,
      209.4145733664248 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
