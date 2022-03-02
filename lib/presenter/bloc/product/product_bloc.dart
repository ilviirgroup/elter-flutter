import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/product.dart';
import 'package:elter/entity/repos/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<ProductInitializedEvent>(_onProductInitialized);
    on<ProductFetchedEvent>(_onProductFetched);
  }

  void _onProductInitialized(
      ProductInitializedEvent event, Emitter<ProductState> emit) {
    emit(ProductInitial());
  }

  void _onProductFetched(
      ProductFetchedEvent event, Emitter<ProductState> emit) async {
    emit(
      ProductsLoadedState(
        products: await repository.fetchData(),
      ),
    );
  }
}
