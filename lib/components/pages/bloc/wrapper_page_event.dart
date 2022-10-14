part of "wrapper_page_bloc.dart";

abstract class WrapperPageEvent extends Equatable {
  const WrapperPageEvent();

  @override
  List<Object> get props => [];
}

class OnWrapperPageEvent extends WrapperPageEvent {
  final Map<String, dynamic> model;
  final String name;

  const OnWrapperPageEvent({
    required this.model,
    required this.name,
  });

  @override
  List<Object> get props => [
        model,
        name,
      ];
}
