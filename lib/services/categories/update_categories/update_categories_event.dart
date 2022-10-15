part of "update_categories_bloc.dart";

abstract class EditCategoriesEvent extends Equatable {
  const EditCategoriesEvent();

  @override
  List<Object> get props => [];
}

class OnEditCategoriesEvent extends EditCategoriesEvent {
  final Map<String, dynamic> model;

  const OnEditCategoriesEvent({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}
