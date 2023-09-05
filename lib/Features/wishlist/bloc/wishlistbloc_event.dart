part of 'wishlistbloc_bloc.dart';

@immutable
sealed class WishlistblocEvent {}

class WishListInitialEvent extends WishlistblocEvent {}

class WishListRemoveEvent extends WishlistblocEvent {
  late ProductListDataModel productListDataModel;
  WishListRemoveEvent({required this.productListDataModel});
}
