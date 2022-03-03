part of 'change_catalog_screens_cubit.dart';

abstract class ChangeCatalogScreensState extends Equatable {
  const ChangeCatalogScreensState();

  @override
  List<Object> get props => [];
}

class ChangeCatalogScreensInitial extends ChangeCatalogScreensState {}

class ChangeCatalogScreensChanged extends ChangeCatalogScreensState {
  final int index;
  const ChangeCatalogScreensChanged(this.index);

  @override
  List<Object> get props => [index];
}
