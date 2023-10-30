import 'package:encode_decode/core/logic/custom_crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'encryptor_state.dart';

class EncryptorCubit extends Cubit<EncryptorState> {
  EncryptorCubit() : super(EncryptorInitial());
  late TextEditingController encodeTextController = TextEditingController();
  late TextEditingController decodeTextController = TextEditingController();
  late TextEditingController decodeKeyTextController = TextEditingController();
  late TextEditingController encodeKeyTextController = TextEditingController();
  void encrypt() {
    if (encodeTextController.text.isNotEmpty &&
        encodeKeyTextController.text.isNotEmpty) {
      String encodedText = CustomCrypto.encode(
        text: encodeTextController.text,
        key: int.tryParse(encodeKeyTextController.text),
      );
      emit(EncryptSuccess(text: encodedText));
    }
  }
  void decrypt() {
    if (decodeTextController.text.isNotEmpty &&
        decodeKeyTextController.text.isNotEmpty) {
        String decodedText = CustomCrypto.decode(
          encodedText: decodeTextController.text,
          key: int.tryParse(decodeKeyTextController.text),
        );
      emit(DecryptSuccess(text: decodedText));
    }
  }
  void reset(){
    encodeTextController.clear();
    decodeTextController.clear();
    decodeKeyTextController.clear();
    encodeKeyTextController.clear();
    emit(EncryptorInitial());
  }
}
