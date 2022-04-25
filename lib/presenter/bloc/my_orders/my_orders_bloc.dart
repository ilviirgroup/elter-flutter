import 'package:bloc/bloc.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/entity/repos/order_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  final OrderRepository repository;
  MyOrdersBloc(this.repository) : super(MyOrdersInitial()) {
    on<MyOrdersInitializedEvent>(_onMyOrdersInitializedEvent);
    on<MyOrdersFetchedEvent>(_onMyOrdersFetchedEvent);
    on<MyOrdersSentEvent>(_onMyOrdersSentEvent);
    on<MyOrdersDeletedEvent>(_onMyOrdersDeletedEvent);
    on<MyOrdersLoadingEvent>(_onMyOrdersLoadingEvent);
  }

  void _onMyOrdersInitializedEvent(
      MyOrdersInitializedEvent event, Emitter<MyOrdersState> emit) {
    emit(MyOrdersInitial());
  }

  void _onMyOrdersFetchedEvent(
      MyOrdersFetchedEvent event, Emitter<MyOrdersState> emit) async {
    emit(
      MyOrdersFetchSuccess(
        myOrders: await repository.fetchData(event.urlBuilder),
      ),
    );
  }

  void _onMyOrdersSentEvent(
      MyOrdersSentEvent event, Emitter<MyOrdersState> emit) async {
    await repository.sendOrder(event.obj);
    emit(MyOrdersFetchSuccess(
      myOrders: await repository.fetchData(event.urlBuilder!),
    ));
  }

  void _onMyOrdersDeletedEvent(
      MyOrdersDeletedEvent event, Emitter<MyOrdersState> emit) async {
    await repository.deleteOrder(event.id);
    emit(
      MyOrdersFetchSuccess(
        myOrders: ((state.props.first) as List<Order>)
            .where((element) => element.pk != event.id)
            .toList(),
      ),
    );
  }

  void _onMyOrdersLoadingEvent(
      MyOrdersLoadingEvent event, Emitter<MyOrdersState> emit) {
    emit(
      MyOrdersLoadingState(),
    );
  }
}
