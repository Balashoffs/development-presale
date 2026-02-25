import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/core/string_converter.dart';

import 'package:presale/src/domain/models/v5/design/divisions_table_with_analytic/division_with_analytic_row_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/divisions_with_analytic_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsTableWithAnalyticWidget extends StatefulWidget {
  const DivisionsTableWithAnalyticWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DivisionsWithAnalyticRowVM> tableDataRows;

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
          CellDecorationWidget(
            child: TextCellWidget(
              label: convertToRubleString(row.localAnalytic, 0),
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: convertToRubleString(row.outsideAnalytic, 0),
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(row.id.toString()),
              width: 100,
              onChanged: (context, value) async {
                cubit.onResult(row.id, value);
                setState(() {});
              },
              defaultValue: row.result,
            ),
          ),
        ],
      );
    });
  }

  // MoonTableFooter _generateTableFooter() {
  //   final controller = context.read<DivisionsWithAnalyticCalculateCubit>().controller;
  //   return MoonTableFooter(
  //     cells: List.generate(widget.rowAttributes.length, (int index) {
  //       if (widget.rowAttributes.indexWhere(
  //             (element) => element.name == 'СР',
  //           ) ==
  //           index) {
  //         return CellDecorationWidget(
  //           key: Key('clear_cost'),
  //           child: TextWithNotifier(vn: controller.divisionSummaryVN),
  //         );
  //       }
  //       if (widget.rowAttributes.indexWhere(
  //             (element) => element.name == 'Итого',
  //           ) ==
  //           index) {
  //         return CellDecorationWidget(
  //           key: Key('total_cost'),
  //           child: TextWithNotifier(
  //             vn: controller.divisionsWithMarginSummaryVN,
  //           ),
  //         );
  //       } else if (widget.rowAttributes.indexWhere(
  //             (element) => element.name == 'с НДС',
  //           ) ==
  //           index) {
  //         return CellDecorationWidget(
  //           key: Key('total_cost'),
  //           child: TextWithNotifier(vn: controller.divisionsWithTaxSummaryVN),
  //         );
  //       }
  //       return CellDecorationWidget(
  //         isFistCell: index == 0,
  //         child: SizedBox.shrink(),
  //       );
  //     }),
  //     height: 56,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      fit: OverflowBoxFit.deferToChild,
      child: MoonTable(
        columnsCount: widget.rowAttributes.length,
        isHeaderPinned: true,
        isFooterPinned: true,
        rowGap: 2.0,
        scrollBehaviour: MaterialScrollBehavior().copyWith(
          scrollbars: true,
          overscroll: true,
          dragDevices: {PointerDeviceKind.mouse},
        ),
        rowSize: MoonTableRowSize.md,
        header: _generateTableHeader(),
        rows: _generateTableRows(),
        // footer: _generateTableFooter(),
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
