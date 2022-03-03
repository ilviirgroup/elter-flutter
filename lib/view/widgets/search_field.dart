import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTappedCubit, bool>(
      builder: (context, state) {
        return TextField(
          controller: _controller,
          onTap: () {
            context.read<SearchTappedCubit>().toogleSearchEvent(true);
            context.read<ChangeCatalogScreensCubit>().changeCatalogScreen(1);
          },
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteGrey,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: """Elterde gözle""",
            prefixIcon: state
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<SearchTappedCubit>()
                          .toogleSearchEvent(false);
                      context
                          .read<ChangeCatalogScreensCubit>()
                          .changeCatalogScreen(0);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: kBlack,
                    ),
                  )
                : const Icon(
                    Icons.search,
                    color: kBlack,
                  ),
          ),
        );
      },
    );
  }
}
