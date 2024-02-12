import 'package:equatable/equatable.dart';

import 'tab.dart';

class WorkspaceEntity extends Equatable {
  final String id;
  final String name;
  final List<TabEntity> tabs;

  const WorkspaceEntity({
    required this.id,
    required this.name,
    required this.tabs,
  });

  addTab(TabEntity tab) {
    tabs.add(tab);
  }

  closeTab(int index) {
    tabs.removeAt(index);
  }

  selectTab(String id) {
    final tab = tabs.firstWhere(
      (element) => element.id == id,
      orElse: () => TabEntity.empty(),
    );

    if (tab.isEmpty == false) {
      tab.isSelected = true;
    }
  }

  @override
  List<Object?> get props => [id];
}
