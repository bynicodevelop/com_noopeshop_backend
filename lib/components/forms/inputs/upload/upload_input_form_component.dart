import "dart:io";

// ignore: depend_on_referenced_packages
import "package:cross_file/cross_file.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:desktop_drop/desktop_drop.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";

class UploadInputFormComponent extends StatefulWidget {
  final String label;
  final double heightDropZone;

  const UploadInputFormComponent({
    Key? key,
    this.label = "Drag and drop your file here",
    this.heightDropZone = 200,
  }) : super(key: key);

  @override
  State<UploadInputFormComponent> createState() =>
      _UploadInputFormComponentState();
}

class _UploadInputFormComponentState extends State<UploadInputFormComponent> {
  final List<XFile> _files = [];
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

            _files.addAll(details.files);
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
        const SizedBox(
          height: kDefaultPadding,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: _files.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
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
                            image: FileImage(File(_files[index].path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() => _files.removeAt(index));
                          },
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
        ),
      ],
    );
  }
}
