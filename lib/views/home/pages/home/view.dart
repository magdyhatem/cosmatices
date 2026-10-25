import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../sherd/app_search.dart';

part 'componants/slider.dart';

part 'componants/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = ["home .svg", "categories.svg", "my _cart.svg", "profile.svg"];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 80, title: AppSearch()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: .start,
          children: [_Slider(), SizedBox(height: 27), _List()],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .10),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .10),
            ),
          ],

          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.symmetric(horizontal: 12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: List.generate(
            list.length,
                (index) =>
                BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                    'assets/icons/${list[index]}',
                    color: currentIndex == index
                        ? Theme
                        .of(context)
                        .primaryColor
                        : null,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProducetModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffD9D9D9),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Colors.black.withValues(alpha: .25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            alignment: AlignmentGeometry.topEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  model.imageUrl,
                  width: 170,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFAFA),
                      borderRadius: BorderRadius.circular(8)),
                  padding:EdgeInsets.all(8),
                  child: SvgPicture.asset('assets/icons/shopping_cart.svg'),
                ),
              )
            ],
          ),
          SizedBox(height: 11),
          Text(model.nameEn),
          SizedBox(height: 9),
          Text('\$${model.price}'),
        ],
      ),
    );
  }
}
