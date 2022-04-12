part of 'brand_bloc.dart';

abstract class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

class BrandInitial extends BrandState {}

class BrandFetchSuccess extends BrandState {
  final List<Brand> brandList;
  const BrandFetchSuccess(this.brandList);

  @override
  List<Object> get props => [brandList];
}
