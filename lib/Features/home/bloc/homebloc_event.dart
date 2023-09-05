part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocEvent {}

class HomeIniatialEvent extends HomeblocEvent {}

class HomeProductWishListButtonClickedEvent extends HomeblocEvent {
  final ProductListDataModel clicked;
  HomeProductWishListButtonClickedEvent({required this.clicked});
}

class HomeProductCartButtonClickedEvent extends HomeblocEvent {
  final ProductListDataModel clicked;
  HomeProductCartButtonClickedEvent({required this.clicked});
}

class HomeProductWishListNavigateEvent extends HomeblocEvent {}

class HomeProductCartNavigateEvent extends HomeblocEvent {}
