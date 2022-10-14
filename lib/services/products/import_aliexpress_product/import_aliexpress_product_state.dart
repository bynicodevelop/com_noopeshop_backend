part of "import_aliexpress_product_bloc.dart";

abstract class ImportAliexpressProductState extends Equatable {
  const ImportAliexpressProductState();

  @override
  List<Object> get props => [];
}

class ImportAliexpressProductInitialState extends ImportAliexpressProductState {
}

class ImportAliexpressProductLoadingState extends ImportAliexpressProductState {
}

class ImportAliexpressProductSuccessState extends ImportAliexpressProductState {
}

class ImportAliexpressProductFailureState extends ImportAliexpressProductState {
  final String code;

  const ImportAliexpressProductFailureState(
    this.code,
  );

  @override
  List<Object> get props => [
        code,
      ];
}
