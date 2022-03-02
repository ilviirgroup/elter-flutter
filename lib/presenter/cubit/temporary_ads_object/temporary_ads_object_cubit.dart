import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/ads.dart';
import 'package:equatable/equatable.dart';

part 'temporary_ads_object_state.dart';

class TemporaryAdsObjectCubit extends Cubit<TemporaryAdsObjectState> {
  TemporaryAdsObjectCubit() : super(TemporaryAdsObjectInitial());

  void temporaryAdsObject(Ads adsObject) {
    emit(
      TemporaryAdsObjectLoaded(adsObject),
    );
  }
}
