part of "import_aliexpress_product_bloc.dart";

abstract class ImportAliexpressProductEvent extends Equatable {
  const ImportAliexpressProductEvent();

  @override
  List<Object> get props => [];
}

class OnImportAliexpressProductEvent extends ImportAliexpressProductEvent {
  final String url;

  const OnImportAliexpressProductEvent(
    this.url,
  );

  @override
  List<Object> get props => [
        url,
      ];
}
