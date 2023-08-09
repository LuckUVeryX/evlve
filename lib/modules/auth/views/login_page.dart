import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/controllers/controllers.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.l10n.login,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox.square(dimension: 12),
                  NeuContainer(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.email,
                        AutofillHints.username,
                      ],
                      style: context.textTheme.bodyMedium,
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.l10n.loginEmptyEmailErrorText;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: context.l10n.loginPageEmail,
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 12),
                  _PasswordTextField(controller: _passwordController),
                  const SizedBox(height: 12),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: _SignInButton(
                      formKey: _formKey,
                      controllers: (_emailController, _passwordController),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
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
    return NeuContainer(
      child: TextFormField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        obscureText: _obscureText,
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.key_outlined),
          labelText: context.l10n.loginPagePassword,
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
          if (value?.trim().isEmpty ?? true) {
            return context.l10n.loginEmptyPasswordErrorText;
          }

          return null;
        },
      ),
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

    ref.listenErrors([authControllerProvider]);

    return NeuButton(
      child: FilledButton(
        onPressed: auth.isLoading
            ? null
            : () {
                final isValid = formKey.currentState?.validate() ?? false;
                if (!isValid) return;
                final (email, password) = controllers;
                ref
                    .read(authControllerProvider.notifier)
                    .login(email: email.text, password: password.text);
              },
        child: Text(context.l10n.login),
      ),
    );
  }
}
