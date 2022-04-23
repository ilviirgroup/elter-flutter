import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/utils/modify_phone_number.dart';
import 'package:elter/utils/modify_price.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/constant_numbers.dart';
import 'package:elter/view/constants/styles.dart';
import 'package:elter/view/pages/cart/components/cart_screen_bottom_sheet.dart';
import 'package:elter/view/pages/cart/components/edit_user_infos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/cart_list_view_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late TextEditingController _nameController;

  late TextEditingController _phoneController;

  late TextEditingController _addressController;

  late TextEditingController _noteController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sebet',
          style: boldTextStyle,
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            final cartItems = state.cartItems;
            return cartItems.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            ...state.cartItems.map(
                              (e) => CartListViewItem(product: e),
                            ),
                            BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  _addressController = TextEditingController(
                                      text: state.user.address);
                                  _nameController = TextEditingController(
                                      text: state.user.name);
                                  _noteController = TextEditingController();
                                  _phoneController = TextEditingController(
                                    text: modifyPhoneNumber(
                                        state.user.phoneNumber),
                                  );
                                  return EditUserInfos(
                                    formKey: _globalKey,
                                    user: state.user,
                                    addressController: _addressController,
                                    nameController: _nameController,
                                    noteController: _noteController,
                                    phoneController: _phoneController,
                                  );
                                }
                                _addressController = TextEditingController();
                                _nameController = TextEditingController();
                                _noteController = TextEditingController();
                                _phoneController = TextEditingController();
                                return EditUserInfos(
                                  formKey: _globalKey,
                                  addressController: _addressController,
                                  nameController: _nameController,
                                  noteController: _noteController,
                                  phoneController: _phoneController,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: MediaQuery.of(context).size.width,
                        color: kWhite,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Jemi bahasy'),
                                Text(
                                  modifyPrice(state.totalAmount),
                                  style: boldTextStyle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.isDeliveryFree
                                    ? Text(
                                        'Eltmesi Mugt',
                                        style: boldTextStyle.copyWith(
                                            color: kGreen),
                                      )
                                    : const Text('Eltmek hyzmaty',
                                        style: semiBoldTextStyle),
                                state.isDeliveryFree
                                    ? const SizedBox()
                                    : Text(
                                        modifyPrice(
                                          deliveryPrice,
                                        ),
                                        style: boldTextStyle)
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: kWhite,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 50, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Umumy',
                                      style: TextStyle(
                                          color: textGreyColor, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                const CartScreenBottomSheet());
                                      },
                                      child: Row(
                                        children: [
                                          state.isDeliveryFree
                                              ? Text(
                                                  modifyPrice(
                                                      state.totalAmount),
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 18),
                                                )
                                              : Text(
                                                  modifyPrice(
                                                      (state.totalAmount +
                                                          deliveryPrice)),
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 18),
                                                ),
                                          const SizedBox(width: 5.0),
                                          const Icon(
                                              Icons.keyboard_arrow_up_outlined)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: orderButton(cartItems),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                      'Sebediňizde haryt ýok',
                      style: semiBoldTextStyle,
                    ),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }

  SizedBox orderButton(List<Product> cartItems) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<OnSignInPageCubit, OnSignInPageState>(
          builder: (context, state) {
            Function? toSignInPage;
            if (state is OnSignInPageLoaded) {
              toSignInPage = state.signInPage;
            }
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      if (state is Authenticated) {
                        bool isSameUser = state.user.phoneNumber ==
                            modifyPhoneNumber(_phoneController.text);
                        if (isSameUser) {
                          context.read<AuthenticationBloc>().add(
                                UserInfosUpdated(
                                  state.user
                                    ..name = _nameController.text
                                    ..address = _addressController.text,
                                ),
                              );

                          for (var item in cartItems) {
                            context.read<MyOrdersBloc>().add(
                                  MyOrdersSentEvent(
                                    obj: Order(
                                            address: state.user.address,
                                            color: [
                                              "http://96.30.193.58/Colors/1/"
                                            ],
                                            completed: false,
                                            onProcess: false,
                                            orderId: '2',
                                            price: item.newPrice,
                                            productName: item.name,
                                            quantity: item.selectedQuantity!
                                                .toDouble(),
                                            size: [
                                              "http://96.30.193.58/Sizes/2/"
                                            ],
                                            userName: state.user.name,
                                            userPhone: state.user.phoneNumber)
                                        .toJson(),
                                  ),
                                );
                          }
                          for (var item in cartItems) {
                            context.read<CartBloc>().add(
                                CartRemovedEvent(item.productId, item.name));
                          }
                        } else if (!isSameUser && toSignInPage != null) {
                          toSignInPage();
                          context.read<LoginBloc>().add(AppStartEvent());
                        }
                      } else if (state is Unauthenticated &&
                          toSignInPage != null) {
                        toSignInPage();
                        context.read<LoginBloc>().add(AppStartEvent());
                      }
                    }
                  },
                  child: const Text('Sargyt et'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
