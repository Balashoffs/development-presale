import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/core/string_converter.dart';

import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/divisions_margin_calculator/divisions_margin_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsMarginTableWidget extends StatefulWidget {
  const DivisionsMarginTableWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DivisionsWithMarginRowVM> tableDataRows;

  @override
  State<DivisionsMarginTableWidget> createState() =>
      _DivisionsMarginTableWidgetState();
}

class _DivisionsMarginTableWidgetState
    extends State<DivisionsMarginTableWidget> {
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
    final cubit = context.read<DivisionsMarginCalculateCubit>();
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
              label: row.divisionShortName,
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: CellWithMultiLineWidget(
              key: Key(row.id.toString()),
              label: row.divisionName,
              hint: row.divisionDescription,
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: convertToRubleString(row.divisionSummaryCost, 0),
              key: Key(row.id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(row.id.toString()),
              onChanged: (context, value) async {
                cubit.onOverPriceFactor(row.id, value);
                setState(() {});
              },
              defaultValue: row.overPriceFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(row.id.toString()),
              onChanged: (context, value) async {
                cubit.onMarginFactor(row.id, value);
                setState(() {});
              },
              defaultValue: row.marginFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(row.id.toString()),
              onChanged: (context, value) async {
                cubit.onClientFactor(row.id, value);
                setState(() {});
              },
              defaultValue: row.clientFactor,
            ),
          ),
          CellDecorationWidget(
            key: Key(row.id.toString()),
            child: TextWithNotifier(vn: row.summaryCostWithMarginVN),
          ),
          CellDecorationWidget(
            key: Key(row.id.toString()),
            child: TextWithNotifier(vn: row.summaryCostWithTaxVN),
          ),
        ],
      );
    });
  }

  MoonTableFooter _generateTableFooter() {
    final controller = context.read<DivisionsMarginCalculateCubit>().controller;
    return MoonTableFooter(
      cells: List.generate(widget.rowAttributes.length, (int index) {
        if (widget.rowAttributes.indexWhere(
              (element) => element.name == 'СР',
            ) ==
            index) {
          return CellDecorationWidget(
            key: Key('clear_cost'),
            child: TextWithNotifier(vn: controller.divisionClearSummaryVN),
          );
        }
        if (widget.rowAttributes.indexWhere(
              (element) => element.name == 'Итого',
            ) ==
            index) {
          return CellDecorationWidget(
            key: Key('total_cost'),
            child: TextWithNotifier(
              vn: controller.divisionsWithMarginSummaryVN,
            ),
          );
        } else if (widget.rowAttributes.indexWhere(
              (element) => element.name == 'с НДС',
            ) ==
            index) {
          return CellDecorationWidget(
            key: Key('total_cost'),
            child: TextWithNotifier(vn: controller.divisionsWithTaxSummaryVN),
          );
        }
        return CellDecorationWidget(
          isFistCell: index == 0,
          child: SizedBox.shrink(),
        );
      }),
      height: 56,
    );
  }

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
}
