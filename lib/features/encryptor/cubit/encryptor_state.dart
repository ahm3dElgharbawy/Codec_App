part of 'encryptor_cubit.dart';

class EncryptorState {}

class EncryptorInitial extends EncryptorState {}
class EncryptSuccess extends EncryptorState {
  final String text;
  EncryptSuccess({required this.text});
}
class EncryptFailure extends EncryptorState {}
class DecryptSuccess extends EncryptorState {
    final String text;
  DecryptSuccess({required this.text});
}
class DecryptFailure extends EncryptorState {}

