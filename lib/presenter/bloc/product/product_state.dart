part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoadedState extends ProductState {
  final List<Product> products;
  const ProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}
