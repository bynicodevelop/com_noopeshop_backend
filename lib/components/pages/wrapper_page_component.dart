import "package:com_noopeshop_backend/components/pages/bloc/wrapper_page_bloc.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class WrapperPageComponent extends StatefulWidget {
  final Widget list;
  final Widget create;
  final Widget edit;

  const WrapperPageComponent({
    super.key,
    required this.list,
    required this.create,
    required this.edit,
  });

  @override
  State<WrapperPageComponent> createState() => _WrapperPageComponentState();
}

class _WrapperPageComponentState extends State<WrapperPageComponent> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WrapperPageBloc>(
      create: (context) => WrapperPageBloc(),
      child: BlocListener<WrapperPageBloc, WrapperPageState>(
        listener: (context, state) {
          final int index = (state as WrapperPageInitialState).index;

          if (index == _pageController.page) return;

          _pageController.jumpToPage(
            index,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: PageView(
            controller: _pageController,
            children: [
              widget.list,
              widget.create,
              widget.edit,
            ],
          ),
        ),
      ),
    );
  }
}
