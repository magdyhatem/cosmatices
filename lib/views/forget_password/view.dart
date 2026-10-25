import 'package:flutter/material.dart';
import '../../sherd/app_back.dart';
import '../../sherd/app_butoom.dart';
import '../../sherd/dio_helper.dart';
import '../../sherd/show_toast.dart';
import '../../sherd/text_field.dart';
import '../login/input_validator.dart';
import '../verify_code/view.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  String? selectedCountryCode = '+20';
  bool isLoading = false;
  bool isClicked = false;

  Future<void> sendData() async {
    setState(() {
      isLoading = true;
    });

    final resp = await DioHelper.sendData(
      path: '/api/Auth/forgot-password',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phoneController.text.trim(),
      },
    );

    setState(() {
      isLoading = false;
    });

    if (resp.isSuccess) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Verify_Code(),
          ),
        );
      }
    } else {
      showMassage(resp.message ?? 'An error occurred. Please try again.');
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Align(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: isClicked
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      const AppBack(),
                      const SizedBox(height: 50),
                      Image.asset('assets/images/image_login.png'),
                      const SizedBox(height: 35),
                      const Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      const SizedBox(height: 35),
                      const Text(
                        'Please enter your phone number below\n to recovery your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8E8EA9),
                        ),
                      ),
                      const SizedBox(height: 45),
                      TextFieldWidget(
                        controller: phoneController,
                        validator: InputValidator.phoneValidator,
                        label: 'Phone Number',
                        withCountryCode: true,
                        onCountryCodeChanged: (value) {
                          selectedCountryCode = value;
                        },
                      ),
                      const SizedBox(height: 60),
                      AppButton(
                        text: 'Next',
                        isLoading: isLoading,
                        onPressed: () {
                          setState(() {
                            isClicked = true;
                          });
                          if (formKey.currentState!.validate()) {
                            sendData();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
