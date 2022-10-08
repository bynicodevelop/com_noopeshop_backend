part of "delete_commons_bloc.dart";

abstract class DeleteCommonEvent extends Equatable {
  const DeleteCommonEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteCommonEvent extends DeleteCommonEvent {
  final Map<String, dynamic> form;
  final Map<String, dynamic> data;

  const OnDeleteCommonEvent({
    required this.form,
    required this.data,
  });

  @override
  List<Object> get props => [
        form,
        data,
      ];
}
