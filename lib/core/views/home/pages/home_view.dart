import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../sherd/app_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list =[
    "home .svg",
    "categories.svg",
    "my _cart.svg",
    "profile.svg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        title:AppSearch(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/offers.png'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
                  color: Color(0xffE9DCD3).withValues(alpha: .80),
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(child: Text('50% OFF DISCOUNT\nCUPON CODE : 125865',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff68372E),
                          ),
                        ),
                        ),
                        SvgPicture.asset('assets/icons/offer.svg'),
                      ],
                      ),
                      SizedBox(height: 12,),
                      Row(children: [
                        SvgPicture.asset('assets/icons/offer.svg'),
                        Expanded(child: Text('Hurry up!\nSkin care only !',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff434C6D),
                          ),
                          textAlign: TextAlign.end,
                        ),
                        ),
                      ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 27,),
            Text(
              'Top rated products',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff434C6D),
            ),
            ),
            SizedBox(height: 14,),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.68,
                ),
                itemCount: 10,
                itemBuilder: (context, index) =>_Item())
          ],),
      ),
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
class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 400,
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffD9D9D9),
        boxShadow:[
          BoxShadow(offset: Offset(0,1),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            color: Colors.black.withValues(alpha: .25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:.start ,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network('https://i.pinimg.com/736x/ed/52/f3/ed52f3af437e1e46fbec7a5ef8f090eb.jpg',
              width:170,
              height:160 ,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 11,),
          Text('Athe Red lipstick',),
          SizedBox(height: 9,),
          Text('\$44.99',),
        ],),
    );
  }
}

