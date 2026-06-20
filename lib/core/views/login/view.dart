import 'package:cosmetics/core/views/create_account/view.dart';
import 'package:flutter/material.dart';
import '../../sherd/app_login_or_register.dart';
import '../../sherd/text_field.dart';
import '../forget_password/view.dart';
import '../home/pages/profile_view.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
final

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Align(
          child: Padding(
            padding: EdgeInsets.all(14).copyWith(top: 50),
            child: SingleChildScrollView(
              child: Form(
                key:formKey,
                child: Column(
                  children: [
                  Image.asset('assets/images/login.png'),
                    SizedBox(height: 24),
                    Text('Login Now',style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(height: 14,),
                    Text('Please enter the details below to continue',
                      style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    SizedBox(height: 25,),
                    Row(children: [
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextFieldWidget(
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return 'phone must be not empty';
                            }return null;
                          },
                          label: 'Phone Number',
                        withCountryCode:true ,
                        ),
                      ),
                    ],),
                    TextFieldWidget(
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return 'password must be not empty';
                        }
                        return null;
                      },
                      label: 'Your Password',
                      isPassword: true,
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerEnd,
                      child:TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_Password(),));
                            },child:
                          Text('Forget Password?',
                            style: TextStyle(
                              color: Color(0xffD75D72),
                          ),
                          ),
                          ),
                    ),
                    SizedBox(height: 40,),
                    FilledButton(onPressed: (){
                     if( formKey.currentState!.validate()) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),
                      ),
                     );
                     }
                    }, child: Text('Login')),
                    SizedBox(height: 28,),
                    AppLoginOrRegister(),
                ],),
              ),
            ),
          ),
        ),
    );
  }
}
