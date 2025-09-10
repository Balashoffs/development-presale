import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_with_unselected_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsResourceTableWidget extends StatefulWidget {
  const DivisionsResourceTableWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DivisionWithResourceRowVM> tableDataRows;

  @override
  State<DivisionsResourceTableWidget> createState() =>
      _DivisionsResourceTableWidgetState();
}

class _DivisionsResourceTableWidgetState
    extends State<DivisionsResourceTableWidget> {
  late final ScrollController? _verticalScrollController;
  bool _isRemoveAction = false;

  void _scrollListener(ScrollController verticalScrollController) {
    _verticalScrollController = verticalScrollController;
  }

  @override
  void didUpdateWidget(DivisionsResourceTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isRemoveAction) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _verticalScrollController?.animateTo(
          _verticalScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    } else {
      _isRemoveAction = !_isRemoveAction;
    }
  }

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
    final controller = context.read<ResourcesWithUnselectedViewController>();
    return List.generate(widget.tableDataRows.length, (int index) {
      final row = widget.tableDataRows[index];
      List<ResourceDTO> resources = controller.resourcesByDivisionShortName(
        row.divisionShortName,
      );
      int pos = index + 1;
      String key = row.resourceId.toString();
      return MoonTableRow(
        height: 72,
        cells: [
          //Close icon
          CellDecorationWidget(
            isFistCell: true,
            child: CellWithIconWidget(
              key: Key(key),
              iconData: MoonIcons.controls_close_16_light,
              onTap: () async {
                controller.onRowAction(row.resourceId, WidgetActionType.delete);
                setState(() {
                  _isRemoveAction = true;
                });
              },
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(label: '$pos', key: Key(key)),
          ),
          //Division short name
          CellDecorationWidget(
            child: TextCellWidget(label: row.divisionShortName, key: Key(key)),
          ),
          //Division name
          CellDecorationWidget(
            child: CellWithMultiLineWidget(
              key: Key(key),
              label: row.divisionName,
              hint: row.divisionDescription,
            ),
          ),
          resources.length > 1
              ? CellDecorationWidget(
                  child: ResourcesDropdownWidget(
                    key: Key(key),
                    onChanged: (context, value) async {
                      controller.onResourceName(row.resourceId, value);
                      setState(() {});
                    },
                    resources: resources,
                  ),
                )
              : CellDecorationWidget(
                  child: TextCellWidget(
                    key: Key(key),
                    label: row.resourceNameVN.value,
                  ),
                ),
          CellDecorationWidget(
            child: TextWithNotifier(
              key: Key(key),
              vn: row.resourceCostPerDayVN,
            ),
          ),
          CellDecorationWidget(
            child: IntInputCellWidget(
              key: Key(row.resourceId.toString()),
              onChanged: (context, value) async {
                controller.onResourceQnt(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.resourceQnt,
            ),
          ),
          CellDecorationWidget(
            child: IntInputCellWidget(
              key: Key(key),
              onChanged: (context, value) async {
                controller.onWorkDays(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.workDays,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(key),
              onChanged: (context, value) async {
                controller.onComplexFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.complexFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(key),
              onChanged: (context, value) async {
                controller.onSquareFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.squareFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: Key(key),
              onChanged: (context, value) async {
                controller.onResourceUsingFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.resourceUsingFactor,
            ),
          ),
          CellDecorationWidget(
            key: Key(key),
            child: TextWithNotifier(vn: row.totalResourceRowCostVN),
          ),
        ],
      );
    });
  }

  MoonTableFooter _generateTableFooter() {
    final controller = context.read<ResourcesWithUnselectedViewController>();
    return MoonTableFooter(
      cells: List.generate(widget.rowAttributes.length, (int index) {
        final row = widget.rowAttributes[index];
        if (row.pos == 12) {
          return CellDecorationWidget(
            key: Key('total'),
            child: TextWithNotifier(vn: controller.summaryVN),
          );
        }

        return CellDecorationWidget(
          isFistCell: index != 12,
          child: Center(child: Text(''))
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
        rowSize: MoonTableRowSize.md,
        header: _generateTableHeader(),
        rows: _generateTableRows(),
        footer: _generateTableFooter(),
        scrollBehaviour: MaterialScrollBehavior().copyWith(
          scrollbars: true,
          overscroll: true,
          dragDevices: {
            PointerDeviceKind.mouse,
          }
        ),
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
