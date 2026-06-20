import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/sherd/cash_helper.dart';
import 'package:cosmetics/core/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../on_boarding/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Future.delayed(Duration(seconds:2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>CashHelper.isFirstTime? On_BoardingView():LoginView()),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      body: Center(
        child:BounceInDown(
          duration: Duration(seconds: 3),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/splash.png',
          height: 200,
            width: 200,
          ),
            SizedBox(height: 16,),
          SvgPicture.asset('assets/icons/cosmates.svg', width:125,height: 18,),
            //SvgPicture.asset('assets/icons/splash_image2.svg', width:200,height:18,),
        ],),
      ),
      ),
    );
  }
}