import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            return ListView(
              children: [
                ...state.cartItems.map(
                  (e) => Container(
                    color: kWhite,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    child: Stack(children: [
                      Center(
                        child: Text(e.name),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartRemovedEvent(e.productId, e.name));
                          },
                          splashRadius: 20,
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ]),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text('Hello'),
          );
        },
      ),
    );
  }
}
