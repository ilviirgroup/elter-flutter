part of 'category_cubit.dart';

abstract class CategoryState extends Equatable{
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category>? categories;

  const CategoryLoaded({this.categories});
}
