import 'dart:async';

import 'package:elter/presenter/bloc.dart';
import 'package:elter/router/app_routes.dart';
import 'package:elter/view/pages/main_screen/main_screen.dart';
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
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen())),
    );

    Timer(const Duration(seconds: 5), () {
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
                        // image: DecorationImage(
                        //   fit: BoxFit.contain,
                        //   image: AssetImage('images/logo.png'),
                        // ),
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
