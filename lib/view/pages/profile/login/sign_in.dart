import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/constants/styles.dart';
import 'package:elter/view/pages/profile/login/components/title_container.dart';
import 'package:elter/view/pages/profile/login/enter_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is! PhoneNumberSentSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleContainer(size: _size, title: 'Ulgama girmek'),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    controller: _textEditingController,
                    decoration: kTextFieldDecoration.copyWith(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      hintText: 'Telefon nomeriňizi ýazyň',
                      prefixText: '+993 ',
                    ),
                    style: inputTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<VerificationBloc, VerificationState>(
                    builder: (context, state) {
                      if (state is VerificationCodeLoadedState) {
                        final _codeObject = state.codeObject;
                        return SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_textEditingController.text.isNotEmpty) {
                                context.read<LoginBloc>().add(
                                      PhoneNumberSentEvent(_codeObject
                                        ..phoneNumber =
                                            _textEditingController.text),
                                    );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const EnterPin(),
                                //   ),
                                // );
                              }
                            },
                            child: const Text('Ugrat'),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  )
                ],
              ),
            );
          }
          return const EnterPin();
        },
      ),
    );
  }
}
