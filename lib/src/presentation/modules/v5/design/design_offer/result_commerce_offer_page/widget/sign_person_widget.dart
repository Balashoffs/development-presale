import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/modules/v5/user_login/user_login_page.dart';

class SignPersonWidget extends StatelessWidget {
  const SignPersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 600,
        child: MoonAccordion<MoonMenuItem>(
          trailing: Icon(
            MoonIcons.generic_edit_24_light,
            color: context.moonColors!.iconPrimary,
          ),
          shadows: const [],
          hasContentOutside: true,
          initiallyExpanded: true,
          accordionSize: MoonAccordionSize.md,
          backgroundColor: Colors.transparent,
          expandedBackgroundColor: context.moonColors!.heles,
          label: Text(
            'Введите ваши данные',
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
            menuItems: [UserLoginWidget()],
          ).toList(),
        ),
      ),
    );
  }
}
