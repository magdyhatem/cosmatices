import 'package:cosmetics/core/views/success_dailog.dart';
import 'package:flutter/material.dart';
import '../../sherd/text_field.dart';
class Create_New_Password extends StatelessWidget {
  const Create_New_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            Text('The password should have at least\n6 characters.',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff8E8EA9)
            ),
            ),
            SizedBox(height: 80,),
            TextFieldWidget(
                isPassword: true,
                label: 'New password'),
            SizedBox(height: 16,),
            TextFieldWidget(
                isPassword: true,
                label: 'Confirm password'),
            SizedBox(height: 72,),
            FilledButton(onPressed: (){
              showDialog(context: context, builder: (context) => SuccessDialog(

              ),);
            }, child: Text('Confirm')),
          ],
        ),
      ),
    ); ;
  }
}
