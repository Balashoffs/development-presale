import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';
import 'package:presale/src/presentation/bloc/stages_table_page/cubit.dart';
import 'package:presale/src/presentation/bloc/stages_table_page/state/state.dart';
import 'package:presale/src/presentation/common/inputs/simple_text_field.dart';
import 'package:presale/src/presentation/modules/service_type_select/stages_table/common/section_input.dart';

class StagesTablePage extends StatelessWidget {
  final ServiceStage serviceStage;

  const StagesTablePage({super.key, required this.serviceStage});

  StagesTableCubit cubitOf(BuildContext context) =>
      context.read<StagesTableCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: context.pop,
        ),
        actions: [
          SizedBox(
            height: 30,
            child: MoonButton(
              onTap: cubitOf(context).makeXlsx,
              label: Text('Получить отчет'),
            ),
          ),
        ],
        // leadingWidth: 100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // border: Border(bottom: BorderSide(color: AppColorsDark.black),)
                    // color: getColor(context, MoonColor.goku),
                  ),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Наименование раздела',
                                  style: getBodyTextStyle(
                                    context,
                                    MoonTextSize.size12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Шифр раздела',
                                  style: getBodyTextStyle(
                                    context,
                                    MoonTextSize.size12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Коэффициент использования специалиста',
                                  style: getBodyTextStyle(
                                    context,
                                    MoonTextSize.size12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Ставка в день с учетом коэффициента',
                                  style: getBodyTextStyle(
                                    context,
                                    MoonTextSize.size12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Срок выполнения работ',
                                  style: getBodyTextStyle(
                                    context,
                                    MoonTextSize.size12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Стоимость работы без НДС с учетом сроков и коффициентов',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: BlocBuilder<StagesTableCubit, StagesTableState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.entities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final entity = state.entities[index];
                        return SectionRow(
                          key: ValueKey(entity.hashCode),
                          entity: entity,
                          index: index,
                          serviceStage: serviceStage,
                        );
                      },
                    );
                  },
                ),
              ),
              _NewSectionRow(serviceStage: serviceStage),
              _SumRow(serviceStage: serviceStage),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionRow extends StatefulWidget {
  final StagesTableEntity entity;
  final int index;
  final ServiceStage serviceStage;

  const SectionRow({
    super.key,
    required this.entity,
    required this.index,
    required this.serviceStage,
  });

  @override
  State<SectionRow> createState() => _SectionRowState();
}

class _SectionRowState extends State<SectionRow> {
  StagesTableCubit cubitOf(BuildContext context) =>
      BlocProvider.of<StagesTableCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            onPressed: () {
              cubitOf(context).removeStage(widget.index);
            },
            icon: Center(child: Icon(Icons.remove, size: 16)),
          ),
        ),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border()),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: SectionInput(
                      initial: widget.entity.section,
                      onChanged: (section) {
                        cubitOf(
                          context,
                        ).changeSectionSection(section, widget.index);
                      },
                      stage: widget.serviceStage,
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: Text(
                      widget.entity.section?.shortName ?? '',
                      style: getBodyTextStyle(context, MoonTextSize.size12),
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: SimpleTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                      ],
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      initialValue: widget.entity.coefficient.toString(),
                      onChanged: (value) {
                        if (value.isEmpty) return;
                        cubitOf(context).changeSectionCoefficient(
                          double.parse(value.replaceAll(',', '.')),
                          widget.index,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: SimpleTextField(
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      initialValue: '₽',
                      onChanged: (value) {
                        double? val = double.tryParse(
                          value.replaceAll(' ', '').replaceAll(',', '.'),
                        );
                        if (val != null) {
                          cubitOf(
                            context,
                          ).changeSectionSalaryInDay(val, widget.index);
                        }
                      },
                      changeAfterSubmit: true,
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: SimpleTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      inputType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      initialValue: widget.entity.durationOfWork.toString(),
                      onChanged: (value) {
                        cubitOf(context).changeSectionWorkDuration(
                          int.tryParse(value) ?? 0,
                          widget.index,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: SimpleTextField(
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      initialValue: '₽',
                      onChanged: (value) {
                        double? val = double.tryParse(
                          value.replaceAll(' ', '').replaceAll(',', '.'),
                        );
                        if (val != null) {
                          cubitOf(context).changeSectionCost(val, widget.index);
                        }
                      },
                      changeAfterSubmit: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NewSectionRow extends StatelessWidget {
  final ServiceStage serviceStage;

  const _NewSectionRow({required this.serviceStage});

  StagesTableCubit cubitOf(BuildContext context) =>
      context.read<StagesTableCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Center(child: Icon(Icons.add, size: 16)),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),
                  child: SectionInput(
                    onChanged: (section) {
                      cubitOf(context).addStage(section);
                    },
                    blank: true,
                    stage: serviceStage,
                  ),
                ),
              ),
              SizedBox(width: 1),
              Flexible(fit: FlexFit.tight, flex: 4, child: SizedBox()),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: MoonButton(
                    trailing: Icon(Icons.clear),
                    onTap: () => cubitOf(context).clean(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SumRow extends StatelessWidget {
  final ServiceStage serviceStage;

  const _SumRow({required this.serviceStage});

  StagesTableCubit cubitOf(BuildContext context) =>
      context.read<StagesTableCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Всего'),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Flexible(
                fit: FlexFit.tight,
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Flexible(
                fit: FlexFit.tight,
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Flexible(
                fit: FlexFit.tight,
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Flexible(
                fit: FlexFit.tight,
                child: BlocBuilder<StagesTableCubit, StagesTableState>(
                  builder: (context, state) {
                    return DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cubitOf(context).workSum?.toString() ?? '',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 1),
              Flexible(
                fit: FlexFit.tight,
                child: BlocBuilder<StagesTableCubit, StagesTableState>(
                  builder: (context, state) {
                    return DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(''),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
