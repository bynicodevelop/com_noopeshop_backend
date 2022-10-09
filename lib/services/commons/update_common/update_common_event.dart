part of "update_common_bloc.dart";

abstract class UpdateCommonEvent extends Equatable {
  const UpdateCommonEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateCommonEvent extends UpdateCommonEvent {
  final Map<String, dynamic> data;

  const OnUpdateCommonEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
