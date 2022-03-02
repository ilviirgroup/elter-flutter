part of 'super_category_cubit.dart';

abstract class SuperCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuperCategoryInitial extends SuperCategoryState {}

class SuperCategoryLoaded extends SuperCategoryState {
  final List<SuperCategory> superCategories;

  SuperCategoryLoaded({required this.superCategories});
  
  @override
  List<Object> get props => [superCategories];
}
