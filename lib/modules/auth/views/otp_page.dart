import 'dart:async';

import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/controllers/controllers.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                context.l10n.otpPageTitle,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 48),
              _Pinput(),
              const SizedBox(height: 32),
              Text(context.l10n.otpDidntReceive),
              const _ResendButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResendButton extends ConsumerStatefulWidget {
  const _ResendButton();

  @override
  ConsumerState<_ResendButton> createState() => _ResendButtonState();
}

class _ResendButtonState extends ConsumerState<_ResendButton> {
  Timer? _timer;

  static const _maxTick = 30;

  Future<void> _onPressed() async {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick >= _maxTick) {
          timer.cancel();
          _timer = null;
        }
        setState(() {});
      },
    );
    setState(() {});

    await ref.read(authControllerProvider.notifier).resendOtp();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_timer != null) {
      return Text('${_maxTick - _timer!.tick}');
    }
    return TextButton(
      onPressed: _timer == null ? _onPressed : null,
      child: Text(
        _timer == null ? context.l10n.otpResend : '${_maxTick - _timer!.tick}',
      ),
    );
  }
}

class _Pinput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smsRetriever = useRef(_SmsRetrieverImpl(SmartAuth()));

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Pinput(
      length: 6,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      smsRetriever: smsRetriever.value,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onCompleted: ref.read(authControllerProvider.notifier).signInOtp,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: 68,
        width: 64,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: context.colorScheme.primary),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: context.colorScheme.errorContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _SmsRetrieverImpl implements SmsRetriever {
  const _SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final res = await smartAuth.getSmsCode();
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
