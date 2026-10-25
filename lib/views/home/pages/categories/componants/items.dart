part of '../view.dart';
class _Item extends StatelessWidget {
  final ItemModel model;
  const _Item({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.network(model.imageUrl,
            width: 64,
            height: 69,
          ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Text(model.titleEn,
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




