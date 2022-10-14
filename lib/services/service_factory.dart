import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:com_noopeshop_backend/repositories/category_repository.dart";
import "package:com_noopeshop_backend/repositories/product_repository.dart";
import "package:com_noopeshop_backend/services/categories/create_category/create_category_bloc.dart";
import "package:com_noopeshop_backend/services/categories/list_categories/list_categories_bloc.dart";
import "package:com_noopeshop_backend/services/menu/click_menu/click_menu_bloc.dart";
import "package:com_noopeshop_backend/services/products/edit_product/edit_product_bloc.dart";
import "package:com_noopeshop_backend/services/products/import_aliexpress_product/import_aliexpress_product_bloc.dart";
import "package:com_noopeshop_backend/services/products/list_products/list_products_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// ignore: must_be_immutable
class ServiceFactory extends StatelessWidget {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;

  final Widget child;

  const ServiceFactory(
    this.productRepository,
    this.categoryRepository, {
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> defaultMenu = menuFactory.isEmpty
        ? {}
        : menuFactory.firstWhere(
            (element) => element["default"] == true,
          );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ClickMenuBloc>(
          create: (context) => ClickMenuBloc(defaultMenu),
        ),
        BlocProvider<ListProductsBloc>(
          create: (context) => ListProductsBloc(
            productRepository,
          ),
        ),
        BlocProvider<EditProductBloc>(
          create: (context) => EditProductBloc(
            productRepository,
          ),
        ),
        BlocProvider<ImportAliexpressProductBloc>(
          create: (context) => ImportAliexpressProductBloc(
            productRepository,
          ),
        ),
        BlocProvider<CreateCategoryBloc>(
          create: (context) => CreateCategoryBloc(
            categoryRepository,
          ),
        ),
        BlocProvider<ListCategoriesBloc>(
          create: (context) => ListCategoriesBloc(
            categoryRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
