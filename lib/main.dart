import 'package:body_fat/models/user_model/user_model.dart';
import 'package:body_fat/modules/home/home_screen.dart';
import 'package:body_fat/modules/onboarding/onboarding_screen.dart';
import 'package:body_fat/shared/componants/constants/constants.dart';
import 'package:body_fat/shared/cubit/bloc_observer/bloc_observer.dart';
import 'package:body_fat/shared/network/local/cache_helper.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/user/user_navigate/user_navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
  gotData = await CacheHelper.getData(key: 'gotData');
  gotUser = await CacheHelper.getData(key: 'gotUser');
  if (gotUser == true) {
    loginModel = LoginModel(
      uId: await CacheHelper.getData(key: 'uId'),
      email: await CacheHelper.getData(key: 'email'),
    );
  }
  if (gotData == true) {
    userModel = UserModel(
        name: await CacheHelper.getData(key: 'name'),
        height: await CacheHelper.getData(key: 'height'),
        uId: loginModel.uId ?? '',
        email: loginModel.email ?? '',
        activityIndex: await CacheHelper.getData(key: 'activity'),
        age: await CacheHelper.getData(key: 'age'),
        hips: await CacheHelper.getData(key: 'hips'),
        neck: await CacheHelper.getData(key: 'neck'),
        waist: await CacheHelper.getData(key: 'waist'),
        weight: await CacheHelper.getData(key: 'weight'),
        male: await CacheHelper.getData(key: 'male'));
  }

  Widget initialWidget() {
    if (onBoarding == null) return OnBoardingScreen();
    if (loginModel.uId == null) return UserNavigate();
    return MyHome();
  }

  runApp(MyApp(initialWidget()));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;
  MyApp(this.initialWidget);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialWidget,
      theme: ThemeData(
        scaffoldBackgroundColor: backgrondColor,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: backgrondColor,
          elevation: 0,
          backwardsCompatibility: false,
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
