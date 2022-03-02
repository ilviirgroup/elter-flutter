import 'package:bloc/bloc.dart';
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
    on<MyOrdersSendedEvent>(_onMyOrdersSendedEvent);
    on<MyOrdersDeletedEvent>(_onMyOrdersDeletedEvent);
  }

  void _onMyOrdersInitializedEvent(
      MyOrdersInitializedEvent event, Emitter<MyOrdersState> emit) {
    emit(MyOrdersInitial());
  }

  void _onMyOrdersFetchedEvent(
      MyOrdersFetchedEvent event, Emitter<MyOrdersState> emit) async {
    emit(
      MyOrdersFetchSuccess(
        myOrders: await repository.fetchData(),
      ),
    );
  }

  void _onMyOrdersSendedEvent(
      MyOrdersSendedEvent event, Emitter<MyOrdersState> emit) async {
    await repository.sendOrder(event.obj);
    // emit();
  }

  void _onMyOrdersDeletedEvent(
      MyOrdersDeletedEvent event, Emitter<MyOrdersState> emit) async {
    await repository.deleteOrder(event.id);
    emit(
      MyOrdersFetchSuccess(
        myOrders: ((state.props.first) as List)
            .where((element) => element.id != event.id)
            .toList(),
      ),
    );
  }
}
