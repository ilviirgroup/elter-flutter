import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elter/presenter/bloc.dart';

class MyProfile extends StatelessWidget {
  final String phoneNumber;
  const MyProfile({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profilim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('My Profile'),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(
                        LoggedOut(phoneNumber),
                      );
                },
                child: const Text('Ulgamdan çyk'))
          ],
        ),
      ),
    );
  }
}
