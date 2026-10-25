import 'package:flutter/material.dart';
import '../../sherd/cash_helper.dart';
import '../../sherd/down_pin_filds.dart';
import '../create_new_passwrd/view.dart';
import 'App_resend_otb.dart';

class Verify_Code extends StatelessWidget {
  const Verify_Code({super.key});

  @override
  Widget build(BuildContext context) {
    final email = CacheHelper.email.isNotEmpty ? CacheHelper.email : 'your email';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 70),
            Align(
                child: Image.asset('assets/images/image_login.png')),
            const SizedBox(height: 40),
            const Text('Verify Code',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                textAlign:TextAlign.center,
                TextSpan(
                children:[
                  const TextSpan(text: 'We just sent a 4-digit verification code to\n your email '),
                  TextSpan(text: email, style: const TextStyle(color: Color(0xff8E8EA9))),
                  const TextSpan(text: '. Enter the code in the box below to continue.'),
                ],
              ),
              ),
            ),
            SizedBox(height: 30,),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text('Edit the number',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffD75D72),
                ),
              ),
            ),
            SizedBox(height: 20,),
            DownPinFilds(),
            SizedBox(height: 38,),
            AppResendOtb(),
            SizedBox(height: 100,),
            FilledButton(  onPressed: (){
             Navigator.push(context,MaterialPageRoute(builder: (context) => Create_New_Password(),));
            }, child:Text('Done'))
          ],),
        ),
      ),
    );
  }
}
