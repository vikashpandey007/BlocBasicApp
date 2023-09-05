import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/Features/cart/ui/bloc/cartbloc_bloc.dart';
import 'package:testing/Features/wishlist/bloc/wishlistbloc_bloc.dart';
import 'package:testing/Features/wishlist/ui/ProductTileWishList.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishlistblocBloc wishlistblocBloc = WishlistblocBloc();
  @override
  void initState() {
    wishlistblocBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
      ),
      body: BlocConsumer<WishlistblocBloc, WishlistblocState>(
        bloc: wishlistblocBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistRemoveState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("wish list removed")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              print("== ${successState.wishListItems.length}");
              return Scaffold(
                body: ListView.builder(
                    itemCount: successState.wishListItems.length,
                    itemBuilder: (context, index) {
                      return ProductTileWishList(
                        product: successState.wishListItems[index],
                        wishlistblocBloc: wishlistblocBloc,
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
