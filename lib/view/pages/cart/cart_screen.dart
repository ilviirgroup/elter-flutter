import 'dart:async';

import '../../../entity/models.dart';
import '../../../entity/repos/order_repository.dart';
import '../../../presenter/bloc.dart';
import '../../../presenter/cubit.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/modify_phone_number.dart';
import '../../../utils/modify_price.dart';

import '../../widgets/app_alert_dialog.dart';
import '../../widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'components/cart_list_view_item.dart';
part 'components/cart_screen_bottom_sheet.dart';
part 'components/change_quantity.dart';
part 'components/edit_user_infos.dart';

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

  bool orderSent = false;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar('Sebet'),
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
                : Container(
                    color: kWhite,
                    height: _size.height,
                    width: _size.width,
                    padding: const EdgeInsets.all(100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sebet boş',
                          style: semiBoldTextStyle.copyWith(fontSize: 26),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Image.asset(AppAssets.emptyCartImage),
                      ],
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
                    if (!_globalKey.currentState!.validate()) {
                      return;
                    } else {
                      if (state is Authenticated) {
                        bool isSameUser = state.user.phoneNumber ==
                            modifyPhoneNumber(_phoneController.text);
                        if (isSameUser) {
                          context
                              .read<MyOrdersBloc>()
                              .add(MyOrdersLoadingEvent());
                          context.read<AuthenticationBloc>().add(
                                UserInfosUpdated(
                                  state.user
                                    ..name = _nameController.text
                                    ..address = _addressController.text,
                                ),
                              );
                          Timer(const Duration(seconds: 2), () {
                            for (var item in cartItems) {
                              context.read<MyOrdersBloc>().add(
                                    MyOrdersSentEvent(
                                      urlBuilder: UrlBuilder()
                                        ..userPhone = state.user.phoneNumber,
                                      obj: Order(
                                        address: state.user.address,
                                        color: item.color,
                                        completed: false,
                                        onProcess: false,
                                        orderId: '2',
                                        orderNote: _noteController.text,
                                        photo: item.photo1 ?? '',
                                        price: modifyOrderPrice(item.newPrice!),
                                        productName: item.name,
                                        quantity:
                                            item.selectedQuantity!.toDouble(),
                                        size: item.size,
                                        userName: state.user.name,
                                        userPhone: state.user.phoneNumber,
                                        vendorName: item.vendorName,
                                      ).toJson(),
                                    ),
                                  );
                            }

                            for (var item in cartItems) {
                              context.read<CartBloc>().add(
                                  CartRemovedEvent(item.productId, item.name));
                            }
                          });
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
                  child: BlocBuilder<MyOrdersBloc, MyOrdersState>(
                    builder: (context, state) {
                      return (state is MyOrdersLoadingState)
                          ? const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: kWhite,
                              ),
                            )
                          : const Text('Sargyt et');
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
