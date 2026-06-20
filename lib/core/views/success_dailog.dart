import 'package:cosmetics/core/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key,});
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 8),
      insetPadding: EdgeInsets.all(24),
      backgroundColor: Color(0xffD9D9D9),
      children: [
        Lottie.asset('assets/lotti/success3.json',
        width: 100,
          height: 100,
        ),
        SizedBox(height: 16,),
        Center(child: Text(
          'Password Created!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            'Congratulations! Your password has been successfully created',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
            ),
        ),
        ),
        SizedBox(height: 22,),
        FilledButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView(),));
        }, child: Text('Return to login')),

      ],
    );
  }
}
