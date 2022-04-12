part of 'vendor_bloc.dart';

abstract class VendorState extends Equatable {
  const VendorState();

  @override
  List<Object> get props => [];
}

class VendorInitial extends VendorState {}

class VendorFetchSuccess extends VendorState {
  final List<Vendor> vendorList;
  const VendorFetchSuccess(this.vendorList);

  @override
  List<Object> get props => [vendorList];
}
