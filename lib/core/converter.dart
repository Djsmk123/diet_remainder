import 'dart:convert';

mixin Parsers{
  Map<String,dynamic> toJSon(value){
    final encoded = jsonEncode(value);
    final decoded = jsonDecode(encoded);
    return decoded;
  }
}