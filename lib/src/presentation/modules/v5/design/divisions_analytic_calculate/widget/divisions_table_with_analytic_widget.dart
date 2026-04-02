import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/core/string_converter.dart';

import 'package:presale/src/domain/models/v5/design/divisions_table_with_analytic/division_with_analytic_row_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/divisions_with_analytic_calculate/divisions_with_analytic_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';

class DivisionsTableWithAnalyticWidget extends StatefulWidget {
  DivisionsTableWithAnalyticWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DivisionsWithAnalyticRowVM> tableDataRows;

  bool get _isLocalAnalyticColumn =>
      tableDataRows
          .map((e) => e.localAnalytic)
          .reduce((value, element) => value + element)
          .compareTo(0.0) >
      0;

  bool get _isOutsideAnalyticColumn =>
      tableDataRows
          .map((e) => e.outsideAnalytic)
          .reduce((value, element) => value + element)
          .compareTo(0.0) >
      0;

  @override
  State<DivisionsTableWithAnalyticWidget> createState() =>
      _DivisionsTableWithAnalyticWidgetState();
}

class _DivisionsTableWithAnalyticWidgetState
    extends State<DivisionsTableWithAnalyticWidget> {
  void _scrollListener(ScrollController verticalScrollController) {}

  MoonTableHeader _generateTableHeader() {
    return MoonTableHeader(
      height: 56,
      columns: List.generate(widget.rowAttributes.length, (int index) {
        if (index == 4 && !widget._isLocalAnalyticColumn) {
          return null;
        }
        if (index == 5 && !widget._isOutsideAnalyticColumn) {
          return null;
        }
        return MoonTableColumn(
          width: widget.rowAttributes[index].width,
          cell: CellDecorationWidget(
            isFistCell: index == 0,
            child: HeaderCellWidget(attribute: widget.rowAttributes[index]),
          ),
        );
      }).nonNulls.toList(),
    );
  }

  List<MoonTableRow> _generateTableRows() {
    final cubit = context.read<DivisionsWithAnalyticCalculateCubit>();
    return List.generate(widget.tableDataRows.length, (int index) {
      final row = widget.tableDataRows[index];
      return MoonTableRow(
        height: 72,
        cells: [
          CellDecorationWidget(
            isFistCell: true,
            child: TextCellWidget(
              label: index + 1,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.shifr,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: CellWithMultiLineWidget(
              key: Key(row.id.toString()),
              label: row.section,
              hint: '',
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: convertToRubleString(row.humanHours, 0),
              key: Key(row.id.toString()),
            ),
          ),
          if (widget._isLocalAnalyticColumn)
            CellDecorationWidget(
              child: TextCellWidget(
                label: convertToRubleString(row.localAnalytic, 0),
                key: Key(row.id.toString()),
              ),
            ),
          if (widget._isOutsideAnalyticColumn)
            CellDecorationWidget(
              child: TextCellWidget(
                label: convertToRubleString(row.outsideAnalytic, 0),
                key: Key(row.id.toString()),
              ),
            ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              validator: onlyInfiniteNumberValidator,
              key: Key(row.id.toString()),
              width: 100,
              onChanged: (context, value) async {
                cubit.onManualAnalytic(row.id, value);
                setState(() {});
              },
              defaultValue: row.manualAnalytic,
            ),
          ),
          CellDecorationWidget(
            key: Key('result_$index'),
            child: TextWithNotifier(vn: row.resultVN),
          ),
        ],
      );
    }).nonNulls.toList();
  }

  MoonTableFooter _generateTableFooter() {
    final controller = context
        .read<DivisionsWithAnalyticCalculateCubit>()
        .controller;
    bool isLocalAnalyticColumn =
        widget.tableDataRows
            .map((e) => e.localAnalytic)
            .reduce((value, element) => value + element)
            .compareTo(0.0) >
        0;
    bool isOutsideAnalyticColumn =
        widget.tableDataRows
            .map((e) => e.outsideAnalytic)
            .reduce((value, element) => value + element)
            .compareTo(0.0) >
        0;
    return MoonTableFooter(
      cells: List.generate(widget.rowAttributes.length, (int index) {
        if (index == 4 && !isLocalAnalyticColumn) {
          return null;
        }
        if (index == 5 && !isOutsideAnalyticColumn) {
          return null;
        }
        if (widget.rowAttributes.length - 1 == index) {
          return CellDecorationWidget(
            key: Key('clear_cost'),
            child: TextWithNotifier(vn: controller.divisionSummaryVN),
          );
        }
        return CellDecorationWidget(
          isFistCell: index == 0,
          child: SizedBox.shrink(),
        );
      }).nonNulls.toList(),
      height: 56,
    );
  }

  @override
  Widget build(BuildContext context) {
    int localAnalyticPos = (widget._isLocalAnalyticColumn ? 0 : 1);
    int outsideAnalyticPos = (widget._isOutsideAnalyticColumn ? 0 : 1);
    int total =
        widget.rowAttributes.length - localAnalyticPos - outsideAnalyticPos;
    var header = _generateTableHeader();
    var body = _generateTableRows();
    var footer = _generateTableFooter();

    return OverflowBox(
      fit: OverflowBoxFit.deferToChild,
      child: MoonTable(
        columnsCount: total,
        isHeaderPinned: true,
        isFooterPinned: true,
        rowGap: 2.0,
        scrollBehaviour: MaterialScrollBehavior().copyWith(
          scrollbars: true,
          overscroll: true,
          dragDevices: {PointerDeviceKind.mouse},
        ),
        rowSize: MoonTableRowSize.md,
        header: header,
        rows: body,
        footer: footer,
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
}
