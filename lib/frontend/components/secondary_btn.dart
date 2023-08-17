import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn({
    Key? key,
    required this.color,
    required this.padding,
    required this.title,
    required this.tap,
  }) : super(key: key);
  final Color color;
  final double padding;
  final String title;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: InkWell(
        onTap: tap,
        borderRadius: BorderRadius.circular(10),
        splashColor: color,
        child: Ink(
          height: getHeight(40),
          decoration: BoxDecoration(
              border: Border.all(color: pallete.primaryDark),
              borderRadius: BorderRadius.circular(8),
              color: color,
              boxShadow: [
                BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                color: pallete.primaryDark,
                fontSize: getWidth(16),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
