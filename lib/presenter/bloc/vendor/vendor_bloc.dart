import 'package:bloc/bloc.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/entity/repos.dart';
import 'package:equatable/equatable.dart';

part 'vendor_event.dart';
part 'vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  final VendorRepository repository;
  VendorBloc(this.repository) : super(VendorInitial()) {
    on<VendorEvent>((event, emit) async {
      emit(
        VendorFetchSuccess(
          await repository.fetchData(),
        ),
      );
    });
  }
}
