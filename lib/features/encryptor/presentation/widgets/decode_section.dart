import 'package:encode_decode/core/widgets/custom_input_field.dart';
import 'package:encode_decode/features/encryptor/cubit/encryptor_cubit.dart';
import 'package:encode_decode/features/encryptor/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecodeSection extends StatelessWidget {
  const DecodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EncryptorCubit, EncryptorState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomInputField(
              textEditingController:
                  BlocProvider.of<EncryptorCubit>(context).decodeTextController,
              hint: "Enter text to decode",
            ),
            const SizedBox(height: 10),
            CustomInputField(
                textEditingController: BlocProvider.of<EncryptorCubit>(context)
                    .decodeKeyTextController,
                hint: "Enter decode key",
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            CustomButton(
              title: "Decrypt",
              backgroundColor: Colors.black,
              onPressed: () {
                BlocProvider.of<EncryptorCubit>(context).decrypt();
              },
            ),
            const SizedBox(height: 20),
            if (state is DecryptSuccess)
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: state.text));
                },
                child: Text(
                  state.text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        );
      },
    );
  }
}
