part of "edit_product_bloc.dart";

abstract class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

class EditProductInitialState extends EditProductState {}

class EditProductLoadingState extends EditProductState {}

class EditProductSuccessState extends EditProductState {}

class EditProductFailureState extends EditProductState {
  final String code;

  const EditProductFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
