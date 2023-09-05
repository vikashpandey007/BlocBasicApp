import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:testing/Features/home/Model/ProductListMode.dart';
import 'package:testing/data/cartListData.dart';
import 'package:testing/data/data.dart';
import 'package:testing/data/wishListdata.dart';
part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeIniatialEvent>(homeIniatialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListNavigateEvent>(homeProductWishListNavigateEvent);
    on<HomeProductCartNavigateEvent>(homeProductCartNavigateEvent);
  }

  FutureOr<void> homeIniatialEvent(
      HomeIniatialEvent event, Emitter<HomeblocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GadgetList.gadgets
            .map((e) => ProductListDataModel(
                brand: e["brand"],
                name: e["name"],
                price: e["price"],
                id: e["id"],
                image: e["image"]))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event,
      Emitter<HomeblocState> emit) {
    print("WishListClicked");
    wishListItems.add(event.clicked);
    emit(HomeClickedToWishListAddedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {
    print("Cart Clicked");
    cartItems.add(event.clicked);
    emit(HomeClickedCartAddedActionState());
  }

  FutureOr<void> homeProductWishListNavigateEvent(
      HomeProductWishListNavigateEvent event, Emitter<HomeblocState> emit) {
    print("wishlist navigateEvent");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartNavigateEvent(
      HomeProductCartNavigateEvent event, Emitter<HomeblocState> emit) {
    print("cart navigateEvent");
    emit(HomeNavigateToCartPageActionState());
  }
}
