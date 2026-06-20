import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../sherd/app_search.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

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
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(),
                  ),
              itemCount: 10,
              itemBuilder: (context, index) =>_Item() ,

            ),

          ],
        ),
      ),
    );
  }
}
class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.network("https://i.pinimg.com/originals/12/a2/76/12a2767fdbfaf9fca9a07872d1880433.jpg",
            width: 64,
            height: 69,
          ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Text('Bundles',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff434C6D),
            ),
          ),
        ),
        SvgPicture.asset('assets/icons/forward2.svg'),
      ],
    );
  }
}

