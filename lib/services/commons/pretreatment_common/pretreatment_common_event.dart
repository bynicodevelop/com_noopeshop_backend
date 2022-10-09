part of "pretreatment_common_bloc.dart";

abstract class PretreatmentCommonEvent extends Equatable {
  const PretreatmentCommonEvent();

  @override
  List<Object> get props => [];
}

class OnPretreatmentCommonEvent extends PretreatmentCommonEvent {
  final Map<String, dynamic> data;

  const OnPretreatmentCommonEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
