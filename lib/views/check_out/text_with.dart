import 'package:flutter/cupertino.dart';

class TextWith extends StatelessWidget {
  final String text,price;
  final bool font;
  const TextWith({super.key, required this.text, required this.price, this.font=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
      Text(text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff434C6D),
        ),
      ),
      Text(price,
        style: TextStyle(
          fontSize: 12,
          fontWeight: font?FontWeight.w700:FontWeight.w400,
          color: Color(0xff434C6D),
        ),
      ),
    ],
    );
  }
}
