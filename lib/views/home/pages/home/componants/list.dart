part of '../view.dart';
class _List extends StatefulWidget {
  const _List({super.key});

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  List<ProducetModel>? list;

  Future<void> getData() async {
    try {
      final resp = await Dio().get('https://cosmatics.growfet.com/api/Products');
      list = ProducetData.fromJson({"list": resp.data}).list;
    } on DioException catch (e) {
      print("DioException in HomeProductList.getData: ${e.response?.statusCode} - ${e.response?.data}");
    } catch (e) {
      print("Error in HomeProductList.getData: $e");
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
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Top rated products',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xff434C6D),
        ),
        ),
        SizedBox(height: 14,),
        list==null?Center(child: CircularProgressIndicator()):GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 10,
              childAspectRatio: 0.68,
            ),
            itemCount: list!.length,
            itemBuilder: (context, index) =>_Item(model: list![index],))
      ],
    );
  }
}






class ProducetData {
  late final List<ProducetModel> list;

  ProducetData.fromJson(Map<String, dynamic> json){
    list = List.from(json['list']??[]).map((e)=>ProducetModel.fromJson(e)).toList();
  }

}

class ProducetModel {
  late final int id;
  late final String nameEn;
  late final String nameAr;
  late final String descriptionEn;
  late final String descriptionAr;
  late final num? price;
  late final int stock;
  late final String imageUrl;
  late final int categoryId;

  ProducetModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    nameEn = json['name_en']??'';
    nameAr = json['name_ar']??'';
    descriptionEn = json['description_en']??'';
    descriptionAr = json['description_ar']??'';
    price = json['price']??0;
    stock = json['stock']??0;
    imageUrl = json['image_url']??'';
    categoryId = json['category_id']??0;
  }

}
