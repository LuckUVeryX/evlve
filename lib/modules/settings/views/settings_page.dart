import 'package:evlve/app/app.dart';
import 'package:evlve/app/router/routes.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/tester/tester.dart';
import 'package:evlve/modules/theme_switcher/theme_switcher.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(
            title: TesterDetector(child: Text(context.l10n.settings)),
          ),
        ],
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: ThemeSwitcherButton(),
            ),
            _SettingsItem(
              leadingIcon: Icons.person_outline,
              label: context.l10n.attendance,
              onTap: () => const AttendanceRoute().go(context),
            ),
            _SettingsItem(
              leadingIcon: Icons.person_outline,
              label: context.l10n.settingsAccount,
              onTap: () => const AccountSettingsRoute().go(context),
            ),
            _SettingsItem(
              leadingIcon: Icons.notifications_outlined,
              label: context.l10n.settingsNotifications,
              onTap: () => const NotificationSettingsRoute().go(context),
            ),
            _SettingsItem(
              leadingIcon: Icons.qr_code_outlined,
              label: context.l10n.settingsQRCode,
              onTap: () => const QrSettingsRoute().go(context),
            ),
            Consumer(
              builder: (context, ref, child) {
                final auth = ref.watch(authControllerProvider);
                return auth.maybeWhen(
                  orElse: () => _SettingsItem(
                    leadingIcon: Icons.logout_outlined,
                    label: context.l10n.settingsLogout,
                    backgroundColor: context.colorScheme.error,
                    foregroundColor: context.colorScheme.onError,
                    onTap: ref.read(authControllerProvider.notifier).logout,
                  ),
                  loading: () => const Padding(
                    padding: EdgeInsets.all(16),
                    child: LinearProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.leadingIcon,
    required this.label,
    this.foregroundColor,
    this.backgroundColor,
    this.onTap,
  });

  final IconData leadingIcon;
  final String label;
  final VoidCallback? onTap;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuButton(
        onPressed: onTap,
        backgroundColor:
            backgroundColor ?? context.colorScheme.surfaceContainerHighest,
        child: ListTile(
          leading: Icon(leadingIcon),
          title: Text(label),
          iconColor: foregroundColor ?? context.colorScheme.onSurfaceVariant,
          textColor: foregroundColor ?? context.colorScheme.onSurfaceVariant,
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
