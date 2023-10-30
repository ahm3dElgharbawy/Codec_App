import 'package:encode_decode/features/encryptor/presentation/widgets/decode_section.dart';
import 'package:encode_decode/features/encryptor/presentation/widgets/encode_section.dart';
import 'package:flutter/material.dart';

class EncryptorView extends StatelessWidget {
  const EncryptorView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: const [
            EncodeSection(),
            SizedBox(height: 20),
            DecodeSection()
          ]),
        ),
      ),
    );
  }


}
