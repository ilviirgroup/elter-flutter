import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/entity/models.dart';
import 'package:elter/entity/models/verification_code.dart';
import 'package:elter/presenter/bloc.dart';
import 'components/otp_input.dart';
import 'components/title_container.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  final TextEditingController _fieldOne = TextEditingController();

  final TextEditingController _fieldTwo = TextEditingController();

  final TextEditingController _fieldThree = TextEditingController();

  final TextEditingController _fieldFour = TextEditingController();

  final TextEditingController _fieldFive = TextEditingController();

  final TextEditingController _fieldSix = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TitleContainer(
        size: _size,
        title: 'Telefon belgiňize gelen SMS kody ýazyň',
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OtpInput(_fieldOne, true),
          OtpInput(_fieldTwo, false),
          OtpInput(_fieldThree, false),
          OtpInput(_fieldFour, false),
          OtpInput(_fieldFive, false),
          OtpInput(_fieldSix, false),
        ],
      ),
      SizedBox(height: _size.height / 25),
      BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is! PhoneNumberSentSuccess) {
            return SizedBox(
              height: 50,
              width: _size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {},
                child: const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          final VerificationCode _code = state.code;
          return SizedBox(
            height: 50,
            width: _size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _otp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text +
                        _fieldFive.text +
                        _fieldSix.text;
                  },
                );
                if (_otp != null && _otp!.length == 6 && _otp! == _code.code) {
                  context.read<AuthenticationBloc>().add(
                        LoggedIn(_code),
                      );
                  context.read<LoginBloc>().add(LoginCompletedEvent());
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Tassykla'),
            ),
          );
        },
      ),
      const SizedBox(
        height: 30,
      ),
    ]);
  }
}
