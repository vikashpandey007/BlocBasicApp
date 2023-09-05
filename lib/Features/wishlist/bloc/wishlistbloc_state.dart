part of 'wishlistbloc_bloc.dart';

@immutable
sealed class WishlistblocState {}

final class WishlistActionState extends WishlistblocState {}

final class WishlistblocInitial extends WishlistblocState {}

final class WishlistSuccessState extends WishlistblocState {
  List<ProductListDataModel> wishListItems;
  WishlistSuccessState({required this.wishListItems});
}

final class WishlistRemoveState extends WishlistActionState {}
