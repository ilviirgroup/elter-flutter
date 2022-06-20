part of 'my_orders_bloc.dart';


abstract class MyOrdersEvent extends Equatable {
  const MyOrdersEvent();

  @override
  List<Object> get props => [];
}

class MyOrdersInitializedEvent extends MyOrdersEvent {}

class MyOrdersFetchedEvent extends MyOrdersEvent {
  final String phone;

  const MyOrdersFetchedEvent(this.phone);

  @override
  List<Object> get props => [phone];
}

class MyOrdersSentEvent extends MyOrdersEvent {
  final Map<String, dynamic> obj;
  final String phone;
  const MyOrdersSentEvent({required this.obj, required this.phone});
}

class MyOrdersDeletedEvent extends MyOrdersEvent {
  final Map<String, dynamic> obj;
  final int id;
  const MyOrdersDeletedEvent({required this.obj, required this.id});
}

class MyOrdersLoadingEvent extends MyOrdersEvent {}
