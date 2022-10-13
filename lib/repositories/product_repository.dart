import "package:cloud_firestore/cloud_firestore.dart";

class ProductRepository {
  final FirebaseFirestore firestore;

  const ProductRepository(
    this.firestore,
  );

  Future<void> get() async {}

  Future<void> list() async {}

  Future<void> create(Map<String, dynamic> data) async {}

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
