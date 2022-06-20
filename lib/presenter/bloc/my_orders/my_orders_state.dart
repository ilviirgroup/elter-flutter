part of 'my_orders_bloc.dart';

abstract class MyOrdersState extends Equatable {
  const MyOrdersState();

  @override
  List<Object> get props => [];
}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersFetchSuccess extends MyOrdersState {
  final List<Order>? myOrders;
  const MyOrdersFetchSuccess({this.myOrders});

  @override
  List<Object> get props => [myOrders!];
}

class MyOrdersSentSuccess extends MyOrdersState {}

class MyOrdersLoadingState extends MyOrdersState {}
