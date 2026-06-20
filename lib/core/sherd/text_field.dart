import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatefulWidget {
  final bool isPassword;
  final bool  withCountryCode;
  final String label;
  final String? Function(String?)? validator;
  const TextFieldWidget({super.key, required this.label,  this.withCountryCode=false, this.isPassword=false, this.validator});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final list=[10,20,30,40,];
  late int selectCurrentCode;
  bool isHiden =true;
   @override
  initState()
  {
    super.initState();
    selectCurrentCode=list.first;
  }
  @override
  Widget build(BuildContext context) {
    return
   Padding(
          padding: EdgeInsetsDirectional.only(bottom: 12),
          child: Row(
            crossAxisAlignment: .start,
            children: [
          if(widget.withCountryCode)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff434C6D).withValues(alpha: .40)),
                  borderRadius:BorderRadius.circular(8)
              ),
              child: DropdownButton<int>(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 17,vertical: 3),
                icon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 4),
                  child: SvgPicture.asset('assets/icons/down.svg',),
                ),
                value: selectCurrentCode,
                  items:list.map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text("$e"),
                    ),
                  )
                      .toList(),
                  onChanged:(value){
                    selectCurrentCode=value!;
                    setState(() {
                    });
                  }
              ),
            ),
          ),
          Expanded(child:
          TextFormField(
            validator: widget.validator,
            obscureText: widget.isPassword&&isHiden,
            decoration: InputDecoration(
              suffixIcon:widget.isPassword?IconButton(onPressed: (){
                isHiden=!isHiden;
                setState(() {});
              }, icon: SvgPicture.asset(
                  isHiden?"assets/icons/visibility_off.svg":'assets/icons/visibility.svg'),):null,
              labelStyle: TextStyle(
                fontSize: 12,fontWeight: FontWeight.w400,
                color: Color(0xff8E8EA9),
              ),
              labelText: widget.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),),
            ),)
            ,),
              ],),
       );
  }
}
