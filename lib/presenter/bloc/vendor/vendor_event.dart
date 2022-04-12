part of 'vendor_bloc.dart';

abstract class VendorEvent extends Equatable {
  const VendorEvent();

  @override
  List<Object> get props => [];
}

class VendorFetched extends VendorEvent {}
