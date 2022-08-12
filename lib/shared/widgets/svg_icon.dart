import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    Key? key,
    required this.assetUrl,
    this.color,
  }) : super(key: key);

  final String assetUrl;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetUrl,
      color: color,
    );
  }
}
