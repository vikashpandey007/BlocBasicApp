import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing/Features/home/Model/ProductListMode.dart';
import 'package:testing/data/wishListdata.dart';
part 'wishlistbloc_event.dart';
part 'wishlistbloc_state.dart';

class WishlistblocBloc extends Bloc<WishlistblocEvent, WishlistblocState> {
  WishlistblocBloc() : super(WishlistblocInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveEvent>(wishListRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistblocState> emit) {
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }

  FutureOr<void> wishListRemoveEvent(
      WishListRemoveEvent event, Emitter<WishlistblocState> emit) {
    wishListItems.remove(event.productListDataModel);
    emit(WishlistSuccessState(wishListItems: wishListItems));
    emit(WishlistRemoveState());
  }
}
