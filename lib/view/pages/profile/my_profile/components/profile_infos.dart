part of 'package:elter/view/pages/profile/my_profile/my_profile.dart';

class ProfileInfos extends StatefulWidget {
  const ProfileInfos({Key? key}) : super(key: key);

  @override
  State<ProfileInfos> createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<ProfileInfos> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: _size.height,
        width: _size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text('Maglumatlarym')],
        ),
      ),
    );
  }
}
