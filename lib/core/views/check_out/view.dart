
import 'package:cosmetics/core/views/check_out/text_with.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Check_Out extends StatelessWidget {
  const Check_Out({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsetsDirectional.only(top: 28),
          child: Text('Check Out'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: Color(0xff73B9BB).withValues(alpha: .20)
        ),
        child: SingleChildScrollView(
          padding:EdgeInsets.all(27),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Text('Delivery to',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 18,),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  side: BorderSide(color: Color(0xff73B9BB))
                ),
                leading: Container(
                  height:60,
                  width:96,
                  color: Colors.black,
                ),
                title: Text('Home',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                ),
              ),
                subtitle: Text('Mansoura, 14 Porsaid St',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    color: Color(0xff8E8EA9)
                  ),
                ),
                trailing: SvgPicture.asset('assets/icons/check.svg'),
              ),
              SizedBox(height: 40,),
              Text('Payment Method',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 18,),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                    side:BorderSide(color:Color(0xff73B9BB) )
                ),
                leading: SvgPicture.asset('assets/icons/meza.svg'),
                title: Text('**** **** **** 0256',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),
                trailing:SvgPicture.asset('assets/icons/check.svg') ,
              ),
              SizedBox( height: 12,),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    side:BorderSide(color:Color(0xff73B9BB) )
                ),
                leading: SvgPicture.asset('assets/icons/voucher.svg'),
                title: Text('Add vaucher',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),
                trailing:OutlinedButton(
                  style:OutlinedButton.styleFrom(
                    backgroundColor: Color(0xffD75D72),
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Color(0xffD75D72)),
                  ),
                    onPressed: (){}, child: Text('Apply')),
              ),
              SizedBox(height: 31,),
              Text('-'*72,style: TextStyle(color: Color(0xff434C6D).withValues(alpha: .31)
              ),
              ),
              SizedBox(height: 31,),
              Text('- REVIEW PAYMENT',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 20,),
              Text('PAYMENT SUMMARY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 40,),
              TextWith(text: 'Subtotal',price: '16.100 EGP',),
              SizedBox(height: 10,),
              TextWith(text: 'SHIPPING FEES',price: 'TO BE CALCULATED',),
              SizedBox(height: 30,),
              Divider(
                color: Color(0xff73B9BB),
              ),
              SizedBox(height: 30,),
              TextWith(text: 'TOTAL + VAT',price: '16.100 EGP',font:true,),
              SizedBox(height: 30,),
              FilledButton(onPressed: (){}, child:
              Row(
                mainAxisSize: .min,
                spacing: 5,
                children: [
                  SvgPicture.asset('assets/icons/order.svg'),
                  Text('ORDER'),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
