

import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';
import 'package:presale/src/presentation/core/navigation/app_router.dart';

import 'package:presale/src/presentation/core/navigation/nested_route.dart';
import 'package:presale/src/presentation/modules/data_viewer/viewer_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewerPage extends StatefulWidget {
  final List<ViewerTabInfo> tabs;

  final String Function() getLocationOfContext;
  final StatefulNavigationShell shell;

  const ViewerPage({
    super.key,
    required this.tabs,
    required this.getLocationOfContext,
    required this.shell,
  });

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> with SingleTickerProviderStateMixin {
  // late List<_TabNavigator> _tabs;
  late int _tabIndex;
  final ValueNotifier<bool> _hoverLogo = ValueNotifier(false);

  late List<ViewerTab> _tabs;
  final ValueNotifier<int> _tabsIndex = ValueNotifier(0);

  void _updateForCurrentTab() {
    _tabIndex = widget.shell.currentIndex;
  }

  @override
  void initState() {
    super.initState();

    _tabIndex = 0;
    _tabs = widget.tabs.map((e) => e.info).toList();
  }

  @override
  void didUpdateWidget(covariant ViewerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateForCurrentTab();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateForCurrentTab();
  }

  @override
  Widget build(BuildContext context) {
    // if (_tabIndex < 0) return const SizedBox.shrink();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => context.go(defaultAuthorizedPath),
        ),
        actions: [
          if (_tabIndex == 0)
            MoonButton(
              width: 64,
              height: 64,
              leading: Icon(Icons.arrow_downward),
              onTap: () {
                FilePicker.platform
                    .pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                  allowMultiple: false,
                )
                    .then((value) {
                  if (value != null) {

                  }
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Flexible(child: widget.shell),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomBar(),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() => _BottomNavigation(
        // key: ValueKey(widget.tabs.length.toString() + _tabIndex.toString()),
        tabs: _tabs,
        tabIndexChanged: (index) {

          widget.shell.goBranch(index, initialLocation: _tabIndex == index);
          _tabIndex = index;
        },
        initialIndex: _tabIndex,
        shell: widget.shell,
      );
}

class _BottomNavigation extends StatefulWidget {
  final List<ViewerTab> tabs;
  final Function(int index) tabIndexChanged;
  final int initialIndex;
  final StatefulNavigationShell shell;

  const _BottomNavigation({
    required this.tabs,
    required this.tabIndexChanged,
    this.initialIndex = 0,
    required this.shell,
  });

  @override
  State<_BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation> with TickerProviderStateMixin {
  late int _currentIndex;
  late List<GlobalKey> _tabsKeys;
  final ScrollController _scrollController = ScrollController();
  TabController? _controller;
  final double _padding = 0;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    _tabsKeys = widget.tabs.map((e) => LabeledGlobalKey(e.index.toString())).toList();
    _controller = TabController(length: widget.tabs.length, vsync: this);
    _controller?.addListener(() {

      if (_currentIndex != _controller?.index) {
        _currentIndex = _controller!.index;
        widget.tabIndexChanged(_controller!.index);
      }
    });
    // _scrollToCurrentTab();
    super.initState();
  }

  @override
  void didUpdateWidget(_BottomNavigation oldWidget) {
    _tabsKeys = widget.tabs.map((e) => LabeledGlobalKey(e.index.toString())).toList();
    // _controller = TabController(length: widget.tabs.length, vsync: this);
    _currentIndex = widget.initialIndex;
    _controller?.index = _currentIndex;

    // _scrollToCurrentTab();
    super.didUpdateWidget(oldWidget);
  }

  

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _controller,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelColor: getColor(context, MoonColor.popo),
      unselectedLabelColor: getColor(context, MoonColor.trunks),
      dividerColor: Colors.transparent,
      splashBorderRadius: BorderRadius.all(Radius.circular(8)),
      tabs: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Сотрудники',
            style: getBodyTextStyle(context, MoonTextSize.size16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Стадии',
            style: getBodyTextStyle(context, MoonTextSize.size16),
          ),
        ),
      ],
    );
  }
}
