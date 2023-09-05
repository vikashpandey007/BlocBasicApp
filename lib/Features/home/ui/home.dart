import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/Features/cart/ui/cart.dart';
import 'package:testing/Features/home/bloc/homebloc_bloc.dart';
import 'package:testing/Features/home/ui/ProductTileWidget.dart';
import 'package:testing/Features/wishlist/ui/wishList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeblocBloc homeblocBloc = HomeblocBloc();
  @override
  void initState() {
    homeblocBloc.add(HomeIniatialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeClickedToWishListAddedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item addded to wishList")));
        } else if (state is HomeClickedCartAddedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item carted")));
        }
      },
      bloc: homeblocBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeblocBloc.add(HomeProductWishListNavigateEvent());
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeblocBloc.add(HomeProductCartNavigateEvent());
                      },
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductListWidget(
                      product: successState.products[index],
                      homeblocBloc: homeblocBloc,
                    );
                  }),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("error"),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
