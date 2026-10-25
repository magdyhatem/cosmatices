import 'package:cosmetics/sherd/cash_helper.dart';
import 'package:cosmetics/views/splash/view.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(color: Color(0xff434C6D))),
        dividerTheme: DividerThemeData(
          color: Colors.grey.withValues(alpha: .25),
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff434C6D),
          ),
          backgroundColor: Color(0xffD9D9D9),
        ),
        scaffoldBackgroundColor: Color(0xffD9D9D9),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xffD75D72),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(60),
            ),
            fixedSize: Size(225, 60),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffD75D72)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff434C6D),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Color(0xff434C6D)),
        ),
      ),
    );
  }
}
