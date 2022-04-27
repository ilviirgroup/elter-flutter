import 'package:bloc/bloc.dart';
import '../../../entity/models/product.dart';
import '../../../entity/repos/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<ProductInitializedEvent>(_onProductInitialized);
    on<ProductFetchedEvent>(_onProductFetched);
    on<ProductUpdatedEvent>(_onProductUpdated);
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

  void _onProductUpdated(
      ProductUpdatedEvent event, Emitter<ProductState> emit) async {
    final updatedProduct =
        await repository.updateProduct(event.updateObj, event.id);
    // print('gelen haryt ${updatedProduct.visited}');
    // emit(
    //   ProductsLoadedState(
    //     products: await repository.fetchData(),
    //   ),
    // );
  }
}
