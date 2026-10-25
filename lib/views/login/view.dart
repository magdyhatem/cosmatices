import 'package:flutter/material.dart';
import '../../sherd/app_butoom.dart';
import '../../sherd/app_login_or_register.dart';
import '../../sherd/cash_helper.dart';
import '../../sherd/dio_helper.dart';
import '../../sherd/show_toast.dart';
import '../../sherd/text_field.dart';
import '../forget_password/view.dart';
import '../home/view.dart';
import 'input_validator.dart';

class LoginView extends StatefulWidget {
  final ValueChanged<String>? onCountryCodeChanged;

  const LoginView({super.key, this.onCountryCodeChanged});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isClicked = false;
  String? selectedCountrycode = '+20';
  final phonecontroller = TextEditingController(text: '1033429389');
  final passwordcontroller = TextEditingController(text: '12345678');
  final formKey = GlobalKey<FormState>();


Datastate? state;

  Future<void> sendData() async {
    state = Datastate.loading;
    final phone = phonecontroller.text.trim();
    final password = passwordcontroller.text.trim();
    print(phone);
    print(password);
    print(selectedCountrycode);

    final CustomResponse resp = await DioHelper.sendData(
      path: '/api/Auth/login',
      data: {
    "countryCode": selectedCountrycode,
    "phoneNumber": phone,
    "password": password,
    },
    );
    if(resp.isSuccess){
      final model = UserData.fromJson(resp.data);
      await CacheHelper.saveUserData(model);
      state = Datastate.success;
      token = model.token;
      print(token);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),
      ),
      );

    }else{
      showMassage(resp.message);
      state = Datastate.faile;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Padding(
          padding: EdgeInsets.all(14).copyWith(top: 50),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: isClicked
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              onChanged: () {
                if (isClicked) {
                  formKey.currentState!.validate();
                }
              },
              child: Column(
                //crossAxisAlignment: .stretch,
                children: [
                  Image.asset('assets/images/login.png'),
                  SizedBox(height: 24),
                  //Column(
                  //  crossAxisAlignment: .center,
                  //  children: [
                    Text(
                      'Login Now',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Please enter the details below to continue',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                 // ],),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Expanded(
                        child: TextFieldWidget(
                          validator: InputValidator.phoneValidator,
                          label: 'Phone Number',
                          onCountryCodeChanged: (value) {
                            selectedCountrycode = value;
                          },
                          controller: phonecontroller,
                          withCountryCode: true,
                        ),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    onCountryCodeChanged: widget.onCountryCodeChanged,
                    validator: InputValidator.passwordValidator,
                    label: 'Your Password',
                    controller: passwordcontroller,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Forget_Password(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Color(0xffD75D72)),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  AppButton(
                    text: 'Login',
                    isLoading: state == Datastate.loading,
                    onPressed:(){
                      isClicked = true;
                          if (formKey.currentState!.validate()) {
                            sendData();
                          }
                    },),
                  SizedBox(height: 28),
                  AppLoginOrRegister(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class UserData {

  late final String token;
  late final String refreshToken;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json){
    token = json['token']??'';
    refreshToken = json['refreshToken'];
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;
  late final String otpCode;
  late final String otpExpiration;

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    username = json['username']??'';
    email = json['email']??'';
    phoneNumber = json['phoneNumber']??'';
    countryCode = json['countryCode']??'';
    role = json['role']??'';
    profilePhotoUrl = json['profilePhotoUrl']??'';
    otpCode = json['otpCode']??'';
    otpExpiration = json['otpExpiration']??'';
  }
}