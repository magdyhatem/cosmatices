
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 152,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xffECA4C5),
                        Color(0xff434C6D).withValues(alpha:.50),
                      ]),
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: EdgeInsets.only(top: 115),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundImage:NetworkImage('https://avatars.yandex.net/get-music-content/142001/f7595faa.a.8473351-1/m1000x1000?webp=false',
                        ),
                      ),
                    ),
                    SizedBox(height:16 ,),
                    Text('Sara Samer Talaat',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _Item(text: 'Edit Info',image:'edit_info',onTap: (){},),
                  _Item(text: 'Order History',image:'order_history',onTap: (){}),
                  _Item(text: 'Wallet',image:'wallet',onTap: (){}),
                  _Item(text: 'Settings',image:'setting',onTap: (){}),
                  _Item(text: 'Voucher ',image:'voucher',onTap: (){}),
                  _Item(isLogOut: true, text: 'Logout', image:'logout',onTap: (){}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text,image;
  final bool isLogOut;
  final VoidCallback? onTap;
  const _Item({required this.text, required this.image,this.isLogOut=false,this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onTap,
      leading: SvgPicture.asset('assets/icons/$image.svg'),
      title: Text(text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isLogOut?Color(0xffCD0F0F):null
        ),
      ),
      trailing:isLogOut?null: SvgPicture.asset('assets/icons/forward2.svg'),
    );
  }
}

