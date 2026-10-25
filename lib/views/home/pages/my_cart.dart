import 'package:cosmetics/sherd/dio_helper.dart';
import 'package:cosmetics/sherd/show_toast.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
CartData ?data;
Future<void>  getData()async{
    final CustomResponse res =await DioHelper.getData(path:
      "/api/Cart"
    );
    if(res.isSuccess){
      data =CartData.fromJson(res.data);
    }else{
      showMassage(res.message);
    }
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
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
          children:data==null?[
            Center(child: Column(
              mainAxisAlignment: .center,
              children: [
                CircularProgressIndicator(),
              ],
            ))
          ]: [
            Text('You have ${data?.items?.length??0} products in your cart',style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff434C6D).withValues(alpha: 55),
            ),
            ),
            SizedBox(height: 22,),
            if(data?.items?.isNotEmpty==true)
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context, index) =>_Item(item: data?.items?[index],),
              separatorBuilder: (context, index) => Divider(),
              itemCount: data?.items?.length??0,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final CartModel? item;
  const _Item({super.key, required this.item});

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
              child: Image.network(widget.item?.imageUrl??"",
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
              TextSpan(text: '${widget.item?.productNameAr}\n\n',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff3B4569),
              ),
                  ),
              TextSpan(text: '${widget.item?.productNameEn}\n',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff3B4569).withOpacity(.73),
              ),),
              WidgetSpan(child: SizedBox(height: 23,)),
              TextSpan(text: '${widget.item?.price} EGP',style: TextStyle(
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
                        Text('${widget.item?.quantity}'),
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


class CartData {
  List<CartModel>? items;
  num? total;

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CartModel>[];
      json['items'].forEach((v) {
        items!.add(new CartModel.fromJson(v));
      });
    }
    total = json['total']??[];
  }

}

class CartModel {
  int? productId;
  String? productNameEn;
  String? productNameAr;
  int? quantity;
  double? price;
  String? imageUrl;


  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id']??0;
    productNameEn = json['product_name_en']??'';
    productNameAr = json['product_name_ar']??'';
    quantity = json['quantity']??0;
    price = json['price']??0;
    imageUrl = json['image_url']??'';
  }
}
// state
// firbase
// serverlocatr
