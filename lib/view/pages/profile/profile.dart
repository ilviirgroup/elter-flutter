import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit/on_sign_in_page/on_sign_in_page_cubit.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/pages/profile/login/components/title_container.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/my_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: (state is Authenticated)
              ? MyProfile(
                  phoneNumber: state.user.phoneNumber,
                )
              : (state is Unauthenticated)
                  ? BlocBuilder<OnSignInPageCubit, OnSignInPageState>(
                      builder: (context, state) {
                        if (state is OnSignInPageLoaded) {
                          final toSignInPage = state.signInPage;
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TitleContainer(
                                    size: _size,
                                    title: 'Entek ulgama girmediňiz'),
                                SizedBox(
                                  height: 50,
                                  width: _size.width * 0.9,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      toSignInPage();
                                    },
                                    child: const Text('Ulgama gir'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    )
                  : const LoadingIndicator(),
        );
      },
    );
  }
}