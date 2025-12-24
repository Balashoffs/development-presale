import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';

import 'package:presale/src/presentation/modules/v5/design/common/person_sign/person_sign_widget.dart';

class PersonSignBuilderWidget extends StatelessWidget {
  const PersonSignBuilderWidget({
    super.key,
    required this.onSaved,
    required this.onEdit,
  });

  final VoidCallback onSaved;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonSignCubit, PersonSignState>(
      buildWhen: (previous, current) => previous.isFilled != current.isFilled,
      builder: (context, state) {
        return SizedBox(
          // width: state.isFilled ? 400 : 600,
          width: 400,
          child: state.isFilled
              ? SignMenuItem(labelText: state.labelText, onTap: onEdit)
              : SignAccordionMenuWidget(
                  labelText: state.labelText,
                  onSaved: onSaved,
                ),
        );
      },
    );
  }
}

class SignAccordionMenuWidget extends StatelessWidget {
  const SignAccordionMenuWidget({
    super.key,
    required this.labelText,
    required this.onSaved,
  });

  final String labelText;
  final VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return MoonAccordion<MoonMenuItem>(
      shadows: const [],
      showBorder: true,
      borderColor: context.moonColors!.popo,
      maintainState: true,
      initiallyExpanded: true,
      accordionSize: MoonAccordionSize.md,
      backgroundColor: Colors.transparent,
      label: Text(
        labelText,
        style: context.moonTypography!.body.textDefault.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        MoonIcons.generic_user_24_light,
        color: context.moonColors!.iconPrimary,
      ),
      childrenPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      children: MoonMenuItem.divideMenuItems(
        context: context,
        menuItems: List.generate(
          1,
          (index) => PersonSignMenuItemWidget(onSaved: onSaved),
        ),
      ).toList(),
    );
  }
}

class SignMenuItem extends StatelessWidget {
  const SignMenuItem({super.key, required this.labelText, required this.onTap});

  final String labelText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MoonMenuItem(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: context.moonColors!.popo),
      ),
      onTap: onTap,
      absorbGestures: false,
      leading: Icon(
        MoonIcons.generic_user_24_light,
        color: context.moonColors!.iconPrimary,
      ),
      label: Text(
        labelText,
        style: context.moonTypography!.body.textDefault.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Icon(
        MoonIcons.generic_edit_24_light,
        color: context.moonColors!.iconPrimary,
      ),
    );
  }
}
