import 'dart:math';
import 'package:body_fat/modules/calculation/calculation_screen.dart';
import 'package:body_fat/shared/componants/componants/componants.dart';
import 'package:body_fat/shared/componants/constants/constants.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_cubit.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_states.dart';
import 'package:body_fat/shared/network/local/cache_helper.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class MyHome extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final waistController = TextEditingController();
  final neckController = TextEditingController();
  final hipsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var number = Random().nextInt(14);
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if (gotData == true) {
            nameController.text = userModel.name;
            ageController.text = userModel.age.toString();
            heightController.text = userModel.height.toInt().toString();
            weightController.text = userModel.weight.toInt().toString();
            waistController.text = userModel.waist.toInt().toString();
            neckController.text = userModel.neck.toInt().toString();
            hipsController.text = userModel.hips.toInt().toString();
          }
          return Directionality(
            textDirection: cubit.arabic ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),

                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.pinkAccent.withOpacity(0.6),
                              darkColor,
                              darkColor,
                              backgrondColor,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/cover.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          genderContainer(
                              cubit: cubit,
                              photo: 'assets/icons/male${number + 1}.svg',
                              male: true),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showCupertinoModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => buttonSheetWidget(),
                                  );
                                },
                                child: Text(
                                  ' How to measure \n كيفية القياس',
                                  style: arabicStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                splashColor: Colors.pinkAccent,
                                onTap: () {
                                  cubit.languageChange();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/translation.svg',
                                      width: 30,
                                    ),
                                    cubit.arabic
                                        ? Text(
                                            'English',
                                            style: arabicStyle,
                                          )
                                        : Text(
                                            'العربيه',
                                            style: arabicStyle,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          genderContainer(
                              cubit: cubit,
                              photo: 'assets/icons/female${number + 1}.svg',
                              male: false),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFieldRow(
                              hint: '${nameController.text} nana',
                              name: cubit.language[2],
                              svgImage: 'assets/icons/id.svg',
                              number: false,
                              textEditingController: nameController,
                              inputType: TextInputType.name,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${ageController.text} Year',
                              name: cubit.language[3],
                              svgImage: 'assets/icons/age2.svg',
                              number: true,
                              textEditingController: ageController,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${heightController.text} CM',
                              name: cubit.language[4],
                              svgImage: 'assets/icons/height-limit.svg',
                              number: true,
                              textEditingController: heightController,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${weightController.text} KG',
                              name: cubit.language[5],
                              svgImage: 'assets/icons/weight.svg',
                              number: true,
                              textEditingController: weightController,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${waistController.text} CM',
                              name: cubit.language[6],
                              svgImage: 'assets/icons/waist.svg',
                              number: true,
                              textEditingController: waistController,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${neckController.text} CM',
                              name: cubit.language[7],
                              svgImage: 'assets/icons/neck.svg',
                              number: true,
                              textEditingController: neckController,
                            ),
                            defaultSizedBox(),
                            TextFieldRow(
                              inputType: TextInputType.number,
                              hint: '${hipsController.text} CM',
                              name: cubit.language[8],
                              svgImage: 'assets/icons/hips.svg',
                              number: true,
                              textEditingController: hipsController,
                            ),
                            defaultSizedBox(),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/marathon.png',
                                  fit: BoxFit.cover,
                                  height: 60,
                                ),
                                Container(
                                  width: 70,
                                  child: Text(
                                    cubit.language[9],
                                    style: arabicStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButton<String>(
                                    dropdownColor: backgrondColor,
                                    onChanged: (value) {
                                      cubit.dropDownValue(value!,
                                          arabicActivity.indexOf(value));
                                    },
                                    style: arabicStyle,
                                    isExpanded: false,
                                    icon: Icon(
                                      CupertinoIcons.arrow_down,
                                      color: Colors.amber,
                                    ),
                                    elevation: 1,
                                    value:
                                        cubit.activity[cubit.dropButtonIndex],
                                    items: cubit.activity.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CupertinoButton(
                                color: Colors.amber,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'إحسب / Calculate',
                                      style: arabicStyle.copyWith(
                                          color: backgrondColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.calculate(
                                      weight:
                                          double.parse(weightController.text),
                                      hips: double.parse(hipsController.text),
                                      name: nameController.text,
                                      waist: double.parse(waistController.text),
                                      neck: double.parse(neckController.text),
                                      activity: cubit.dropButtonIndex,
                                      age: int.parse(ageController.text),
                                      height:
                                          double.parse(heightController.text),
                                    );

                                    navigateTo(context, CalculationPage());
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget defaultSizedBox() {
    return SizedBox(
      height: 10,
    );
  }
}
