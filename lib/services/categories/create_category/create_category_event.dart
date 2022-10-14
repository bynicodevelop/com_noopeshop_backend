part of "create_category_bloc.dart";

abstract class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}

class OnCreateCategoryEvent extends CreateCategoryEvent {
  final Map<String, dynamic> data;

  const OnCreateCategoryEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
