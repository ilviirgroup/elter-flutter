part of 'my_orders_bloc.dart';

@immutable
abstract class MyOrdersEvent extends Equatable{
  const MyOrdersEvent();

  @override
  List<Object> get props => [];
}

class MyOrdersInitializedEvent extends MyOrdersEvent {}

class MyOrdersFetchedEvent extends MyOrdersEvent {}

class MyOrdersSendedEvent extends MyOrdersEvent {
  final Map<String, dynamic> obj;
  const MyOrdersSendedEvent({required this.obj});
}

class MyOrdersDeletedEvent extends MyOrdersEvent {
  final int id;
  const MyOrdersDeletedEvent({required this.id});
}
