import 'package:body_fat/modules/results/results_screen.dart';
import 'package:body_fat/shared/componants/componants/componants.dart';
import 'package:body_fat/shared/componants/constants/constants.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_cubit.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_states.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'calculation_methods.dart';

class CalculationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  Text(
                    'Results - النتائج',
                    style: arabicStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: state is AppCalculateLoadingState
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            childAspectRatio: 0.8,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: List.generate(cardModel.length, (index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  navigateTo(
                                      context,
                                      ResultsScreen(
                                        cardModel[index].describe,
                                        cardModel[index].name,
                                        cardModel[index].svgImage,
                                        cardModel[index].unit,
                                        cardModel[index].unitAr,
                                        index,
                                      ));
                                },
                                child: defaultContainter(
                                  result: results[index],
                                  svgImage: cardModel[index].svgImage,
                                  name: cardModel[index].name,
                                  unit: cardModel[index].unit,
                                  unitAr: cardModel[index].unitAr,
                                  describe: cardModel[index].describe,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

Widget defaultContainter({
  required String svgImage,
  required String name,
  required String unit,
  required String unitAr,
  required String describe,
  required double result,
}) {
  return Container(
    padding: EdgeInsets.all(6.0),
    decoration: BoxDecoration(
        color: darkColor, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          name,
          style:
              arabicStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SvgPicture.asset(
          svgImage,
          height: 60,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Text(result.toStringAsFixed(1),
                style: arabicStyle.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            Text(
              unit,
              style: arabicStyle.copyWith(color: Colors.white70, fontSize: 12),
            ),
            Text(
              unitAr,
              style: arabicStyle.copyWith(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              describe,
              style: arabicStyle.copyWith(color: Colors.amber, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );
}
