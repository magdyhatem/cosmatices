import 'package:cosmetics/core/sherd/cash_helper.dart';
import 'package:cosmetics/core/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class On_BoardingView extends StatefulWidget {
  const On_BoardingView({super.key});

  @override
  State<On_BoardingView> createState() => _On_BoardingViewState();
}

class _On_BoardingViewState extends State<On_BoardingView> {
 @override


  final List =[
    _Model(image: 'assets/images/on_boarding1.png', title: 'WELCOME!', desc: 'Makeup has the power to transform your \n mood and empowers you to be a more \n confident person.'),
    _Model(image: 'assets/images/on_boarding2.png', title: 'SEARCH & PICK', desc: 'We have dedicated set of products and \n routines hand picked for every skin type.'),
    _Model(image: 'assets/images/on_boarding3.png', title: 'PUCH NOTIFICATIONS ', desc: 'Allow notifications for new makeup & \n cosmetics offers.'),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast=currentIndex==List.length-1;
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
     body: SafeArea(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
       if(!isLast)
           Align(
               alignment: Alignment.centerRight,
               child: TextButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView(),));
               }, child: Text('skip'))),
           SizedBox(height: 75,),
           Image.asset(List[currentIndex].image),
           SizedBox(height: 28,),
           Center(
             child: Text(List[currentIndex].title,
               style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold
               ),),
           ),
           SizedBox(height: 10,),
           Text(List[currentIndex].desc,
           textAlign: TextAlign.center,
           style: TextStyle(
               fontSize: 16,
             fontWeight: FontWeight.w400
           ),
           ),
           SizedBox(height: 30,),
           currentIndex==List.length-1
              ? FilledButton(
               onPressed: (){
                 CashHelper.setNotIsFirst();
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView(),));
           }, child: Text('let’s start!'))
               :FloatingActionButton(onPressed: (){
                            currentIndex++;
                            setState(() {
                            });
                          },child:SvgPicture.asset( 'assets/icons/forword.svg'),)
       ],),
     ),
    );
  }
}
class _Model{
   final String image,title,desc;

  _Model({required this.image, required this.title, required this.desc});
}