import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DownPinFilds extends StatelessWidget {
  const DownPinFilds({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsetsGeometry.directional(start: 50,end: 50),
      child: PinCodeTextField(
        hintCharacter: '-',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        appContext: context, length: 4,
        enableActiveFill: false,
        cursorColor: Colors.grey,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: Color(0xffD75D72),
          selectedColor: Color(0xffD75D72),
          inactiveColor: Colors.grey.withValues(alpha: .50),
          selectedFillColor:Color(0xffD75D72) ,
          activeFillColor: Color(0xffD75D72),
          inactiveFillColor:Colors.grey,
          fieldHeight: 45,
          fieldWidth: 45,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
