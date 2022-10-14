import "package:equatable/equatable.dart";

class MediaModel extends Equatable {
  final String uid;

  const MediaModel({
    required this.uid,
  });

  @override
  List<Object> get props => [uid];
}
