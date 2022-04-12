part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInitializedEvent extends ProductEvent {}

class ProductFetchedEvent extends ProductEvent {}

class ProductUpdatedEvent extends ProductEvent {
  final Map<String, dynamic> updateObj;
  final int id;
  const ProductUpdatedEvent(this.updateObj, this.id);

  @override
  List<Object> get props => [updateObj, id];
}
