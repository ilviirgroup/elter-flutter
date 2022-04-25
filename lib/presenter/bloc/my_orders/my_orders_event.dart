part of 'my_orders_bloc.dart';

@immutable
abstract class MyOrdersEvent extends Equatable {
  const MyOrdersEvent();

  @override
  List<Object> get props => [];
}

class MyOrdersInitializedEvent extends MyOrdersEvent {}

class MyOrdersFetchedEvent extends MyOrdersEvent {
  final UrlBuilder urlBuilder;

  const MyOrdersFetchedEvent(this.urlBuilder);

  @override
  List<Object> get props => [urlBuilder];
}

class MyOrdersSentEvent extends MyOrdersEvent {
  final Map<String, dynamic> obj;
  final UrlBuilder? urlBuilder;
  const MyOrdersSentEvent({required this.obj, required this.urlBuilder });
}

class MyOrdersDeletedEvent extends MyOrdersEvent {
  final int id;
  const MyOrdersDeletedEvent({required this.id});
}

class MyOrdersLoadingEvent extends MyOrdersEvent {}
