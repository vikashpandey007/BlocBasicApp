part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocEvent {}

class CartInitialEvent extends CartblocEvent {}

class CartRemoveItemEvent extends CartblocEvent {
  ProductListDataModel productListDataModel;
  CartRemoveItemEvent({required this.productListDataModel});
}
