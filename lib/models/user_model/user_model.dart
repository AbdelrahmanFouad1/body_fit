class UserModel {
  String uId;
  late bool male;
  String email;
  String name;
  late int age;
  late int activityIndex;
  late double height;
  late double weight;
  late double waist;
  late double neck;
  late double hips;
  UserModel({
    required this.name,
    required this.height,
    required this.uId,
    required this.email,
    required this.activityIndex,
    required this.age,
    required this.hips,
    required this.neck,
    required this.waist,
    required this.weight,
    required this.male,
  });

  Map <String,dynamic> toJson(){
    return
    {
      'name':name,
      'height':height,
      'uId':uId,
      'email':email,
      'activity':activityIndex,
      'age':age,
      'hips':hips,
      'neck':neck,
      'waist':waist,
      'weight':weight,
      'male':male,

  };

  }

}






class LoginModel {
   String? uId;
   String? email;

  LoginModel({
    required this.uId,
    required this.email,

  });
}
