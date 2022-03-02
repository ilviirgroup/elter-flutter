part of 'temporary_ads_object_cubit.dart';

abstract class TemporaryAdsObjectState extends Equatable {
  const TemporaryAdsObjectState();

  @override
  List<Object> get props => [];
}

class TemporaryAdsObjectInitial extends TemporaryAdsObjectState {}

class TemporaryAdsObjectLoaded extends TemporaryAdsObjectState {
  final Ads adsObject;
  const TemporaryAdsObjectLoaded(this.adsObject);

  @override
  List<Object> get props => [adsObject];
}
