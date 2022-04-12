import 'package:bloc/bloc.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/entity/repos/brand_repository.dart';
import 'package:equatable/equatable.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository repository;
  BrandBloc(this.repository) : super(BrandInitial()) {
    on<BrandEvent>((event, emit) async {
      emit(
        BrandFetchSuccess(
          await repository.fetchData(),
        ),
      );
    });
  }
}
