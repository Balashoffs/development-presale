import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';
import 'package:presale/src/presentation/bloc/object_table_page/cubit.dart';
import 'package:presale/src/presentation/bloc/object_table_page/state/state.dart';
import 'package:presale/src/presentation/common/inputs/simple_text_field.dart';

class ObjectTablePage extends StatelessWidget {
  final ServiceStage serviceStage;

  const ObjectTablePage({
    super.key,
    required this.serviceStage,
  });

  ObjectTableCubit cubitOf(BuildContext context) => context.read<ObjectTableCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: BlocBuilder<ObjectTableCubit, ObjectTableState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(0.7),
                        1: FlexColumnWidth(0.3),
                      },
                      border: TableBorder(
                        horizontalInside: BorderSide(
                          width: 1,
                      ),
                        verticalInside: BorderSide(
                          width: 1,
                      ),
                        top: BorderSide(
                          width: 1,
                      ),
                        left: BorderSide(
                          width: 1,
                      ),
                        right: BorderSide(
                          width: 1,
                      ),
                        bottom: BorderSide(
                          width: 1,
                      ),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Название объекта',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) => cubitOf(context).changeName(value),
                              initialValue: state.objectName,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Адрес',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) => cubitOf(context).changeAddress(value),
                              initialValue: state.address,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Площадь',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeSquare(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.square?.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Сроки проведения работ',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeWorkDuration(int.parse(value));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: false),
                              initialValue: state.workDuration.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Норма прибыли',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeProfitNorm(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.profitNorm.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Коэффициент за удаленность',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeDistance(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.distanceCoefficient.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Коэффициент за срочность',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeDuration(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.durationCoefficient.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Коэффициент заказчика',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeCustomer(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.customerCoefficient.toString(),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Text(
                                'Коэффициент сложности',
                              style: getBodyTextStyle(
                                  context, MoonTextSize.size16),
                              textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleTextField(
                              onChanged: (value) {
                                if (value.isEmpty) return;
                                cubitOf(context).changeDifficulty(double.parse(value.replaceAll(',', '.')));
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[\.,0-9]')),
                              ],
                              inputType: TextInputType.numberWithOptions(decimal: true),
                              initialValue: state.difficultyCoefficient.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  MoonButton(
                    onTap: () {
                        // context.go('${di.appRouter.routerDelegate.currentConfiguration.uri}/$stagesTableRoutePath');
                      },
                    label: Text('Далее'),
                  ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
