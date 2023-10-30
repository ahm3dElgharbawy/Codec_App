import 'package:encode_decode/features/encryptor/cubit/encryptor_cubit.dart';
import 'package:encode_decode/features/encryptor/presentation/views/encryptor_view.dart';
import 'package:encode_decode/features/home/presentation/widgets/build_custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SafeArea(
        child: BuildCustomDrawer()
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text("Codec"),
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
              BlocProvider.of<EncryptorCubit>(context).reset();
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: EncryptorView(),
    );
  }
}