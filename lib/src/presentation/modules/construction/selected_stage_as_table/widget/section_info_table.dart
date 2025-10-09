import 'package:flutter/widgets.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:provider/provider.dart';

class SectionInfoTable extends StatefulWidget {
  const SectionInfoTable({super.key});

  @override
  State<SectionInfoTable> createState() => _SectionInfoTableState();
}

class _SectionInfoTableState extends State<SectionInfoTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tableRowSizeKnob = MoonTableRowSize.x2l;

    final double rowGapKnob = 4.0;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.0,
        bottom: 42.0,
      ),
      child: OverflowBox(
        maxWidth: (MediaQuery.of(context).size.width),
        child: Consumer<RowData2UpdateNotifier>(
          builder:
              (
                BuildContext context,
                RowData2UpdateNotifier value,
                Widget? child,
              ) {
                return MoonTable(
                  columnsCount: value.columnSize,
                  sortAscending: true,
                  sortColumnIndex: 0,
                  rowGap: rowGapKnob,
                  rowSize: tableRowSizeKnob,
                  header: value.header,
                  // footer: value.footer,
                  isHeaderPinned: true,
                  rows: value.body,
                  tablePadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  cellPadding: EdgeInsets.symmetric(
                    vertical: tableRowSizeKnob == MoonTableRowSize.xs ? 4 : 8,
                  ),
                  onScrollControllersReady:
                      (
                        ScrollController verticalScrollController,
                        ScrollController horizontalScrollController,
                      ) {},
                );
              },
        ),
      ),
    );
  }
}
