import 'dart:async';

import 'package:elter/utils/constants/app_assets.dart';
import 'package:elter/utils/constants/app_colors.dart';

import '../../presenter/bloc.dart';
import '../../presenter/cubit.dart';
import 'main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  StreamSubscription? subs;
  int totalBall = 5;
  int position = 0;

  @override
  void initState() {
    subs = Stream.periodic(const Duration(milliseconds: 300))
        .listen(changePosition);
    context.read<VisitedCubit>().getVisited();
    Timer(const Duration(seconds: 3), () {
      context.read<CartBloc>().add(CartLoadedEvent());
    });
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    subs!.cancel();
    super.dispose();
  }

  void changePosition(_) {
    if (position >= totalBall) {
      position = -1;
    }
    position++;
    setState(() {});
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
                  return SizedBox(
                    width: 200,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        totalBall,
                        (index) {
                          bool current = index == position;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: current ? 30 : 10,
                            width: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kPrimaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                  // Container(
                  //   padding: const EdgeInsets.all(0),
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       fit: BoxFit.contain,
                  //       image: AssetImage(AppAssets.colorfullCircles),
                  //     ),
                  //   ),
                  //   height: MediaQuery.of(context).size.height / 2,
                  // );
                },
              ),
              const Text(
                'WELCOME',
                style: TextStyle(letterSpacing: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
