import 'package:encode_decode/core/logic/password_generator.dart';
import 'package:encode_decode/core/widgets/custom_input_field.dart';
import 'package:encode_decode/core/widgets/custom_text_button.dart';
import 'package:encode_decode/features/encryptor/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordGeneratorView extends StatefulWidget {
  const PasswordGeneratorView({super.key});

  @override
  State<PasswordGeneratorView> createState() => _PasswordGeneratorViewState();
}

class _PasswordGeneratorViewState extends State<PasswordGeneratorView> {
  String password = "";
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Gen"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          CustomInputField(
            textEditingController: controller,
            hint: "password length",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                try {
                  password =
                      PasswordGenerator.generate(int.parse(controller.text));
                } catch (e) {
                  password = "not valid length";
                }
                setState(() {});
              }
            },
            title: "Generate",
            backgroundColor: Colors.blue,
          ),
          const SizedBox(height: 20),
          if (password != "")
            CustomTextButton(
              text: password,
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: password),
                );
              },
            )
        ]),
      ),
    );
  }
}
