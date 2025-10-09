import 'package:presale/src/domain/models/v1/employee/employee.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';

import 'package:presale/src/presentation/common/inputs/simple_text_field.dart';
import 'package:flutter/material.dart';

class EmployeesViewer extends StatefulWidget {
  final List<Employee> employees;
  final VoidCallback onLoad;

  const EmployeesViewer({
    super.key,
    required this.employees,
    required this.onLoad,
  });

  @override
  State<EmployeesViewer> createState() => _EmployeesViewerState();
}

class _EmployeesViewerState extends State<EmployeesViewer> {
  @override
  void initState() {
    super.initState();
    widget.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Text(
                              'Сотрудник',
                              style: getBodyTextStyle(
                                context,
                                MoonTextSize.size14,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Text(
                              'Оклад',
                              style: getBodyTextStyle(
                                context,
                                MoonTextSize.size14,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: widget.employees.length,
                    itemBuilder: (context, index) {
                      final employee = widget.employees[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(border: Border()),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    employee.name,
                                    style: getBodyTextStyle(
                                      context,
                                      MoonTextSize.size12,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  child: SimpleTextField(
                                    inputType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    initialValue:
                                        '',
                                    onChanged: (value) {},
                                    changeAfterSubmit: true,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
