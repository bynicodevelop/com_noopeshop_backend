part of "pretreatment_common_bloc.dart";

abstract class PretreatmentCommonState extends Equatable {
  const PretreatmentCommonState();

  @override
  List<Object> get props => [];
}

class PretreatmentCommonInitialState extends PretreatmentCommonState {}

class PretreatmentCommonLoadingState extends PretreatmentCommonState {}

class PretreatmentCommonLoadedState extends PretreatmentCommonState {
  final Map<String, dynamic> data;

  const PretreatmentCommonLoadedState({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}

class PretreatmentCommonFailureState extends PretreatmentCommonState {
  final String code;

  const PretreatmentCommonFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
