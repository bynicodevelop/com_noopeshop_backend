part of "wrapper_page_bloc.dart";

abstract class WrapperPageState extends Equatable {
  const WrapperPageState();

  @override
  List<Object> get props => [];
}

class WrapperPageInitialState extends WrapperPageState {
  final Map<String, dynamic> model;
  final int index;

  const WrapperPageInitialState({
    this.model = const {},
    this.index = 0,
  });

  @override
  List<Object> get props => [
        model,
        index,
      ];
}
