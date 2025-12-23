import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsResultsTableWidget extends StatefulWidget {
  const DivisionsResultsTableWidget({
    super.key,
    required this.rowAttributes,
    required this.resultTableViewModel,
  });

  final List<CollumAttribute> rowAttributes;
  final ResultTableViewModel resultTableViewModel;

  @override
  State<DivisionsResultsTableWidget> createState() =>
      _DivisionsResultsTableWidgetState();
}

class _DivisionsResultsTableWidgetState
    extends State<DivisionsResultsTableWidget> {
  @override
  Widget build(BuildContext context) {
    double height = 48.0 * 4 * widget.resultTableViewModel.divisionRows .length;
    height = height > 1000 ? 1000 : height;
    return LimitedBox(
      maxWidth: MediaQuery.sizeOf(context).width - 100,
      maxHeight: height > MediaQuery.sizeOf(context).height - 300
          ? MediaQuery.sizeOf(context).height - 300
          : height,
      child: MoonTable(
        columnsCount: widget.rowAttributes.length,
        isHeaderPinned: true,
        isFooterPinned: true,
        rowGap: 2.0,
        scrollBehaviour: MaterialScrollBehavior().copyWith(
          scrollbars: true,
          overscroll: false,
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
          },
        ),
        rowSize: MoonTableRowSize.md,
        header: _generateTableHeader(),
        rows: _generateTableRows(),
        footer: _generateTableFooter(),
        tablePadding: const EdgeInsets.symmetric(horizontal: 16),
        cellPadding: const EdgeInsets.symmetric(vertical: 8),
        onScrollControllersReady:
            (
              ScrollController verticalScrollController,
              ScrollController horizontalScrollController,
            ) => _scrollListener(verticalScrollController),
      ),
    );
  }

  void _scrollListener(ScrollController verticalScrollController) {}

  MoonTableHeader _generateTableHeader() {
    return MoonTableHeader(
      height: 48,
      columns: List.generate(widget.rowAttributes.length, (int index) {
        return MoonTableColumn(
          width: widget.rowAttributes[index].width,
          cell: CellDecorationWidget(
            isFistCell: index == 0,
            child: HeaderCellWidget(attribute: widget.rowAttributes[index]),
          ),
        );
      }),
    );
  }

  List<MoonTableRow> _generateTableRows() {
    return List.generate(widget.resultTableViewModel.divisionRows.length, (int index) {
      final row = widget.resultTableViewModel.divisionRows[index];
      String id = '${index + 1}';
      return MoonTableRow(
        height: 72,
        cells: [
          CellDecorationWidget(
            isFistCell: true,
            child: TextCellWidget(label: id, key: Key(id.toString())),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionShortName,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionName,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.overPriceCost,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.marginCost,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.clientCost,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(label: row.summary, key: Key(id.toString())),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.summaryWithTax,
              key: Key(id.toString()),
            ),
          ),
        ],
      );
    });
  }

  MoonTableFooter _generateTableFooter() {
    return MoonTableFooter(
      cells: List.generate(widget.rowAttributes.length, (int index) {
        String key = widget.rowAttributes[index].pos.toString();
        if (widget.rowAttributes.indexWhere((element) => element.pos == 4) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.resultTableViewModel.overPriceSummary,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 5) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.resultTableViewModel.marginSummary,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 6) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.resultTableViewModel.clientSummary,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 7) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.resultTableViewModel.fullSummary,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 8) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.resultTableViewModel.fullSummaryWithTax,
              key: Key(key),
            ),
          );
        }
        return CellDecorationWidget(
          isFistCell: index == 0,
          child: SizedBox(child: Center(child: Text(''))),
        );
      }),
      height: 48,
    );
  }
}
