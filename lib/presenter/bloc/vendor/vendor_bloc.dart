import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../entity/models.dart';
import '../../../entity/repos.dart';

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
