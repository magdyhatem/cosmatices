import 'package:flutter/material.dart';
import '../views/create_account/view.dart';

class AppLoginOrRegister extends StatelessWidget {
  final bool isLogin;
  const AppLoginOrRegister({super.key,this.isLogin=true,});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          isLogin?'Don’t have an account?':'Have an account?',
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero
          ),
          onPressed: (){
            if(isLogin) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAccount(),),);
            }else{
              Navigator.pop(context);
            }
          },
          child:Text(isLogin?'Register':'Login',
          style: TextStyle(
              color: Color(0xffD75D72),
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
        ),)
      ],
    );
  }
}
