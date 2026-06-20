import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Align(
        alignment: AlignmentGeometry.centerStart,
        child: CircleAvatar(
          backgroundColor: Color(0xff101010).withValues(alpha: .05),
          radius: 15,
          child: Transform.rotate(
            angle: pi,
            child: SvgPicture.asset(
                'assets/icons/forword.svg',
              color: Colors.black,
              width: 25,
              height:18,
            ),
          ),
        ),
      ),
    );
  }
}
