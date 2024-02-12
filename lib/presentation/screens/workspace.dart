import 'package:flutter/material.dart';

class WorkSpaceScreen extends StatefulWidget {
  const WorkSpaceScreen({Key? key}) : super(key: key);

  @override
  WorkSpaceScreenState createState() => WorkSpaceScreenState();
}

class WorkSpaceScreenState extends State<WorkSpaceScreen> {
  List<TabItem> tabs = [];
  List<Widget> contents = [];

  int currentTab = 0;

  WorkSpaceScreenState({Key? key}) : super() {
    contents = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

    tabs = [
      TabItem(
        index: 0,
        title: 'Tab 1',
        isSelected: true,
        onClose: (index) {
          setState(() {
            tabs.removeAt(index);
            currentTab = 0;
          });
        },
        onSelect: (index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
      TabItem(
        index: 1,
        title: 'Tab 2',
        isSelected: false,
        onClose: (index) {
          setState(() {
            tabs.removeAt(index);
            currentTab = 0;
          });
        },
        onSelect: (index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkSpaceTabBar(
        tabs: tabs,
        currentTab: currentTab,
      ),
      body: WorkSpaceContent(
        contents: contents,
        currentIndex: currentTab,
      ),
    );
  }
}

class WorkSpaceTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabItem> tabs;
  final int currentTab;

  const WorkSpaceTabBar({
    Key? key,
    required this.tabs,
    required this.currentTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs.map(
        (e) {
          if (e.index == currentTab) {
            return TabItem(
              index: e.index,
              title: e.title,
              isSelected: true,
              onClose: e.onClose,
              onSelect: e.onSelect,
            );
          }

          return TabItem(
            index: e.index,
            title: e.title,
            isSelected: false,
            onClose: e.onClose,
            onSelect: e.onSelect,
          );
        },
      ).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final void Function(int index) onSelect;
  final void Function(int index) onClose;

  const TabItem({
    Key? key,
    required this.index,
    required this.title,
    required this.isSelected,
    required this.onClose,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onSelect(index),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  onClose(index);
                },
                child: Icon(
                  Icons.close,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkSpaceContent extends StatelessWidget {
  final List<Widget> contents;
  final int currentIndex;

  const WorkSpaceContent({
    super.key,
    required this.contents,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final content = contents[currentIndex];

    return content;
  }
}
