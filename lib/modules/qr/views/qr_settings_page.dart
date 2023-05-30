import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRSettingsPage extends StatelessWidget {
  const QRSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsQRCode),
        actions: const [_ResetButton()],
      ),
      body: const _QRSettings(),
    );
  }
}

class _ResetButton extends ConsumerWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDefault = ref.watch(
      qRSettingControllerProvider.select((value) => value == const QRModel()),
    );
    return TextButton(
      onPressed: isDefault
          ? null
          : ref.read(qRSettingControllerProvider.notifier).reset,
      child: Text(context.l10n.settingsQRReset),
    );
  }
}

class _QRSettings extends ConsumerWidget {
  const _QRSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrSetting = ref.watch(qRSettingControllerProvider);

    return SliderTheme(
      data: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Center(
                  child: SizedBox.square(
                    dimension: 200,
                    child: QRCode(imageDimension: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(context.l10n.settingsQREyeShape),
                ),
                for (final eyeShape in QrEyeShape.values)
                  RadioListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: eyeShape,
                    groupValue: qrSetting.eyeShape,
                    title: Text(
                      eyeShape.name[0].toUpperCase() +
                          eyeShape.name.substring(1),
                    ),
                    onChanged: ref
                        .read(qRSettingControllerProvider.notifier)
                        .onEyeShapeChanged,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(context.l10n.settingsQRDataShape),
                ),
                for (final dataShape in QrDataModuleShape.values)
                  RadioListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: dataShape,
                    groupValue: qrSetting.dataModuleShape,
                    title: Text(
                      dataShape.name[0].toUpperCase() +
                          dataShape.name.substring(1),
                    ),
                    onChanged: ref
                        .read(qRSettingControllerProvider.notifier)
                        .onDataShapeChanged,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.settingsShakeCount),
                      Text('${qrSetting.shakeCount}')
                    ],
                  ),
                ),
                Slider(
                  min: QRModel.minShakeCount.toDouble(),
                  max: QRModel.maxShakeCount.toDouble(),
                  divisions: QRModel.maxShakeCount - QRModel.minShakeCount,
                  label: qrSetting.shakeCount.toString(),
                  value: qrSetting.shakeCount.toDouble(),
                  onChanged: ref
                      .read(qRSettingControllerProvider.notifier)
                      .onShakeCountChanged,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.settingsQRShakeThreshold),
                      Text(qrSetting.shakeThresholdForce.toStringAsFixed(1))
                    ],
                  ),
                ),
                Slider(
                  min: QRModel.minShakeThresholdForce,
                  max: QRModel.maxShakeThresholdForce,
                  label: qrSetting.shakeThresholdForce.toStringAsFixed(1),
                  value: qrSetting.shakeThresholdForce,
                  onChanged: ref
                      .read(qRSettingControllerProvider.notifier)
                      .onShakeThresholdForceChange,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.settingsQRDebounceDuration),
                      Text('${qrSetting.debounce.inMilliseconds}ms')
                    ],
                  ),
                ),
                Slider(
                  min: QRModel.minDebounce.inMilliseconds.toDouble(),
                  max: QRModel.maxDebounce.inMilliseconds.toDouble(),
                  label: '${qrSetting.debounce.inMilliseconds}ms',
                  value: qrSetting.debounce.inMilliseconds.toDouble(),
                  onChanged: ref
                      .read(qRSettingControllerProvider.notifier)
                      .onDebounceChanged,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.settingsShakeCountResetDuration),
                      Text(
                        '''
${(qrSetting.shakeCountReset.inMilliseconds / 1000).toStringAsFixed(2)}s''',
                      )
                    ],
                  ),
                ),
                Slider(
                  min: QRModel.minShakeCountReset.inMilliseconds.toDouble(),
                  max: QRModel.maxShakeCountReset.inMilliseconds.toDouble(),
                  label: '''
${(qrSetting.shakeCountReset.inMilliseconds / 1000).toStringAsFixed(2)}s''',
                  value: qrSetting.shakeCountReset.inMilliseconds.toDouble(),
                  onChanged: ref
                      .read(qRSettingControllerProvider.notifier)
                      .onShakeCountResetChanged,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: context.pop,
                    child: Text(context.l10n.settingsQRCancel),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(child: _SaveButton()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SaveButton extends ConsumerStatefulWidget {
  const _SaveButton();

  @override
  ConsumerState<_SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends ConsumerState<_SaveButton> {
  bool _debounce = false;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _debounce
          ? null
          : () async {
              setState(() => _debounce = true);
              await ref
                  .read(qRSettingControllerProvider.notifier)
                  .applySettings();
              ref.invalidate(qRControllerProvider);
              setState(() => _debounce = false);

              if (context.mounted) {
                context.pop();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.settingsQRSaveSnackBar),
                    ),
                  );
              }
            },
      child: _debounce
          ? const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(),
            )
          : Text(context.l10n.settingsQRSave),
    );
  }
}
