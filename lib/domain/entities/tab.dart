import 'package:equatable/equatable.dart';

class TabEntity extends Equatable {
  final String id;
  final String title;
  final bool isSelected;
  final Function(int) onClose;
  final Function(int) onSelect;

  const TabEntity({
    required this.id,
    required this.title,
    required this.isSelected,
    required this.onClose,
    required this.onSelect,
  });

  set isSelected(bool value) {
    isSelected = value;
  }

  @override
  List<Object?> get props => [id];

  factory TabEntity.empty() {
    return TabEntity(
      id: '',
      title: '',
      isSelected: false,
      onClose: (index) {},
      onSelect: (index) {},
    );
  }

  copyWith({
    String? id,
    String? title,
    bool? isSelected,
    Function(int)? onClose,
    Function(int)? onSelect,
  }) {
    return TabEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      onClose: onClose ?? this.onClose,
      onSelect: onSelect ?? this.onSelect,
    );
  }

  get isEmpty => id.isEmpty;
}
