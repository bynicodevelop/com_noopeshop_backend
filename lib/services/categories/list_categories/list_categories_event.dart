part of "list_categories_bloc.dart";

abstract class ListCategoriesEvent extends Equatable {
  const ListCategoriesEvent();

  @override
  List<Object> get props => [];
}

class OnListCategoriesEvent extends ListCategoriesEvent {}
