import 'package:cosmetics/core/sherd/app_back.dart';
import 'package:cosmetics/core/views/verify_code/view.dart';
import 'package:flutter/material.dart';
import '../../sherd/text_field.dart';

class Forget_Password extends StatelessWidget {
  const Forget_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Align(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: SafeArea(
              child: Column(
                children: [
                  AppBack(),
                  SizedBox(height: 50,),
                  Image.asset('assets/images/image_login.png'),
                  SizedBox(height:35 ,),
                  Text('Forget Password',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff434C6D),
                    ),
                  ),
                  SizedBox(height: 35,),
                 Text(
                   textAlign: TextAlign.center,
                     'Please enter your phone number below\n to recovery your password.',
                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff8E8EA9),),
                 ),
                  SizedBox(height: 45,),
                  TextFieldWidget(
                      label: 'Phone Number',
                    withCountryCode: true,
                  ),
                  SizedBox(height: 60,),
                  FilledButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Verify_Code(),));
                  }, child: Text('Next')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
