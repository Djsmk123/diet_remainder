mixin ValidationMixin{
  bool isEmail(String email)=>RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email);
  bool isFieldEmpty(String field)=>field.isEmpty;
  bool validatePassword(String password)=>password.length>=6;
  bool isValidWeight(String weight)=>RegExp(r"^\d+").hasMatch(weight) && double.parse(weight)>=30 && double.parse(weight)<=200;
  bool isValidHeight(String height)=>RegExp(r"^\d+").hasMatch(height) && double.parse(height)>=100 && double.parse(height)<=250;
  bool isValidAge(String age)=>RegExp(r"^\d+").hasMatch(age) && int.parse(age)>=10 && int.parse(age)<=100;
  bool isValidName(String name)=>RegExp(r"^[a-zA-Z]+").hasMatch(name);
  bool isValidTargetWeight(String targetWeight,String weight)=>double.parse(targetWeight)<=200 && (double.parse(targetWeight)<double.parse(weight)||double.parse(targetWeight)>double.parse(weight));
}