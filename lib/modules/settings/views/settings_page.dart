import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _SettingsListTile(
            leadingIcon: Icons.person_outline,
            label: context.l10n.settingsAccount,
            onTap: () => const AccountSettingsRoute().go(context),
          ),
          _SettingsListTile(
            leadingIcon: Icons.notifications_outlined,
            label: context.l10n.settingsNotifications,
            onTap: () => const NotificationsSettingsRoute().go(context),
          ),
          _SettingsListTile(
            leadingIcon: Icons.light_mode_outlined,
            label: context.l10n.settingsApperance,
            onTap: () => const ThemeSettingsRoute().go(context),
          ),
          _SettingsListTile(
            leadingIcon: Icons.qr_code_outlined,
            label: context.l10n.settingsQRCode,
            onTap: () => const QRSettingsRoute().go(context),
          ),
          Consumer(
            builder: (context, ref, child) {
              final auth = ref.watch(authControllerProvider);
              return auth.maybeWhen(
                orElse: () => _SettingsListTile(
                  leadingIcon: Icons.logout_outlined,
                  label: context.l10n.settingsLogout,
                  foregroundColor: context.colorScheme.error,
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
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.leadingIcon,
    required this.label,
    this.foregroundColor,
    this.onTap,
  });

  final IconData leadingIcon;
  final String label;
  final VoidCallback? onTap;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(label),
      onTap: onTap,
      iconColor: foregroundColor,
      textColor: foregroundColor,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
