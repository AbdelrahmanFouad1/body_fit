import 'package:body_fat/modules/user/user_navigate/user_navigate.dart';
import 'package:body_fat/shared/componants/componants/componants.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_cubit.dart';
import 'package:body_fat/shared/cubit/app_cubit/app_states.dart';
import 'package:body_fat/shared/network/local/cache_helper.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'معرفة احتياجاتك اليوميه من السعرات الحرارية'
          ' هي بداية الطريق للتحكم في الوزن ونسبة الدهون بالجسم',
      'لذلك قمنا بتصميم التطبيق لمساعدتك للوصول للجسم المناسب و نسبة الدهون الصحية'
    ];
    List<String> image = [
      'assets/images/bmi.png',
      'assets/images/bmi2.png',
    ];
    var pageController = PageController();
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                ),
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (pageIndex) {
                      cubit.onBoardingChange(pageIndex);
                    },
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return onBoardingColumn(
                        text: name[index],
                        image: image[index],
                      );
                    },
                    itemCount: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DotsIndicator(
                        decorator: DotsDecorator(
                          color: Colors.white,
                          activeColor: Colors.pink,
                          spacing: EdgeInsets.symmetric(horizontal: 4),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        dotsCount: 2,
                        position: cubit.onBoarding.toDouble(),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (cubit.onBoarding == 1) {
                            await CacheHelper.setData(
                                key: 'onBoarding', value: true);
                            navigateTo(context, UserNavigate());
                          }
                          pageController.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        icon: Icon(
                          CupertinoIcons.forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget onBoardingColumn({required String image, required String text}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              style: arabicStyle.copyWith(
                  fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
