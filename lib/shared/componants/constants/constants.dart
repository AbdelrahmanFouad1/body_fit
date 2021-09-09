

import 'package:body_fat/models/card_model/card_model.dart';
import 'package:body_fat/models/user_model/user_model.dart';

late bool gender ;
List<CardModel> cardModel = [
  CardModel(
    svgImage: 'assets/icons/bmi.svg',
    name: 'كتلة الجسم \n BMI',
    unit: 'kg/m',
    unitAr: 'كجم/متر',
    describe: 'Body mass index',
  ),
  CardModel(
    svgImage: 'assets/icons/six-pack.svg',
    name: ' نسبة الدهون في الجسم \n BFP',
    unit: '% Percent',
    unitAr: '% نسبة مئوية',
    describe: 'Body fat percentage',
  ),
  CardModel(
    svgImage: 'assets/icons/cardiogram.svg',
    name: 'معدل الأيض الأساسي \n BMR',
    unit: 'Calories/Day',
    unitAr: 'سعر حراري/ يوم',
    describe: 'Basal metabolic rate',
  ),
  CardModel(
    svgImage: 'assets/icons/slim.svg',
    name: ' محيط الخصر للطول \n WHR',
    unit: 'Ratio',
    unitAr: 'نسبة',
    describe: 'Waist to height ratio',
  ),
  CardModel(
    svgImage: 'assets/icons/treadmill-machine.svg',
    name: ' الإحتياج اليومي من السعرات \n TDEE',
    unit: 'Calories / Day',
    unitAr: 'سعر حراري/ يوم',
    describe: 'Total daily energy expenditure',
  ),
  CardModel(
    svgImage: 'assets/icons/lighting.svg',
    name: 'شكراً لاستخدامك التطبيق',
    unit: 'جاري اضافة المزيد',
    unitAr: '',
    describe: 'Thanks for using our App',
  ),
];

List<String> arabicActivity = [
  ' لا تمرين',
  'مجهود بسيط',
  'مجهود متوسط',
  'مجهود عالي',
  'كل يوم + وظيفة شاقة'
];
List<String> englishActivity = [
  'Sedentary',
  'Lightly Activeً',
  'Moderately Active',
  'Very Activeً',
  'Extremely Active'
];
bool? gotData;
bool? gotUser;
 LoginModel loginModel = LoginModel(uId: null, email: null);
late UserModel userModel;

List<String> arabicList = [
  'ذكر',
  'أنثى',
  'الإسم',
  'السن',
  'الطول',
  'الوزن',
  'الوسط',
  'الرقبه',
  'المؤخره',
  'النشاط',
];
List<String> englishList = [
  'Male',
  'Female',
  'Name',
  'Age',
  'Height',
  'Weight',
  'Waist',
  'Neck',
  'Hips',
  'Activity',
];
