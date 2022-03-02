part of 'sub_category_cubit.dart';

abstract class SubCategoryState extends Equatable{
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final int? index;
  final List<SubCategory>? subCategories;

  const SubCategoryLoaded({this.index, this.subCategories});
}