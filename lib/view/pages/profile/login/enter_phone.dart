part of 'login.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _textEditingController = TextEditingController();

  bool validPhoneNumber = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                                if (_textEditingController.text.length == 8) {
                                  context.read<LoginBloc>().add(
                                        PhoneNumberSentEvent(_codeObject
                                          ..phoneNumber =
                                              '+993${_textEditingController.text}'),
                                      );
                                  setState(() {
                                    validPhoneNumber = true;
                                  });
                                } else {
                                  myDialog(context);
                                }
                              },
                              child: validPhoneNumber
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: kWhite,
                                      ),
                                    )
                                  : const Text('Ugrat'),
                            ));
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

  void myDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Üns beriň!'),
              content: Text('Telefon belgi, 8 sandan ybarat bolmaly'),
            ));
  }
}
