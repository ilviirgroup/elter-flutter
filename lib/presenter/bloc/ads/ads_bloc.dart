import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/ads.dart';
import 'package:elter/entity/repos/ads_repository.dart';
import 'package:equatable/equatable.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository adsRepository;
  AdsBloc(this.adsRepository) : super(AdsInitial()) {
    on<AdsFetchEvent>(_onAdsFetchEvent);
  }

  void _onAdsFetchEvent(AdsFetchEvent event, Emitter<AdsState> emit) async {
    emit(
      AdsLoadedState(
        ads: await adsRepository.fetchData(),
      ),
    );
  }
}
