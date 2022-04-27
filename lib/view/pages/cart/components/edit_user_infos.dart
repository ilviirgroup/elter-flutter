part of 'package:elter/view/pages/cart/cart_screen.dart';

class EditUserInfos extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final User? user;

  final TextEditingController? nameController;

  final TextEditingController? phoneController;

  final TextEditingController? addressController;

  final TextEditingController? noteController;

  const EditUserInfos({
    Key? key,
    this.user,
    required this.formKey,
    this.nameController,
    this.phoneController,
    this.addressController,
    this.noteController,
  }) : super(key: key);

  @override
  State<EditUserInfos> createState() => _EditUserInfosState();
}

class _EditUserInfosState extends State<EditUserInfos> {
  late TextEditingController _nameController;

  late TextEditingController _phoneController;

  late TextEditingController _addressController;

  late TextEditingController _noteController;

  @override
  void initState() {
    _nameController = widget.nameController!;
    _phoneController = widget.phoneController!;
    _addressController = widget.addressController!;
    _noteController = widget.noteController!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ulanyjy maglumatlary:',
              style: boldTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputField(_nameController, 'Adyňyz'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Telefon belgi ýazylmaly';
                      }
                      if (text.length > 1 && text.length < 8) {
                        return '8 sandan ybarat bolmaly';
                      }
                      return null;
                    },
                    maxLength: 8,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kPrimaryColor),
                      ),
                      counterText: '',
                      hintText: 'Telefon belgi',
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                        child: Text(
                          '+993',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  inputField(_addressController, 'Adres'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'BELLIK:',
                    style: semiBoldTextStyle,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                      controller: _noteController,
                      maxLines: 5,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField inputField(
    TextEditingController _controller,
    String hintText,
  ) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return '$hintText ýazylmaly';
        }
        return null;
      },
      controller: _controller,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        hintText: '$hintText...',
      ),
    );
  }

  Positioned bottomsheetCloseIcon(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          size: 28,
        ),
      ),
    );
  }

  SizedBox orderButton(Size _size, BuildContext context) {
    return SizedBox(
      height: 50,
      width: _size.width,
      child: ElevatedButton(
        onPressed: () {
          if (widget.formKey.currentState!.validate() &&
              widget.user!.phoneNumber ==
                  modifyPhoneNumber(_phoneController.text)) {
            context.read<AuthenticationBloc>().add(
                  UserInfosUpdated(
                    User(
                        phoneNumber: widget.user!.phoneNumber,
                        name: _nameController.text,
                        address: _addressController.text),
                  ),
                );
          }
        },
        child: const Text('Sargyt et'),
      ),
    );
  }
}
