import "dart:io";

// ignore: depend_on_referenced_packages
import "package:crypto/crypto.dart";

String generateNameFromFile(File file) {
  final String extension = file.path.split(".").last;
  final String basename = md5.convert(file.readAsBytesSync()).toString();

  return "$basename.$extension";
}
