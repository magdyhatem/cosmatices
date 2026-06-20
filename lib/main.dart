import 'dart:convert';

import 'package:cosmetics/core/sherd/cash_helper.dart';
import 'package:cosmetics/core/views/on_boarding/Model/home_slider_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'core/views/create_new_passwrd/view.dart';
import 'core/views/home/view.dart';
import 'core/views/login/view.dart';
import 'core/views/splash/view.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
 // await getData();
   runApp(const MyApp());
}
getData()async{
   var response = await Dio(

  ).get('https://cosmatics.growfet.com/api/Sliders',);

  if (response.statusCode == 200) {
    List <SliderModel>list=List.from(response.data.map((e) => SliderModel.fromJson(e),));
     print(list[0].id);

  }
  else {
    print(response.statusMessage);
  }}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PageView(children: [
        // HomeView(),
        // LoginView(),
        // Create_New_Password(),
        SplashView(),
        //Verify_Code(),
        //Check_Out(),
        //Profile_View(),
        //SplashView(),
        //MyCartView(),
        //CategoriesView(),
        // Forget_Password(),
        //CreateAccount(),
        //On_BoardingView(),
      ],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(

        textTheme: TextTheme(bodyMedium: TextStyle(color: Color(0xff434C6D))),
        dividerTheme: DividerThemeData( color: Colors.grey.withValues(alpha: .25),),
        appBarTheme: AppBarTheme(
          surfaceTintColor:Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff434C6D)
          ),
          backgroundColor: Color(0xffD9D9D9),),
        scaffoldBackgroundColor: Color(0xffD9D9D9),
        filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
            backgroundColor: Color(0xffD75D72),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(60)),
              fixedSize: Size(225, 60),
        )),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xffD75D72)
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff434C6D),
        ),
        textButtonTheme: TextButtonThemeData(style:TextButton.styleFrom(
           foregroundColor: Color(0xff434C6D),
        )),
      ),
    );
  }
}

