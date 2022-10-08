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
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(
                kDefaultPadding,
              ),
              padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            ),
            Positioned(
              top: kDefaultPadding,
              right: kDefaultPadding,
              child: Padding(
                padding: const EdgeInsets.all(
                  kDefaultPadding / 2,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      if (onClose != null) {
                        onClose!();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(
                        kDefaultPadding / 2,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: kDefaultPadding,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
