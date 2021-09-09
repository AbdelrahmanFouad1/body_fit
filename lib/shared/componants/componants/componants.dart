import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class TextFieldRow extends StatelessWidget {
  final String name;
  final String svgImage;
  final String hint;
  final TextInputType inputType;
  final bool number;
  final TextEditingController textEditingController;

  TextFieldRow(
      {required this.name,
      required this.svgImage,
      required this.number,
      required this.textEditingController,
      required this.hint,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgImage,
            fit: BoxFit.cover,
            height: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
              width: 60,
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: arabicStyle.copyWith(fontSize: 16),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: darkColor, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'أدخل البيانات /  Can\'t be empty';
                  }
                },
                style: arabicStyle,
                controller: textEditingController,
                inputFormatters: number
                    ? [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        ),
                      ]
                    : [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'[0-9]'),
                        ),
                      ],
                textInputAction: TextInputAction.next,
                cursorColor: Colors.amber,
                keyboardType: inputType,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: arabicStyle.copyWith(color: Colors.white38),
                  isCollapsed: false,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget defaultTextFormField({
  required String hint,
  required TextInputType inputType,
  required TextEditingController textEditingController,
  bool isPassword = false,
  required Icon perfixIcon,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    onFieldSubmitted: (value) {
      textEditingController.text = value;
    },
    controller: textEditingController,
    style: arabicStyle,
    obscureText: isPassword,
    // inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
    textInputAction: TextInputAction.next,
    cursorColor: Colors.amber,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: perfixIcon,
      suffixIcon: suffixIcon,
      hintText: hint,
      hintStyle: arabicStyle.copyWith(color: Colors.white38),
      isCollapsed: false,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
          borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(5),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}

void navigateTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget genderContainer(
    {required var cubit, required String photo, required bool male}) {
  return Expanded(
    child: InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        cubit.userType();
      },
      child: Column(
        children: [
          male
              ? Container(
            decoration: cubit.male
                ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgrondColor,
                  darkColor,
                  Colors.pinkAccent,
                  darkColor,
                  backgrondColor,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              color: darkColor,
              borderRadius: BorderRadius.circular(60),
            )
                : BoxDecoration(
              color: backgrondColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: SvgPicture.asset(
              photo,
              // height: 140,
            ),
          )
              : Container(
            decoration: !cubit.male
                ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgrondColor,
                  darkColor,
                  Colors.pinkAccent,
                  darkColor,
                  backgrondColor,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              color: darkColor,
              borderRadius: BorderRadius.circular(60),
            )
                : BoxDecoration(
              color: backgrondColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: SvgPicture.asset(
              photo,
              // height: 140,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          male ?  Text(
            cubit.language[0],
            style: arabicStyle.copyWith(
                color: Colors.amber, fontWeight: FontWeight.bold),
          ) : Text(
            cubit.language[1],
            style: arabicStyle.copyWith(
                color: Colors.amber, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget buttonSheetWidget() {
  return Container(
    height: 410,
    margin: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 50),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(20),
    ),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/Tapemeasurecolored.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/images/measure.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    ),
  );
}

Widget userButton({
  required Function onPressed,
  required String title,
  required String arTitle,
}) {
  return Container(
    decoration: BoxDecoration(
      color: darkColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextButton(
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title.toUpperCase(),
            style: englishStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            arTitle,
            style: arabicStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.yellow),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
