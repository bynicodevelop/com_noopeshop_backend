part of "delete_commons_bloc.dart";

abstract class DeleteCommonsEvent extends Equatable {
  const DeleteCommonsEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteCommonsEvent extends DeleteCommonsEvent {
  final Map<String, dynamic> form;
  final Map<String, dynamic> formData;

  const OnDeleteCommonsEvent({
    required this.form,
    required this.formData,
  });

  @override
  List<Object> get props => [
        form,
        formData,
      ];
}
