import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/controllers/controllers.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        return (value?.trim().isEmpty ?? true) ? '' : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: context.l10n.signInPageEmail,
                      ),
                    ),
                    _PasswordTextField(controller: _passwordController),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: _SignInButton(
                            formKey: _formKey,
                            controllers: (
                              _emailController,
                              _passwordController
                            ),
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

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key_outlined),
        labelText: context.l10n.signInPagePassword,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
      validator: (value) {
        return (value?.trim().isEmpty ?? true) ? '' : null;
      },
    );
  }
}

class _SignInButton extends ConsumerWidget {
  const _SignInButton({
    required this.formKey,
    required this.controllers,
  });

  final GlobalKey<FormState> formKey;
  final (
    TextEditingController email,
    TextEditingController password
  ) controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    ref.listenErrors(context, [authControllerProvider]);

    return FilledButton(
      onPressed: auth.isLoading
          ? null
          : () {
              final isValid = formKey.currentState?.validate() ?? false;
              if (!isValid) return;
              final (email, password) = controllers;
              ref
                  .read(authControllerProvider.notifier)
                  .signIn(email: email.text, password: password.text);
            },
      child: Text(context.l10n.signInPageButton),
    );
  }
}
