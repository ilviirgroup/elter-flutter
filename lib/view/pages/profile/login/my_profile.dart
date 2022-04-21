import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elter/presenter/bloc.dart';

class MyProfile extends StatelessWidget {
  final String phoneNumber;
  const MyProfile({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    const _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: const Text('Profilim'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: (Column(
              children: profileElements
                  .map(
                    (e) => Column(
                      children: [
                        ListTile(
                          iconColor: kBlack,
                          // dense: true,
                          leading: e['icon'],
                          title: Text(
                            e['title'],
                            style: _textStyle,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                          ),
                        ),
                        profileElements.indexOf(e) !=
                                profileElements.indexOf(profileElements.last)
                            ? Divider(
                                indent: _size.width * 0.15,
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                  .toList(),
            )),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            height: 50,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all(kWhite),
                    foregroundColor: MaterialStateProperty.all(kBlack),
                    textStyle: MaterialStateProperty.all(_textStyle),
                  ),
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      LoggedOut(phoneNumber),
                    );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Ulgamdan çyk'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List profileElements = [
  {
    'icon': const Icon(Icons.delivery_dining),
    'title': 'Sargytlarym',
  },
  {
    'icon': const Icon(Icons.person),
    'title': 'Agzalyk maglumatlarym',
  },
  {
    'icon': const Icon(Icons.info_outline),
    'title': 'Komek',
  },
];
