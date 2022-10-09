// ignore: depend_on_referenced_packages
import "dart:io";

// ignore: depend_on_referenced_packages
import "package:com_noopeshop_backend/config/constants.dart";
import "package:desktop_drop/desktop_drop.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";

// ignore: depend_on_referenced_packages
import "package:cross_file/cross_file.dart";

class UploadInputFormComponent extends StatefulWidget {
  final ValueNotifier<List<dynamic>> data;
  final String label;
  final double heightDropZone;

  const UploadInputFormComponent({
    Key? key,
    required this.data,
    this.label = "Drag and drop your file here",
    this.heightDropZone = 200,
  }) : super(key: key);

  @override
  State<UploadInputFormComponent> createState() =>
      _UploadInputFormComponentState();
}

class _UploadInputFormComponentState extends State<UploadInputFormComponent> {
  bool _isDragOver = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropTarget(
          onDragEntered: (details) {
            setState(() => _isDragOver = !_isDragOver);
          },
          onDragExited: (details) {
            setState(() => _isDragOver = !_isDragOver);
          },
          onDragDone: (details) {
            setState(() => _isDragOver = false);

            widget.data.value.addAll(details.files);
          },
          child: DottedBorder(
            color: _isDragOver ? Colors.grey[900]! : Colors.grey[300]!,
            strokeWidth: 2,
            dashPattern: const [5, 5],
            radius: const Radius.circular(
              kDefaultPadding / 4,
            ),
            borderType: BorderType.RRect,
            child: SizedBox(
              height: widget.heightDropZone,
              child: Center(
                child: Text(widget.label),
              ),
            ),
          ),
        ),
        if (widget.data.value.isNotEmpty)
          const SizedBox(
            height: kDefaultPadding,
          ),
        if (widget.data.value.isNotEmpty)
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.data.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: kDefaultPadding,
              ),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      kDefaultPadding / 4,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            kDefaultPadding / 4,
                          ),
                          image: DecorationImage(
                            image: widget.data.value[index] is XFile
                                ? FileImage(File(widget.data.value[index].path))
                                : Image.network(
                                    widget.data.value[index],
                                  ).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () =>
                              setState(() => widget.data.value.removeAt(index)),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
      ],
    );
  }
}
