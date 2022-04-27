import '../../../utils/constants/constants.dart';
import 'brands/brands_grid_view.dart';
import 'vendors/vendors_grid_view.dart';
import 'package:flutter/material.dart';

class VendorPage extends StatelessWidget {
  const VendorPage({Key? key}) : super(key: key);

  final List<Map<String, Widget>> _tabItems = const [
    {
      'tab': Tab(text: 'Dükanlar'),
      'tabBarView': VendorsGridView(),
    },
    {
      'tab': Tab(text: 'Markalar'),
      'tabBarView': BrandsGridView(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabItems.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: SizedBox(
              height: 60,
              child: TabBar(
                labelColor: kBlack,
                indicatorColor: kPrimaryColor,
                tabs: _tabItems.map((e) => e['tab'] as Tab).toList(),
              ),
            ),
          ),
          body: TabBarView(
            children: _tabItems.map((e) => e['tabBarView'] as Widget).toList(),
          ),
        ),
      ),
    );
  }
}
