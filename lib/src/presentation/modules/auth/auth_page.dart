import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';

class AuthPage extends StatelessWidget {
  final void Function(String code) onPasswordChanged;
  final VoidCallback onConfirmed;
  final Stream<bool> loadingStream;
  final Stream<String?> errorStream;

  const AuthPage({
    super.key,
    required this.onPasswordChanged,
    required this.onConfirmed,
    required this.loadingStream,
    required this.errorStream,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 312),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Калькулятор для расчета стоимости работ и услуг',
                  style: getHeadingTextStyle(context, MoonTextSize.size16),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 28),
                StreamBuilder<String?>(
                  stream: errorStream,
                  builder: (context, snapshot) {
                    return PasswordWidget(onPasswordChanged: onPasswordChanged);
                  },
                ),
                const SizedBox(height: 28),
                MoonButton(
                  onTap: () {
                    onConfirmed();
                  },
                  label: Text('Войти'),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key, required this.onPasswordChanged});

  final void Function(String code) onPasswordChanged;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      textInputSize: MoonTextInputSize.xl,
      controller: _passwordController,
      enabled: true,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _hidePassword,
      hasFloatingLabel: true,
      borderRadius: BorderRadius.circular(8.toDouble()),
      hintText: "Введите пароль",
      onTapOutside: (PointerDownEvent _) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      leading: const Icon(MoonIcons.security_password_24_light, size: 24),
      onChanged: widget.onPasswordChanged,
      trailing: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: IntrinsicWidth(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                _hidePassword
                    ? MoonIcons.controls_eye_crossed_16_light
                    : MoonIcons.controls_eye_24_light,
              ),
            ),
          ),
          onTap: () => setState(() => _hidePassword = !_hidePassword),
        ),
      ),
    );
  }
}
