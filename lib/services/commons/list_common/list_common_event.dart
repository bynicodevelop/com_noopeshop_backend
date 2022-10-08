part of "list_common_bloc.dart";

abstract class ListCommonEvent extends Equatable {
  const ListCommonEvent();

  @override
  List<Object> get props => [];
}

class OnListCommonEvent extends ListCommonEvent {
  final Map<String, dynamic> formData;

  const OnListCommonEvent({
    required this.formData,
  });

  @override
  List<Object> get props => [
        formData,
      ];
}
