import 'package:encode_decode/core/widgets/custom_input_field.dart';
import 'package:encode_decode/core/widgets/custom_text_button.dart';
import 'package:encode_decode/features/encryptor/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/encryptor_cubit.dart';

class EncodeSection extends StatelessWidget {
  const EncodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EncryptorCubit, EncryptorState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomInputField(
              textEditingController:
                  BlocProvider.of<EncryptorCubit>(context).encodeTextController,
              hint: "Enter any Text",
            ),
            const SizedBox(height: 10),
            CustomInputField(
                textEditingController: BlocProvider.of<EncryptorCubit>(context)
                    .encodeKeyTextController,
                hint: "Enter encode key",
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            CustomButton(
              title: "Encrypt",
              backgroundColor: Colors.red,
              onPressed: () {
                BlocProvider.of<EncryptorCubit>(context).encrypt();
              },
            ),
            const SizedBox(height: 20),
            if (state is EncryptSuccess)
              CustomTextButton(
                text: state.text,
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: state.text),
                  );
                },
              )
          ],
        );
      },
    );
  }
}
