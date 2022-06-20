import 'dart:async';

import 'package:elter/utils/constants/app_assets.dart';
import 'package:elter/utils/constants/app_colors.dart';

import '../../presenter/bloc.dart';
import 'main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen())),
    );

    Timer(const Duration(seconds: 3), () {
      context.read<CartBloc>().add(CartLoadedEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AppAssets.colorfullCircles),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                  );
                },
              ),
              const Text('W E L C O M E')
              // const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
