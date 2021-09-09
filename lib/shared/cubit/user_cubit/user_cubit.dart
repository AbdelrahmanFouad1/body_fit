import 'package:body_fat/models/user_model/user_model.dart';
import 'package:body_fat/shared/componants/constants/constants.dart';
import 'package:body_fat/shared/cubit/user_cubit/user_states.dart';
import 'package:body_fat/shared/network/local/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  bool showPassword = false;
  void passWordState() {
    showPassword = !showPassword;
    emit(UserShowPasswordState());
  }

  void register({required String email, required String password}) async {
    emit(UserRegisterLoadingState());
    // FirebaseAuth.instance.verifyPhoneNumber(
    //     phoneNumber: '+44 7123 123 456',
    //     verificationCompleted: (PhoneAuthCredential credential) {},
    //     verificationFailed: (FirebaseAuthException e) {},
    //     codeSent: (String verificationId, int? resendToken) {},
    //     codeAutoRetrievalTimeout: (String verificationId) {},);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      loginModel = LoginModel(uId: value.user!.uid, email: email);
      await CacheHelper.setData(key: 'uId', value: value.user!.uid);
      await CacheHelper.setData(key: 'email', value: value.user!.email);
      await CacheHelper.setData(key: 'gotUser', value: true);
      emit(UserRegisterSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(UserRegisterErrorState(onError.toString()));
    });
  }

  void login({required String email, required String password}) async {
    emit(UserLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      emit(UserLoginSuccessState());
      loginModel = LoginModel(uId: value.user!.uid, email: email);
      await CacheHelper.setData(key: 'uId', value: value.user!.uid);
      await CacheHelper.setData(key: 'email', value: value.user!.email);
      await CacheHelper.setData(key: 'gotUser', value: true);
    }).catchError((onError) {
      print(onError.toString());
      emit(UserLoginErrorState(onError.toString()));
    });
  }
}
