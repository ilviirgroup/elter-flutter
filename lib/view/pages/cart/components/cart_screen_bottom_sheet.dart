part of 'package:elter/view/pages/cart/cart_screen.dart';

class CartScreenBottomSheet extends StatelessWidget {
  
  const CartScreenBottomSheet({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Container(
              // height: _size.height * 0.5,
              width: _size.width,
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Eltmesi mugt harytlar',
                      style: greenTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ...(state as CartLoadedState).cartItems.map(
                      (e) {
                        if (e.freeDelivery!) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('•  ' + e.name),
                              Text(
                                modifyPrice(
                                    (e.newPrice! * e.selectedQuantity!)),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Jemi',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          modifyPrice(state.freeDeliveryProductsPrice),
                          style: greenTextStyle,
                        ),
                      ],
                    ),
                    // -//--------- Adaty harytlar
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Adaty harytlar',
                      style: boldTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ...state.cartItems.map(
                      (e) {
                        if (!e.freeDelivery!) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('•  ' + e.name),
                              Text(
                                modifyPrice(
                                    (e.newPrice! * e.selectedQuantity!)),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Jemi',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          modifyPrice((state.totalAmount -
                              state.freeDeliveryProductsPrice)),
                          style: boldTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: _size.width * 0.8,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              'Eltmesi mugt bolan harytlaryň jemi bahasy 100 manatdan geçen ýagdaýynda eltmek hyzmaty TÖLEGSIZ amala aşyrylýar.',
                              style: semiBoldTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 28,
            ),
          ),
        )
      ],
    );
  }
}
