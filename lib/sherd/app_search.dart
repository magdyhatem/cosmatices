import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
          color: Color(0xffB3B3C1),
        ),
        ),
        isDense: true,
        prefix: Text('Search',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:Color(0xff8E8EA9)),),
        suffix:SvgPicture.asset(
            'assets/icons/search.svg'),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
        ),
    ),
    );
  }
}
