part of "list_common_bloc.dart";

abstract class ListCommonState extends Equatable {
  const ListCommonState();

  @override
  List<Object> get props => [];
}

class ListCommonInitialState extends ListCommonState {
  final List<Map<String, dynamic>> list;

  const ListCommonInitialState({
    this.list = const [],
  });

  @override
  List<Object> get props => [
        list,
      ];
}
