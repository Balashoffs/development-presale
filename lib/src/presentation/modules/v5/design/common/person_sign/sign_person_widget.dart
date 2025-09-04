import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/presentation/bloc/v5/user_login/user_login_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/user_login_widget.dart';

class SignPersonBuilderWidget extends StatelessWidget {
  const SignPersonBuilderWidget({super.key, required this.onSaved});

  final Function() onSaved;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoginCubit, UserLoginState>(
      buildWhen: (previous, current) => previous.isFilled != current.isFilled,
      builder: (context, state) {
        if (state.isFilled) {
          return MoonMenuItem(
            onTap: () {
              context.read<UserLoginCubit>().edit();
            },
            width: 500,
            absorbGestures: false,
            leading: Icon(
              MoonIcons.generic_user_24_light,
              color: context.moonColors!.iconPrimary,
            ),
            label: Text(
              state.labelText,
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
        return SizedBox(
          width: 600,
          child: MoonAccordion<MoonMenuItem>(
            trailing: Icon(
              MoonIcons.generic_edit_24_light,
              color: context.moonColors!.iconPrimary,
            ),
            shadows: const [],
            showBorder: true,
            borderColor: context.moonColors!.popo,
            maintainState: true,
            initiallyExpanded: true,
            accordionSize: MoonAccordionSize.md,
            backgroundColor: Colors.transparent,
            label: Text(
              state.labelText,
              style: context.moonTypography!.body.textDefault.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Icon(
              MoonIcons.generic_user_24_light,
              color: context.moonColors!.iconPrimary,
            ),
            childrenPadding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 8,
            ),
            children: MoonMenuItem.divideMenuItems(
              context: context,
              menuItems: List.generate(
                1,
                (index) => PersonSignMenuItemWidget(onSaved: onSaved),
              ),
            ).toList(),
          ),
        );
      },
    );
  }
}
