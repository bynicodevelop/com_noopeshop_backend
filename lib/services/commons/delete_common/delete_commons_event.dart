part of "delete_commons_bloc.dart";

abstract class DeleteCommonEvent extends Equatable {
  const DeleteCommonEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteCommonEvent extends DeleteCommonEvent {
  final Map<String, dynamic> form;
  final Map<String, dynamic> formData;

  const OnDeleteCommonEvent({
    required this.form,
    required this.formData,
  });

  @override
  List<Object> get props => [
        form,
        formData,
      ];
}
