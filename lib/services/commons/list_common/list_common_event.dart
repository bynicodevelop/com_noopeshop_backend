part of "list_common_bloc.dart";

abstract class ListCommonEvent extends Equatable {
  const ListCommonEvent();

  @override
  List<Object> get props => [];
}

class OnListCommonEvent extends ListCommonEvent {
  final Map<String, dynamic> form;

  const OnListCommonEvent({
    required this.form,
  });

  @override
  List<Object> get props => [
        form,
      ];
}
