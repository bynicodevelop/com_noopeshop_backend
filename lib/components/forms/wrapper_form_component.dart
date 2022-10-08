import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";

class WrapperFormComponent extends StatelessWidget {
  final Widget child;

  final Function()? onClose;

  const WrapperFormComponent({
    super.key,
    required this.child,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(
        top: kDefaultPadding * 3,
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding * 3,
      ),
      child: child,
    );
  }
}
