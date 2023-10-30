import 'dart:math';

import 'core/logic/password_generator.dart';


void main(){

  String gen = PasswordGenerator.generate(20);
  print(gen);
}