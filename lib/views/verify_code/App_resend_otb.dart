import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppResendOtb extends StatefulWidget {
  const AppResendOtb({super.key});

  @override
  State<AppResendOtb> createState() => _AppResendOtbState();
}

class _AppResendOtbState extends State<AppResendOtb> {
  bool isSent = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Didn’t receive a code?'),
        TextButton(onPressed:isSent?null:(){
          isSent=true;
          setState(() {

          });
        },
          child:Text('Resend'
          ,style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xffD75D72).withValues(alpha:.45),
          ),
        ),
        ),
        Spacer(),
        if(isSent)
        CircularCountDownTimer(
          onComplete: () {
            isSent=false;
            setState(() {

            });
          },
          isReverseAnimation: true,
            width: 28,
            height: 20,
            duration:5,
            textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,),
            //textFormat:CountdownTextFormat.MM_SS,
            isReverse: true,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent
        ),
      ],
    );
  }
}
