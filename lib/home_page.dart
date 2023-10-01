import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/custom_crypto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController encodeTextController;
  late TextEditingController decodeTextController;
  late TextEditingController decodeKeyTextController;
  late TextEditingController encodeKeyTextController;
  String encodedText = "";
  String decodedText = "";
  @override
  void initState() {
    encodeTextController = TextEditingController();
    decodeTextController = TextEditingController();
    encodeKeyTextController = TextEditingController();
    decodeKeyTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Crypto"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            color: Colors.black,
            splashRadius: 18,
            onPressed: () {
              encodeTextController.clear();
              decodeTextController.clear();
              decodeKeyTextController.clear();
              encodeKeyTextController.clear();
              encodedText = "";
              decodedText = "";
              setState(() {});
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              customInput(
                textEditingController: encodeTextController,
                hint: "Enter any Text",
              ),
              const SizedBox(height: 10),
              customInput(
                textEditingController: encodeKeyTextController,
                hint: "Enter encode key",
                keyboardType: TextInputType.number
              ),
              const SizedBox(height: 20),
              customButton(
                title: "Encrypt",
                backgroundColor: Colors.red,
                onPressed: () {
                  if (encodeTextController.text.isNotEmpty &&
                      encodeKeyTextController.text.isNotEmpty) {
                    setState(() {
                      encodedText = CustomCrypto.encode(
                        text: encodeTextController.text,
                        key: int.tryParse(encodeKeyTextController.text),
                      );
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: encodedText));
                },
                child: Text(encodedText),
              ),
              const SizedBox(height: 20),
              customInput(
                textEditingController: decodeTextController,
                hint: "Enter text to decode",
              ),
              const SizedBox(height: 10),
              customInput(
                textEditingController: decodeKeyTextController,
                hint: "Enter decode key",
                keyboardType: TextInputType.number
              ),
              const SizedBox(height: 20),
              customButton(
                title: "Decrypt",
                backgroundColor: Colors.black,
                onPressed: () {
                  if (decodeTextController.text.isNotEmpty && decodeKeyTextController.text.isNotEmpty) {
                    setState(() {
                      decodedText = CustomCrypto.decode(
                        encodedText: decodeTextController.text,
                        key: int.tryParse(decodeKeyTextController.text),
                      );
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: decodedText));
                },
                child: Text(decodedText),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget customInput(
      {required TextEditingController textEditingController,
      required String hint,TextInputType? keyboardType}) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

  OutlinedButton customButton(
      {required String title,
      required void Function()? onPressed,
      required Color backgroundColor}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(title),
    );
  }
}
