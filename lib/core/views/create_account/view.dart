import 'package:cosmetics/core/sherd/app_login_or_register.dart';
import 'package:flutter/material.dart';

import '../../sherd/text_field.dart';
import '../verify_code/view.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Align(
                child: Image.asset('assets/images/image_login.png'),
            ),
            SizedBox(height: 30,),
            Text('Create Account',style: TextStyle(
                fontWeight:FontWeight.w700,
              fontSize: 24,
              color: Color(0xff434C6D),
            ),
            ),
            SizedBox(height: 40,),
           TextFieldWidget(label: 'Your Name',),
            TextFieldWidget(label: 'Email',),
            TextFieldWidget(
              withCountryCode: true,
              label: 'Phone Number',),
            TextFieldWidget(
                isPassword: true,
                label: 'Create your password'),
            TextFieldWidget(
              isPassword: true,
                label: 'Confirm password'),
            SizedBox(height: 16),
            FilledButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Verify_Code(),));
            }, child: Text('Next')),
            SizedBox(height:60 ,),
         AppLoginOrRegister(
           isLogin: false,
         )
          ],
        ),
      ),
    );
  }
}
