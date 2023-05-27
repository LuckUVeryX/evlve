import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/controllers/controllers.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLength: 6,
                    autofocus: true,
                    controller: _controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: context.colorScheme.onBackground),
                    decoration: const InputDecoration(
                      labelText: 'OTP',
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      prefixIcon: Icon(Icons.key_outlined),
                    ),
                    validator: (value) {
                      if (value?.length != 6) return '';
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: _OTPButton(
                        formKey: _formKey,
                        controller: _controller,
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OTPButton extends ConsumerWidget {
  const _OTPButton({
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    ref.listenErrors([authControllerProvider]);

    return FilledButton(
      onPressed: auth.isLoading
          ? null
          : () {
              final isValid = formKey.currentState?.validate() ?? false;
              if (!isValid) return;
              ref
                  .read(authControllerProvider.notifier)
                  .signInOtp(controller.text);
            },
      child: Text(context.l10n.signInPageButton),
    );
  }
}
