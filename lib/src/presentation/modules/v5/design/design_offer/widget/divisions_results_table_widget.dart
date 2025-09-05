import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsResultsTableWidget extends StatefulWidget {
  const DivisionsResultsTableWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
    required this.footerResult,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DesignOfferResultRowVM> tableDataRows;
  final DesignOfferResultVM footerResult;

  @override
  State<DivisionsResultsTableWidget> createState() =>
      _DivisionsResultsTableWidgetState();
}

class _DivisionsResultsTableWidgetState
    extends State<DivisionsResultsTableWidget> {
  @override
  Widget build(BuildContext context) {
    double height = 48.0 * 2 + 64.0 * widget.footerResult.divisionRows.length;
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
    return List.generate(widget.tableDataRows.length, (int index) {
      final row = widget.tableDataRows[index];
      String id = '${index + 1}';
      return MoonTableRow(
        height: 54,
        cells: [
          CellDecorationWidget(
            isFistCell: true,
            child: TextCellWidget(label: id, key: Key(row.id.toString())),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionShortName,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionName,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionOverPriceS,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionMarginS,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionClientS,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionSummaryS,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionSummaryWithTaxS,
              key: Key(row.id.toString()),
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
              label: widget.footerResult.overPriceS,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 5) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.footerResult.marginS,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 6) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.footerResult.clientS,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 7) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.footerResult.summaryS,
              key: Key(key),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 8) ==
            index) {
          return CellDecorationWidget(
            child: TextCellWidget(
              label: widget.footerResult.summaryWithTaxS,
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
