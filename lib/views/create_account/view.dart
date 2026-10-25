import 'package:flutter/material.dart';

import '../../sherd/app_butoom.dart';
import '../../sherd/app_login_or_register.dart';
import '../../sherd/cash_helper.dart';
import '../../sherd/dio_helper.dart';
import '../../sherd/show_toast.dart';
import '../../sherd/text_field.dart';
import '../login/input_validator.dart';
import '../login/view.dart';
import '../verify_code/view.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? selectedCountryCode = '+20';
  bool isLoading = false;
  bool isClicked = false;

  Future<void> sendData() async {
    setState(() {
      isLoading = true;
    });

    final payload = {
      "username": nameController.text.trim(),
      "countryCode": selectedCountryCode,
      "phoneNumber": phoneController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };
    print("Sending register payload: $payload");

    final CustomResponse resp = await DioHelper.sendData(
      path: '/api/Auth/register',
      data: payload,
    );

    setState(() {
      isLoading = false;
    });

    if (resp.isSuccess) {
      // Save email for OTP screen
      CacheHelper.setEmail(emailController.text.trim());

      if (resp.data != null &&
          resp.data is Map<String, dynamic> &&
          resp.data['token'] != null) {
        final model = UserData.fromJson(resp.data);
        await CacheHelper.saveUserData(model);
        token = model.token;
      }

      showMassage(
        resp.message ?? 'User registered successfully. Please check your email for OTP.',
        isError: false,
      );

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Verify_Code(),
          ),
        );
      }
    } else {
      showMassage(resp.message ?? 'Registration failed. Please try again.');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              autovalidateMode: isClicked
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Align(
                    child: Image.asset('assets/images/image_login.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                    controller: nameController,
                    validator: InputValidator.nameValidator,
                    label: 'Your Name',
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    validator: InputValidator.emailValidator,
                    label: 'Email',
                  ),
                  TextFieldWidget(
                    controller: phoneController,
                    validator: InputValidator.phoneValidator,
                    withCountryCode: true,
                    label: 'Phone Number',
                    onCountryCodeChanged: (value) {
                      selectedCountryCode = value;
                    },
                  ),
                  TextFieldWidget(
                    controller: passwordController,
                    validator: InputValidator.passwordValidator,
                    isPassword: true,
                    label: 'Create your password',
                  ),
                  TextFieldWidget(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password must not be empty';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    isPassword: true,
                    label: 'Confirm password',
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Next',
                    isLoading: isLoading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        isClicked = true;
                      });
                      if (formKey.currentState!.validate()) {
                        sendData();
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  const AppLoginOrRegister(
                    isLogin: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
