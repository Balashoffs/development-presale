import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:presale/src/presentation/bloc/construction/sections_table_cubit.dart';
import 'package:presale/src/presentation/modules/construction/selected_stage_as_table/widget/section_info_table.dart';
import 'package:provider/provider.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Center(child: Text('Id: $id'),),
    );
  }
}

class SelectBlocProvider extends StatelessWidget {
  const SelectBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SectionsTableCubit>(
      create: (BuildContext context) => SectionsTableCubit()..loadData(),
      child: SelectBlocConsumer(),
    );
  }
}

class SelectBlocConsumer extends StatelessWidget {
  const SelectBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionsTableCubit, SectionsTableState>(
      listener: (context, state) {},
      builder: (BuildContext context, SectionsTableState state) {
        return state.maybeMap(
          orElse: () {
            return Center(
              child: MoonCircularLoader(),
            );
          },
          sections: (value) {
            return ChangeNotifierProvider(
              create: (context) => RowData2UpdateNotifier(
                sectionDataNotifier: ImmutableSectionDataNotifier(
                  sectionDataList: value.sectionsData.values.expand((element) => element,).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CalcTable extends StatelessWidget {
  const CalcTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 64,
            child: Align(
              alignment: Alignment.centerRight,
              child: ValueListenableBuilder(
                valueListenable: context
                    .read<RowData2UpdateNotifier>()
                    .totalCostValueNotifier
                    .total,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Всего $value рублей',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 1000,
            child: SectionInfoTable(),
          ),
        ),
      ],
    );
  }
}