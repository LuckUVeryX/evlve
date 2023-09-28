import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/tester/tester.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountSettingsPage extends ConsumerWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: CheckboxTheme(
        data: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return context.colorScheme.primary;
            }
            return context.colorScheme.onBackground;
          }),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: GestureDetector(
                onDoubleTap: () async {
                  await ref.read(overrideTesterProvider.future);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('Disabled Tester Mode')),
                      );
                  }
                },
                child: Text(context.l10n.settingsAccount),
              ),
            ),
            _AccountTextField(
              initialValue: user.id,
              labelText: context.l10n.settingsAccountId,
            ),
            _AccountTextField(
              initialValue: user.title,
              labelText: context.l10n.settingsAccountTitle,
            ),
            _AccountTextField(
              initialValue: user.firstName,
              labelText: context.l10n.settingsAccountFirstName,
            ),
            _AccountTextField(
              initialValue: user.lastName,
              labelText: context.l10n.settingsAccountLastName,
            ),
            _AccountTextField(
              initialValue: user.email,
              labelText: context.l10n.settingsAccountEmail,
            ),
            _AccountTextField(
              initialValue: user.mobile,
              labelText: context.l10n.settingsAccountMobile,
            ),
            _AccountTextField(
              initialValue: user.defaultLocation.key,
              labelText: context.l10n.settingsAccountDefaultLocation,
            ),
            _AccountTextField(
              initialValue: user.facilities.map((e) => e.key.key).toString(),
              labelText: context.l10n.settingsAccountFacilities,
            ),
            _AccountTextField(
              initialValue: user.program,
              labelText: context.l10n.settingsAccountProgram,
            ),
            _AccountTextField(
              initialValue: user.renewalType,
              labelText: context.l10n.settingsAccountRenewalType,
            ),
            _AccountTextField(
              initialValue: user.vaccinationStatus,
              labelText: context.l10n.settingsAccountVaccinationStatus,
            ),
            _AccountTextField(
              initialValue: user.mfaMethod,
              labelText: context.l10n.settingsAccountMFAMethod,
            ),
            _AccountTextField(
              initialValue: user.waitlistNotificationMethod,
              labelText: context.l10n.settingsAccountWaitlistNotificationMethod,
            ),
            _AccountCheckboxListTile(
              value: user.autoBook,
              title: Text(
                context.l10n.settingsAccountAutoBook,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
            _AccountCheckboxListTile(
              value: user.addBuddy,
              title: Text(
                context.l10n.settingsAccountAddBuddy,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
            _AccountCheckboxListTile(
              value: user.isEmployee,
              title: Text(
                context.l10n.settingsAccountIsEmployee,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
            _AccountCheckboxListTile(
              value: user.accessToRegularClasses,
              title: Text(
                context.l10n.settingsAccountAccessToRegularClasses,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
            _AccountCheckboxListTile(
              value: user.hasActiveTEAP,
              title: Text(
                context.l10n.settingsAccountHasActiveTEAP,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
            _AccountCheckboxListTile(
              value: user.isActiveGeneralMembership,
              title: Text(
                context.l10n.settingsAccountIsActveGeneralMembership,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountCheckboxListTile extends StatelessWidget {
  const _AccountCheckboxListTile({
    this.value,
    this.title,
  });

  final bool? value;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NeuContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: context.colorScheme.surfaceVariant,
        child: CheckboxListTile(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled) &&
                !states.contains(MaterialState.selected)) {
              return context.colorScheme.surfaceVariant;
            }
            return null;
          }),
          value: value,
          onChanged: (_) {},
          enabled: false,
          title: title,
        ),
      ),
    );
  }
}

class _AccountTextField extends StatelessWidget {
  const _AccountTextField({
    required this.initialValue,
    required this.labelText,
  });

  final String? initialValue;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NeuContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextFormField(
          readOnly: true,
          initialValue: initialValue,
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
