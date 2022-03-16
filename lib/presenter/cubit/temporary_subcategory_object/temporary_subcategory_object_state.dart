part of 'temporary_subcategory_object_cubit.dart';

abstract class TemporarySubcategoryObjectState extends Equatable {
  const TemporarySubcategoryObjectState();

  @override
  List<Object> get props => [];
}

class TemporarySubcategoryObjectInitial
    extends TemporarySubcategoryObjectState {}

class TemporarySubcategoryObjectLoaded extends TemporarySubcategoryObjectState {
  final SubCategory subCategory;
  const TemporarySubcategoryObjectLoaded(this.subCategory);

  @override
  List<Object> get props => [subCategory];
}
