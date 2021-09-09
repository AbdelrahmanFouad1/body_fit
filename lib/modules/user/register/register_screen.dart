import 'package:body_fat/modules/home/home_screen.dart';
import 'package:body_fat/shared/componants/componants/componants.dart';
import 'package:body_fat/shared/cubit/user_cubit/user_cubit.dart';
import 'package:body_fat/shared/cubit/user_cubit/user_states.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegisterScreen extends StatelessWidget {
  final bool register;
  RegisterScreen({required this.register});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (BuildContext context, state) {
          if (state is UserRegisterErrorState) {
            Fluttertoast.showToast(
                msg: state.onError,
                backgroundColor: Colors.red,
                gravity: ToastGravity.CENTER,
                toastLength: Toast.LENGTH_LONG);
          }
          if (state is UserLoginErrorState) {
            Fluttertoast.showToast(
                msg: state.onError,
                backgroundColor: Colors.red,
                gravity: ToastGravity.CENTER,
                toastLength: Toast.LENGTH_LONG);
          }
          if (state is UserRegisterSuccessState || state is UserLoginSuccessState) {
            navigateToAndRemove(context, MyHome());
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = UserCubit.get(context);

          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkColor,
                    darkColor,
                    Colors.pinkAccent,
                    Colors.amber,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    register
                        ? Column(
                            children: [
                              Text(
                                'REGISTER',
                                style: englishStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'إنشاء حساب جديد',
                                style: arabicStyle,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: englishStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'تسجيل الدخول',
                                style: arabicStyle,
                              ),
                            ],
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          defaultTextFormField(
                            perfixIcon: Icon(
                              CupertinoIcons.mail,
                              color: Colors.white,
                            ),
                            hint: 'MAIL - البريد',
                            inputType: TextInputType.emailAddress,
                            textEditingController: emailController,
                          ),
                          SizedBox(height: 20),
                          defaultTextFormField(
                            perfixIcon: Icon(
                              CupertinoIcons.lock,
                              color: Colors.white,
                            ),
                            hint: 'PASSWORD - كلمة المرور',
                            inputType: TextInputType.visiblePassword,
                            textEditingController: passwordController,
                            isPassword: !cubit.showPassword,
                            suffixIcon: IconButton(
                              icon: cubit.showPassword
                                  ? Icon(
                                      CupertinoIcons.eye,
                                      color: darkColor,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye_slash,
                                      color: Colors.white,
                                    ),
                              onPressed: () {
                                cubit.passWordState();
                              },
                            ),
                          ),
                          SizedBox(height: 40),
                          CupertinoButton(
                            color: darkColor,
                            child: register
                                ? Column(
                                    children: [
                                      Text(
                                        'REGISTER',
                                        style: englishStyle.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        'إنشاء حساب جديد',
                                        style: arabicStyle,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        'LOGIN',
                                        style:
                                            englishStyle.copyWith(fontSize: 20),
                                      ),
                                      Text(
                                        'تسجيل الدخول',
                                        style: arabicStyle,
                                      ),
                                    ],
                                  ),
                            onPressed: () {
                              register
                                  ? cubit.register(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  : cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
