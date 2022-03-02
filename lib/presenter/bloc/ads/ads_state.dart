part of 'ads_bloc.dart';

abstract class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

class AdsInitial extends AdsState {}

class AdsLoadedState extends AdsState {
  final List<Ads> ads;
  const AdsLoadedState({required this.ads});

  @override
  List<Object> get props => [ads];
}
