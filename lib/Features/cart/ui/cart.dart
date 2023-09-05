import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/Features/cart/ui/ProductTileCart.dart';
import 'package:testing/Features/cart/ui/bloc/cartbloc_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartblocBloc cartblocBloc = CartblocBloc();
  @override
  void initState() {
    cartblocBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
      ),
      body: BlocConsumer<CartblocBloc, CartblocState>(
        bloc: cartblocBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemovedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Item removed")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              print("== ${successState.cartItems.length}");
              return Scaffold(
                body: ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return ProductTileCart(
                        product: successState.cartItems[index],
                        cartblocBloc: cartblocBloc,
                      );
                    }),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
