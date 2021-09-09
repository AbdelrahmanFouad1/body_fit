import 'package:body_fat/modules/home/home_screen.dart';
import 'package:body_fat/modules/user/register/register_screen.dart';
import 'package:body_fat/shared/componants/componants/componants.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: backgrondColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/marathon.png',
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Stay Fit Stay Healthy \n حافظ علي صحتك خليك رياضي',
                    style: arabicStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: userButton(
                              onPressed: () {
                               navigateTo(context, RegisterScreen(register: false,));
                              },
                              title: 'Login',
                              arTitle: 'تسجيل دخول')),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: userButton(
                              onPressed: () {

                                navigateTo(context,RegisterScreen(register: true,) );
                              },
                              title: 'Register',
                              arTitle: 'إنشاء حساب')),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.black,
            onTap: () {
              navigateToAndRemove(context, MyHome());
            },
            child: Container(
              margin: EdgeInsets.only( top: 30),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SKIP',
                    style: englishStyle.copyWith(color: Colors.yellow,fontSize: 16,fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: 5,),
                  Icon(
                    Icons.cancel,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
