part of "delete_commons_bloc.dart";

abstract class DeleteCommonsEvent extends Equatable {
  const DeleteCommonsEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteCommonsEvent extends DeleteCommonsEvent {
  final Map<String, dynamic> form;

  const OnDeleteCommonsEvent({
    required this.form,
  });

  @override
  List<Object> get props => [
        form,
      ];
}
