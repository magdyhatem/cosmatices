part of '../view.dart';

class _Slider extends StatefulWidget {
  const _Slider({super.key});

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  List<SliderModel>?list;

  Future<void> getData() async {
    try {
      final resp = await Dio().get('https://cosmatics.growfet.com/api/Sliders');
      list = SliderData.fromjsonlist(resp.data).list;
    } on DioException catch (e) {
      print("DioException in SliderItem.getData: ${e.response?.statusCode} - ${e.response?.data}");
    } catch (e) {
      print("Error in SliderItem.getData: $e");
    } finally {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    if(list==null)
    {
      return Center(child: CircularProgressIndicator());
    }
    return CarouselSlider(
      options:CarouselOptions(
        height:300,
        aspectRatio: 364/320,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: List.generate(list!.length, (index) =>Stack(
        alignment: Alignment.center,
        children: [
          Image.network(list![index].imageUrl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
            color: Color(0xffE9DCD3).withValues(alpha: .80),
            child: Column(
              mainAxisSize:.min,
              children: [
                Row(children: [
                  Expanded(child: Text('${list![index].descriptionTitle1ar}OFF DISCOUNT\nCUPON CODE:${list![index].couponCode}',
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
                  Expanded(child: Text('${list![index].descriptionTitle2ar}\n${list![index].descriptionTitle2en} !',
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
      ))
    );
  }
}

class SliderData
{
  late List<SliderModel> list ;
  SliderData.fromjsonlist(List<dynamic>jsonlist){
    list =jsonlist.map((e) =>SliderModel.fromjson(e),).toList();
  }
}

class SliderModel
{
  late final String couponCode,descriptionTitle1en,descriptionTitle1ar,descriptionTitle2en,descriptionTitle2ar,imageUrl;
  late final num discountPercent;
  late final int id;

  SliderModel.fromjson(Map<String,dynamic>json){
    couponCode = json['coupon_code']??'';
    descriptionTitle1en = json['description_title1_en']??'';
    descriptionTitle1ar = json['description_title1_ar']??'';
    descriptionTitle2en = json['description_title2_en']??'';
    descriptionTitle2ar = json['description_title2_ar']??'';
    imageUrl = json['image_url']??'';
    discountPercent = json['discount_percent']??0;
    id = json['id']??0;
}
}