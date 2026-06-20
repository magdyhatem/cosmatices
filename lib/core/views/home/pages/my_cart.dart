import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart',style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Color(0xff434C6D),
        ),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You have 4 products in your cart',style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff434C6D).withValues(alpha: 55),
            ),
            ),
            SizedBox(height: 22,),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context, index) =>_Item(),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.network('https://www.letu.ru/common/img/pim/2026/03/TL_1955db1a-b217-40e9-9363-eb88dfec6ad4.jpg',
              width:102,
                height: 102,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(6.0),
              child: SvgPicture.asset('assets/icons/delete.svg'),
            ),
          ],
        ),
        SizedBox(width: 6,),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 18,),
            Text.rich(
              TextSpan(
                children: [
              TextSpan(text: 'Note Cosmetics\n\n',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff3B4569),
              ),
                  ),
              TextSpan(text: 'Ultra rich mascara for lashes\n',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff3B4569).withOpacity(.73),
              ),),
              WidgetSpan(child: SizedBox(height: 23,)),
              TextSpan(text: '350 EGP',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff3B4569),
              ),),
            ],
            ),
            ),
             Row(
               mainAxisAlignment: .end,
               children: [
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                    decoration: BoxDecoration(
                        border:Border.all(
                          color: Color(0xff8E8EA9),
                        ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize:.min,
                        children: [
                        IconButton(
                          onPressed: (){
                          if(count>1){
                            count --;
                            setState(() {});
                          }
                        }, icon: SvgPicture.asset('assets/icons/minus.svg'),
                        ),
                        Text('$count'),
                        IconButton(onPressed: (){
                          count ++;
                          setState(() {});
                        }, icon: SvgPicture.asset('assets/icons/plus.svg'),
                        ),
                      ],),
                    ),
                  ),
               ],
             ),
          ],
          ),
        ),
      ],
    );
  }
}
