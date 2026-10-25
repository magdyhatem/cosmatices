import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../sherd/app_search.dart';
part 'componants/items.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<ItemModel>? list;

  Future<void> getData() async {
    try {
      final resp = await Dio().get('https://cosmatics.growfet.com/api/Categories');
      list = ItemsData.fromJson({'list': resp.data}).list;
    } on DioException catch (e) {
      print("DioException in CategoriesPage.getData: ${e.response?.statusCode} - ${e.response?.data}");
    } catch (e) {
      print("Error in CategoriesPage.getData: $e");
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
    return  Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text('Categories',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            AppSearch(),
            SizedBox(height: 31,),
             list==null?Center(child: CircularProgressIndicator()):
             ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(),
                  ),
              itemCount: list!.length,
              itemBuilder: (context, index) =>_Item(model: list![index],) ,

            ),

          ],
        ),
      ),
    );
  }
}


class ItemsData {
  late final List<ItemModel> list;

  ItemsData.fromJson(Map<String, dynamic> json){
    list = List.from(json['list']).map((e)=>ItemModel.fromJson(e)).toList();
  }
}

class ItemModel {
  late final int id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  ItemModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    titleEn = json['title_en']??'';
    titleAr = json['title_ar']??'';
    imageUrl = json['image_url']??'';
  }

}

