import 'package:equatable/equatable.dart';

class TabContentEntity extends Equatable {
  final String id;
  final String content;

  const TabContentEntity({
    required this.id,
    required this.content,
  });

  @override
  List<Object?> get props => [id];
}
