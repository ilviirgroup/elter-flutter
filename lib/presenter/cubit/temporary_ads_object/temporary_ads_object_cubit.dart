import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../entity/models/ads.dart';

part 'temporary_ads_object_state.dart';

class TemporaryAdsObjectCubit extends Cubit<TemporaryAdsObjectState> {
  TemporaryAdsObjectCubit() : super(TemporaryAdsObjectInitial());

  void temporaryAdsObject(Ads adsObject) {
    emit(
      TemporaryAdsObjectLoaded(adsObject),
    );
  }
}
