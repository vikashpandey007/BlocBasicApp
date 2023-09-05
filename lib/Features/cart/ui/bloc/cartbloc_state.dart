part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocState {}

abstract class CartActionState extends CartblocState {}

final class CartblocInitial extends CartblocState {}

class CartSuccessState extends CartblocState {
  List<ProductListDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}

class CartItemRemovedState extends CartActionState {}
