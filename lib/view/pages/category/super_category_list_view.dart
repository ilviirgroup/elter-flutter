import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/presenter/cubit.dart';
import '../../../entity/models.dart';

class SuperCategoryPage extends StatefulWidget {
  const SuperCategoryPage({Key? key}) : super(key: key);

  @override
  State<SuperCategoryPage> createState() => _SuperCategoryPageState();
}

class _SuperCategoryPageState extends State<SuperCategoryPage> {
  @override
  void initState() {
    context.read<SuperCategoryCubit>().fetchSuperCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
            builder: (context, state) {
              if (state is! SuperCategoryLoaded) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              final List<SuperCategory> superCategories = state.superCategories;
              return ListView.separated(
                itemBuilder: (context, index) {
                  final superCat = superCategories[index];
                  return ListTile(
                    leading: const CircleAvatar(),
                    title: Text(superCat.name),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                  );
                },
                itemCount: superCategories.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
