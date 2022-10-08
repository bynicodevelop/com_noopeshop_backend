part of "create_common_bloc.dart";

abstract class CreateCommonEvent extends Equatable {
  const CreateCommonEvent();

  @override
  List<Object> get props => [];
}

class OnCreateCommonEvent extends CreateCommonEvent {
  final Map<String, dynamic> data;

  const OnCreateCommonEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
