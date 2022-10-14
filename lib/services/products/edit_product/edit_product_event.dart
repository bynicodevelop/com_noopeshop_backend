part of "edit_product_bloc.dart";

abstract class EditProductEvent extends Equatable {
  const EditProductEvent();

  @override
  List<Object> get props => [];
}

class OnEditProductEvent extends EditProductEvent {
  final ProductModel productModel;

  const OnEditProductEvent({
    required this.productModel,
  });

  @override
  List<Object> get props => [
        productModel,
      ];
}
