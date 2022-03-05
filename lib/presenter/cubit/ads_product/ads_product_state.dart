part of 'ads_product_cubit.dart';

abstract class AdsProductState extends Equatable {
  const AdsProductState();

  @override
  List<Object> get props => [];
}

class AdsProductInitial extends AdsProductState {}

class AdsProductLoaded extends AdsProductState {
  final List<Product> products;
  const AdsProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}
