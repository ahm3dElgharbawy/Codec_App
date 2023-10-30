import 'package:encode_decode/core/logic/password_generator.dart';
import 'package:encode_decode/features/encryptor/presentation/views/encryptor_view.dart';
import 'package:encode_decode/features/password_generator/presentation/views/password_generator_view.dart';
import 'package:flutter/material.dart';

class BuildCustomDrawer extends StatelessWidget {
  const BuildCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 20),
          ListTile(
            visualDensity: VisualDensity.compact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordGeneratorView(),
                ),
              );
            },
            leading: const Icon(Icons.arrow_right_rounded),
            title: const Align(
              alignment: Alignment(-1.5, 0),
              child: Text("Password Generator"),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          )
        ]),
      ),
    );
  }
}
