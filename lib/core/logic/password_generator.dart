import 'dart:math';

class PasswordGenerator {
  static String generate(int passLength) {
    String symbols = r"ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*_=+-/€.?<>)abcdefghijklmnopqrstuvwxyz0123456789";
    String password = "";
    Random random = Random();
    for (int i = 0; i < passLength; i++) {
      password += symbols[random.nextInt(symbols.length)];
    }
    return password;
  }
}
