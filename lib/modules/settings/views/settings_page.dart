import 'package:evlve/app/app.dart';
import 'package:evlve/app/router/router.routes.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  String _buildRoute(String route) {
    return p.join(Routes.schedule, Routes.settings, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(
            title: Text(context.l10n.settings),
          )
        ],
        body: ListView(
          children: [
            _SettingsItem(
              leadingIcon: Icons.person_outline,
              label: context.l10n.settingsAccount,
              onTap: () => context.go(_buildRoute(Routes.accountSettings)),
            ),
            _SettingsItem(
              leadingIcon: Icons.notifications_outlined,
              label: context.l10n.settingsNotifications,
              onTap: () => context.go(_buildRoute(Routes.notification)),
            ),
            _SettingsItem(
              leadingIcon: Icons.qr_code_outlined,
              label: context.l10n.settingsQRCode,
              onTap: () => context.go(_buildRoute(Routes.qr)),
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
    return NeuButton(
      onPressed: onTap == null ? null : () {},
      margin: const EdgeInsets.all(8),
      color: backgroundColor ?? context.colorScheme.surfaceVariant,
      child: ListTile(
        leading: Icon(leadingIcon),
        title: Text(label),
        onTap: onTap,
        iconColor: foregroundColor ?? context.colorScheme.onSurfaceVariant,
        textColor: foregroundColor ?? context.colorScheme.onSurfaceVariant,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
