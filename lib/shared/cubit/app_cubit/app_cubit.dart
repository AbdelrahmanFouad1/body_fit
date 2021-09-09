import 'package:body_fat/models/user_model/user_model.dart';
import 'package:body_fat/modules/calculation/calculation_methods.dart';
import 'package:body_fat/shared/componants/constants/constants.dart';
import 'package:body_fat/shared/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int onBoarding = 0;

  void onBoardingChange(int index) {
    onBoarding = index;
    emit(AppOnBoardingState());
  }

  bool male = true;

  late BoxDecoration decoration;
  void userType() {
    male = !male;

    emit(AppUserTypeState());
  }

  Future<void> userData() async {
    emit(AppUserDataLoadingState());
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      emit(AppUserDataSuccessState());
    }).catchError((onError) {
      emit(AppUserDataErrorState(onError.toString()));
    });
  }

  late String dropValue = arabicActivity[0];
  int dropButtonIndex = 0;
  void dropDownValue(String value, int index) {
    dropValue = value;
    dropButtonIndex = index;
    emit(AppUserDropDownState());
  }

  Future<void> calculate({
    required String name,
    required int age,
    required int activity,
    required double hips,
    required double waist,
    required double neck,
    required double weight,
    required double height,
  }) async {
    emit(AppCalculateLoadingState());
    results = [];
    userModel = UserModel(
        height: height,
        name: name,
        uId: loginModel.uId ?? '',
        email: loginModel.email ?? '',
        activityIndex: activity,
        age: age,
        hips: hips,
        neck: neck,
        waist: waist,
        weight: weight,
        male: male);
    results.add(bmiCalc(userModel.height, userModel.weight));
    results.add(
      bfCalc(
        userModel.waist,
        userModel.neck,
        userModel.height,
        userModel.male,
        userModel.hips,
      ),
    );
    results.add(
      bmrCalc(
        userModel.weight,
        bfResult,
      ),
    );
    results.add(
      whrCalc(
        userModel.height,
        userModel.waist,
      ),
    );

    results.add(
      tdeeCalc(
        bmrCalc(userModel.weight, bfResult),
        dropButtonIndex,
      ),
    );
    results.add(100);
    await CacheHelper.setData(key: 'name', value: name);
    await CacheHelper.setData(key: 'male', value: male);
    await CacheHelper.setData(key: 'age', value: age);
    await CacheHelper.setData(key: 'activity', value: activity);
    await CacheHelper.setData(key: 'hips', value: hips);
    await CacheHelper.setData(key: 'waist', value: waist);
    await CacheHelper.setData(key: 'neck', value: neck);
    await CacheHelper.setData(key: 'weight', value: weight);
    await CacheHelper.setData(key: 'height', value: height);
    await CacheHelper.setData(key: 'gotData', value: true);
    if (loginModel.uId != null) {
      await userData();
    }
    emit(AppCalculateSuccessState());
  }

  bool arabic = true;
  late List<String> language = arabicList;
  late List<String> activity = arabicActivity;
  void languageChange() {
    arabic = !arabic;
    arabic ? language = arabicList : language = englishList;
    arabic ? activity = arabicActivity : activity = englishActivity;
    emit(AppUserLanguageState());
  }
}
