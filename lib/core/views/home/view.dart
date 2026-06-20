import 'package:cosmetics/core/views/home/pages/categories_view.dart';
import 'package:cosmetics/core/views/home/pages/home_view.dart';
import 'package:cosmetics/core/views/home/pages/my_cart.dart';
import 'package:cosmetics/core/views/home/pages/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list =[
    "home .svg",
    "categories.svg",
    "my _cart.svg",
    "profile.svg",
  ];

  int currentIndex = 0;


  final pages=[
    HomePage(),
    CategoriesPage(),
    MyCartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Container(
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(offset: Offset(4, 4),
            blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .10),
            ),
            BoxShadow(offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .10),
            ),
          ],

          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),),
        margin: EdgeInsets.symmetric(horizontal: 12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex=value;
            setState(() {

            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: List.generate(
          list.length,
              (index) =>BottomNavigationBarItem(
                label: '',
                  icon: SvgPicture.asset('assets/icons/${list[index]}',
                  color: currentIndex==index?Theme.of(context).primaryColor:null),
          ),
        ),
        ),
      ),
    );
  }
}


