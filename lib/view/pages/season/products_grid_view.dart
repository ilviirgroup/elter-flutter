import 'package:elter/entity/models.dart';
import 'package:elter/presenter/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdsProductGridView extends StatefulWidget {
  final String adsUrl;
  const AdsProductGridView({Key? key, required this.adsUrl}) : super(key: key);

  @override
  State<AdsProductGridView> createState() => _AdsProductGridViewState();
}

class _AdsProductGridViewState extends State<AdsProductGridView> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: dataProvider.adsProducts(widget.adsUrl),
        builder: (BuildContext ctx, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final custProd = snapshot.data![index];
                return Column(children: [
                  Text(custProd.vendorName),
                  Text(custProd.location),
                  Text(custProd.name),
                ]);
              });
        },
      ),
    ));
  }
}
