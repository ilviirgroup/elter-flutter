part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable{
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInitializedEvent extends ProductEvent {}

class ProductFetchedEvent extends ProductEvent {}
