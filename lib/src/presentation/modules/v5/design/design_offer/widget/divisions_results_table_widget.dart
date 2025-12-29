import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
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
    double height = 72.0  + 48 * widget.resultTableViewModel.divisionRows.length + 100 ;
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
      height: 72,
      columns: List.generate(widget.rowAttributes.length, (int index) {
        final attributes = widget.rowAttributes[index];
        return MoonTableColumn(
          width: attributes.width,
          cell: CellDecorationWidget(
            isFistCell: index == 0,
            child: HeaderCellWidget(attribute: attributes),
          ),
        );
      }),
    );
  }

  List<MoonTableRow> _generateTableRows() {
    return List.generate(widget.resultTableViewModel.divisionRows.length, (
      int index,
    ) {
      final row = widget.resultTableViewModel.divisionRows[index];
      String id = '${index + 1}';
      return MoonTableRow(
        height: 48,
        cells: [
          CellDecorationWidget(
            isFistCell: true,
            child: TextCellWidget(label: id, key: Key(id.toString())),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionName,
              key: Key(id.toString()),
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(label: row.summary, key: Key(id.toString())),
          ),
        ],
      );
    });
  }

  MoonTableFooter _generateTableFooter() {
    return MoonTableFooter(
      cells: List.generate(widget.rowAttributes.length, (int index) {
        if (widget.rowAttributes.indexWhere((element) => element.pos == 2) ==
            index) {
          return CellDecorationWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentGeometry.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.0,
                  children: [
                    Text('Общая стоимость без НДС'),
                    Text('НДС, 22%'),
                    Text('Общая стоимость с учетом НДС 22%'),
                  ],
                ),
              ),
            ),
          );
        }
        if (widget.rowAttributes.indexWhere((element) => element.pos == 3) ==
            index) {
          return CellDecorationWidget(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8.0,
                children: [
                  Text(widget.resultTableViewModel.fullSummary),
                  Text(widget.resultTableViewModel.tax),
                  Text(widget.resultTableViewModel.fullSummaryWithTax),
                ],
              ),
            ),
          );
        }
        return CellDecorationWidget(
          isFistCell: index == 0,
          child: SizedBox.expand(child: Center()),
        );
      }),
      height: 100,
    );
  }
}
