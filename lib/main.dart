import 'package:encode_decode/features/encryptor/cubit/encryptor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/views/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: "Nunito"),
      home: BlocProvider(
        create: (context) => EncryptorCubit(),
        child: const HomePageView(),
      ),
    );
  }
}
