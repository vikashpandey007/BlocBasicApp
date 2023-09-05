part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocState {}

abstract class HomeActionState extends HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadedSuccessState extends HomeblocState {
  final List<ProductListDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeblocState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeClickedToWishListAddedActionState extends HomeActionState {}

class HomeClickedCartAddedActionState extends HomeActionState {}
