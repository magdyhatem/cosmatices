import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatefulWidget {
  final ValueChanged<String>? onCountryCodeChanged;
  final TextEditingController? controller;
  final bool isPassword;
  final bool withCountryCode;
  final String label;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    required this.label,
    this.withCountryCode = false,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.onCountryCodeChanged,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  List<CountriesModel>? list;
  late String selectCurrentCode;

  Future<void> getData() async {
    try {
      final resp = await Dio().get('https://cosmatics.growfet.com/api/Countries');
      list = CountriesData.fromJson({"list": resp.data}).list;
      if (list != null && list!.isNotEmpty) {
        selectCurrentCode = list!.first.code;
        widget.onCountryCodeChanged?.call(selectCurrentCode);
      }
    } on DioException catch (e) {
      print("DioException in TextFieldWidget.getData: ${e.response?.statusCode} - ${e.response?.data}");
    } catch (e) {
      print("Error in TextFieldWidget.getData: $e");
    } finally {
      setState(() {});
    }
  }

  bool isHiden = true;

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 12),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          if (widget.withCountryCode)
            Padding(
              padding: EdgeInsetsDirectional.only(end: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff434C6D).withOpacity(.40),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: list == null
                    ? Center(child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ))
                    : DropdownButton<String>(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 17,
                          vertical: 3,
                        ),
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 4),
                          child: SvgPicture.asset('assets/icons/down.svg'),
                        ),
                        value: selectCurrentCode,
                        items: list!
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.code,
                                child: Text(e.code),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          selectCurrentCode = value!;
                          widget.onCountryCodeChanged?.call(selectCurrentCode);
                          setState(() {});
                        },
                      ),
              ),
            ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.isPassword && isHiden,
              decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isHiden = !isHiden;
                          setState(() {});
                        },
                        icon: SvgPicture.asset(
                          isHiden
                              ? "assets/icons/visibility_off.svg"
                              : 'assets/icons/visibility.svg',
                        ),
                      )
                    : null,
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8E8EA9),
                ),
                labelText: widget.label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountriesData {
  late final List<CountriesModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountriesModel.fromJson(e)).toList();
  }
}

class CountriesModel {
  late final int id;
  late final String code;
  late final String nameEn;
  late final String nameAr;

  CountriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    nameEn = json['name_en'] ?? '';
    nameAr = json['name_ar'] ?? '';
  }
}
