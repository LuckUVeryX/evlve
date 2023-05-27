import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        context.l10n.signInPageTitle,
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        return (value?.trim().isEmpty ?? true) ? '' : null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: context.l10n.signInPageEmail,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        labelText: context.l10n.signInPagePassword,
                      ),
                      validator: (value) {
                        return (value?.trim().isEmpty ?? true) ? '' : null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                return;
                              }
                            },
                            child: Text(context.l10n.signInPageButton),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
