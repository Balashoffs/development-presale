import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/presentation/modules/v5/design/common/company_info_widget/cubit/company_info_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';


class CompanyInfoBlocBuilderWidget extends StatelessWidget {
  const CompanyInfoBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyInfoCubit, CompanyInfoState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return state.when(
              initial: () => CustomCircleLoader(),
              selecting: (companies) => CompanyInfoDropDownWidget(
                data: companies,
                onSelected: (selected) =>
                    context.read<CompanyInfoCubit>().onSelected(selected),
              ),
              selected: (info) => CompanyInfoSelectedWidget(
                info: info,
                onChange: () =>
                    context.read<CompanyInfoCubit>().onChangeCompany(),
              ),
              error: () => CompanyInfoErrorWidget(onPressed: () {}),
            );
          },
        );
      },
    );
  }
}

class CompanyInfoSelectedWidget extends StatelessWidget {
  const CompanyInfoSelectedWidget({
    super.key,
    required this.info,
    required this.onChange,
  });

  final CompanyInfoDTO info;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 16.0,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16.0,
                      children: [
                        Icon(MoonIcons.generic_home_16_light),
                        Text('Юр. Лицо:'),
                      ],
                    ),
                  ),
                  Text(info.companyName),
                ],
              ),
              Row(
                spacing: 16.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16.0,
                      children: [
                        Icon(MoonIcons.generic_user_swapping_16_light),
                        Text('Ген. Директор:'),
                      ],
                    ),
                  ),
                  Text(info.shortSign),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onChange,
          icon: Icon(MoonIcons.generic_close_16_light, shadows: []),
        ),
      ],
    );
  }
}

class CompanyInfoDropDownWidget extends StatefulWidget {
  const CompanyInfoDropDownWidget({
    super.key,
    required this.data,
    required this.onSelected,
  });

  final List<String> data;
  final Function(String) onSelected;

  @override
  State<CompanyInfoDropDownWidget> createState() =>
      _CompanyInfoDropDownWidgetState();
}

class _CompanyInfoDropDownWidgetState extends State<CompanyInfoDropDownWidget> {
  bool _showChoices = false;
  String _selected = '';
  final List<String> _unselected = [];

  @override
  void initState() {
    super.initState();
    _unselected.addAll(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return MoonDropdown(
      show: _showChoices,
      minWidth: 250,
      borderRadius: BorderRadius.circular(8.toDouble()),
      distanceToTarget: 8.0,
      dropdownAnchorPosition: MoonDropdownAnchorPosition.bottom,
      dropdownShadows: [],
      onTapOutside: () => setState(() => _showChoices = false),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(8.toDouble()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
            (int index) => MoonMenuItem(
              width: 360,
              absorbGestures: true,
              onTap: () {
                setState(() {
                  String selected = widget.data[index];
                  if (_selected.isNotEmpty) {
                    _unselected.add(_selected);
                  }
                  _unselected.removeWhere((element) => selected == element);
                  _selected = selected;
                  widget.onSelected(selected);
                });
              },
              label: Text(widget.data[index]),
            ),
          ),
        ),
      ),
      child: MoonTextInput(
        width: 400,
        readOnly: true,
        canRequestFocus: false,
        mouseCursor: MouseCursor.defer,
        hintText: _selected.isEmpty ? 'Выберите компанию' : _selected,
        onTap: () => setState(() => _showChoices = !_showChoices),
        onTapOutside: (PointerDownEvent _) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        leading: const Icon(MoonIcons.generic_home_24_light, size: 24),
        trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Center(
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _showChoices ? -0.5 : 0,
              child: const Icon(
                MoonIcons.controls_chevron_down_16_light,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyInfoErrorWidget extends StatelessWidget {
  const CompanyInfoErrorWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Error!'),
        IconButton(
          onPressed: onPressed,
          icon: Icon(MoonIcons.notifications_alert_16_light),
        ),
      ],
    );
  }
}
