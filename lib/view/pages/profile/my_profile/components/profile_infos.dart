part of 'package:elter/view/pages/profile/my_profile/my_profile.dart';

class ProfileInfos extends StatefulWidget {
  const ProfileInfos({Key? key}) : super(key: key);

  @override
  State<ProfileInfos> createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<ProfileInfos> {
  @override
  Widget build(BuildContext context) {
    const _style = TextStyle(
      fontSize: 16,
    );
    const icons = [
      Icon(Icons.account_box),
      Icon(Icons.phone),
      Icon(Icons.home_rounded),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: kTransparent,
            child: const Icon(Icons.close),
          ),
        ),
        backgroundColor: kTransparent,
        title: const Text('Agzalyk maglumatlar'),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          var user = (state as Authenticated).user;
          List<String> userInfos = [
            user.name ?? 'Näbelli',
            user.phoneNumber,
            user.address ?? 'Näbelli'
          ];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: ListTile.divideTiles(
                  context: context,
                  color: textGreyColor,
                  tiles: userInfos.map(
                    (e) => ListTile(
                      leading: icons[userInfos.indexOf(e)],
                      title: Text(
                        e,
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
