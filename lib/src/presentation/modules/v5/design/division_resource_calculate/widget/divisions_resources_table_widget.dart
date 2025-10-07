import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_with_unselected_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/presentation/bloc/v5/design/division_resource_calculator/division_resource_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/table/division_resources_table_utils.dart';

class DivisionsResourceTableWidget extends StatefulWidget {
  const DivisionsResourceTableWidget({
    super.key,
    required this.rowAttributes,
    required this.tableDataRows,
    this.isAll = false,
  });

  final List<CollumAttribute> rowAttributes;
  final List<DivisionWithResourceViewModel> tableDataRows;
  final bool isAll;

  @override
  State<DivisionsResourceTableWidget> createState() =>
      _DivisionsResourceTableWidgetState();
}

class _DivisionsResourceTableWidgetState
    extends State<DivisionsResourceTableWidget> {
  late final ScrollController? _verticalScrollController;
  bool _isRemoveAction = false;
  bool _isAll = false;

  void _scrollListener(ScrollController verticalScrollController) {
    _verticalScrollController = verticalScrollController;
  }

  @override
  void initState() {
    super.initState();
    _isAll = widget.isAll;
  }

  @override
  void didUpdateWidget(DivisionsResourceTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isAll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _verticalScrollController?.jumpTo(0.0);
      });
      _isAll = !_isAll;
    } else {
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
    final cubit = context.read<DivisionResourceCalculateCubit>();
    final controller = cubit.controller;
    return List.generate(widget.tableDataRows.length, (int index) {
      DropDownResources resources = controller.resourcesByDivisionShortName(
        widget.tableDataRows[index],
      );
      final row = widget.tableDataRows[index];

      return MoonTableRow(
        height: 72,
        cells: [
          //Close icon
          CellDecorationWidget(
            isFistCell: true,
            child: CellWithIconWidget(
              key: resources.key,
              iconData: MoonIcons.controls_close_16_light,
              onTap: () async {
                cubit.onRemoveRow(row.resourceId);
                setState(() {
                  _isRemoveAction = true;
                });
              },
            ),
          ),
          CellDecorationWidget(
            child: TextCellWidget(
              label: '${index+1}',
              key: resources.key,
            ),
          ),
          //Division short name
          CellDecorationWidget(
            child: TextCellWidget(
              label: row.divisionShortName,
              key: resources.key,
            ),
          ),
          //Division name
          CellDecorationWidget(
            child: CellWithMultiLineWidget(
              key: resources.key,
              label: row.divisionName,
              hint: row.divisionDescription,
            ),
          ),
          resources.unloaded.isNotEmpty
              ? CellDecorationWidget(
                  child: ResourcesDropdownWidget(
                    key: resources.key,
                    onChanged: (context, value) async {
                      cubit.onResourceName(row.resourceId, value);
                      setState(() {});
                    },
                    resources: resources.unloaded,
                    preloaded: resources.defaultValue,
                  ),
                )
              : CellDecorationWidget(
                  child: TextCellWidget(
                    key: resources.key,
                    label: row.resourceNameVN.value,
                  ),
                ),
          CellDecorationWidget(
            child: TextWithNotifier(
              key: resources.key,
              vn: row.resourceCostPerDayVN,
            ),
          ),
          CellDecorationWidget(
            child: IntInputCellWidget(
              key: resources.key,
              onChanged: (context, value) async {
                cubit.onResourceQnt(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.resourceQnt,
            ),
          ),
          CellDecorationWidget(
            child: IntInputCellWidget(
              key: resources.key,
              onChanged: (context, value) async {
                cubit.onWorkDays(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.workDays,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: resources.key,
              onChanged: (context, value) async {
                cubit.onComplexFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.complexFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: resources.key,
              onChanged: (context, value) async {
                cubit.onSquareFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.squareFactor,
            ),
          ),
          CellDecorationWidget(
            child: FloatInputCellWidget(
              key: resources.key,
              onChanged: (context, value) async {
                cubit.onResourceUsingFactor(row.resourceId, value);
                setState(() {});
              },
              defaultValue: row.resourceUsingFactor,
            ),
          ),
          CellDecorationWidget(
            key: resources.key,
            child: TextWithNotifier(vn: row.totalResourceRowCostVN),
          ),
        ],
      );
    });
  }

  MoonTableFooter _generateTableFooter() {
    final controller = context
        .read<DivisionResourceCalculateCubit>()
        .controller;
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
          child: Center(child: Text('')),
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
          dragDevices: {PointerDeviceKind.mouse},
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
