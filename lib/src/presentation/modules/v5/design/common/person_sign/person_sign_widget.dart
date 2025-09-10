import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/person_sign_validator.dart';


class PersonSignMenuItemWidget extends StatelessWidget {
  const PersonSignMenuItemWidget({super.key, required this.onSaved});
  final Function() onSaved;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Center(
                child: MoonMenuItem(
                  width: MediaQuery.of(context).size.width / 2,
                  menuItemCrossAxisAlignment: CrossAxisAlignment.center,
                  leading: MoonAvatar(
                    borderRadius: BorderRadius.circular(8.0),
                    backgroundColor: context.moonColors!.jiren,
                    avatarSize: MoonAvatarSize.md,
                    content: const Icon(MoonIcons.chat_chat_32_light, size: 24),
                  ),
                  label: Text(
                    'Введите ваши данные для упрощенной генерации подписи при создании КП',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: CustomMoonGroupTextWidget(),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                        "*Вводимые данные хранятся локально на вашем устройстве и никуда не передаются",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MoonFilledButton(
                        backgroundColor: context.moonColors!.zeno,
                        label: const Text("Сохранить"),
                        onTap: ()async{
                          if(Form.of(context).validate()){
                            onSaved();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomMoonGroupTextWidget extends StatefulWidget {
  const CustomMoonGroupTextWidget({super.key});

  @override
  State<CustomMoonGroupTextWidget> createState() => _CustomMoonGroupTextWidgetState();
}

class _CustomMoonGroupTextWidgetState extends State<CustomMoonGroupTextWidget> {


  @override
  Widget build(BuildContext context) {
    BorderRadius customRadius = BorderRadius.circular(8.0);
    final cubit = context.read<PersonSignCubit>();
    PersonSignTextInputValidator textGroupController =
        context.read<PersonSignCubit>().textGroupController;
    double width = MediaQuery.of(context).size.width / 2;
    return SizedBox(
      width: width,
      child: MoonTextInputGroup(
        textPadding: EdgeInsets.all(8.0),
        enabled: true,
        orientation: MoonTextInputGroupOrientation.vertical,
        children: [
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: textGroupController.fistNameController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            hintText: textGroupController.fistNameHintText,
            onChanged: cubit.onFirstNameChange,
            validator: textGroupController.fistNameValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.generic_user_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.fistNameController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.secondNameController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hintText: textGroupController.secondNameHintText,
            onChanged: cubit.onSecondNameChange,
            validator: textGroupController.secondNameValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.generic_user_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.secondNameController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.lastNameController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            hintText: textGroupController.lastNameHintText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: cubit.onLastNameChange,
            validator: textGroupController.lastNameValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.generic_user_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.lastNameController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.companyTitleController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            hintText: textGroupController.companyTitleHintText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: cubit.onCompanyTitleChange,
            validator: textGroupController.companyTitleValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.generic_about_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.companyTitleController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.jobTitleController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            hintText: textGroupController.jobTitleHintText,
            onChanged: cubit.onJobTitleChange,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: textGroupController.jobTitleValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.files_case_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.jobTitleController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.phoneNumberController,
            enabled: true,
            hasFloatingLabel: true,
            borderRadius: customRadius,
            hintText: textGroupController.phoneNumberHintText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: cubit.onPhoneNumberChange,
            validator: textGroupController.phoneNumberValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.devices_phone_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.phoneNumberController.clear(),
              ),
            ),
          ),
          MoonFormTextInput(
            width: width,
            textInputSize: MoonTextInputSize.xl,
            controller: textGroupController.emailController,
            enabled: true,
            hasFloatingLabel: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            borderRadius: customRadius,
            hintText: textGroupController.jobEmailHintText,
            onChanged: cubit.onJobEmailChange,
            validator: textGroupController.jobEmailValidator,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: const Icon(MoonIcons.mail_email_stats_24_light, size: 24),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                ),
                onTap: () => textGroupController.emailController.clear(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    //
  }
}
