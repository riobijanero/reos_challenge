import 'package:flutter/material.dart';

import 'package:reos_challenge/shared/widgets/widgets.dart';

class ListitemTrailingIcon extends StatelessWidget {
  const ListitemTrailingIcon({
    Key? key,
  }) : super(key: key);

  static const String _bellIcon = 'assets/svgs/bell_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      height: 40,
      width: 40,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: SvgIcon(
            assetUrl: _bellIcon,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
