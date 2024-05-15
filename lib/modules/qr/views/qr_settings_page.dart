import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QRSettingsPage extends StatelessWidget {
  const QRSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.large(
            title: Text(context.l10n.settingsQRCode),
            actions: const [_ResetButton()],
          ),
        ],
        body: const SafeArea(child: _QRSettings()),
      ),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: FilledButton.tonal(
          onPressed: isDefault
              ? null
              : ref.read(qRSettingControllerProvider.notifier).reset,
          child: Text(context.l10n.settingsQRReset),
        ),
      ),
    );
  }
}

class _QRSettings extends ConsumerWidget {
  const _QRSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrSetting = ref.watch(qRSettingControllerProvider);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const Center(
                child: NeuContainer(
                  height: 200,
                  width: 200,
                  child: QRCode(imageDimension: 24),
                ),
              ),
              const SizedBox.square(dimension: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.settingsShakeCount),
                    Text('${qrSetting.shakeCount}'),
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
                    Text(qrSetting.shakeThresholdForce.toStringAsFixed(1)),
                  ],
                ),
              ),
              Slider(
                min: QRModel.minShakeThresholdForce,
                max: QRModel.maxShakeThresholdForce,
                divisions: (QRModel.maxShakeThresholdForce -
                        QRModel.minShakeThresholdForce) ~/
                    0.1,
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
                    Text('${qrSetting.debounce.inMilliseconds}ms'),
                  ],
                ),
              ),
              Slider(
                min: QRModel.minDebounce.inMilliseconds.toDouble(),
                max: QRModel.maxDebounce.inMilliseconds.toDouble(),
                divisions: (QRModel.maxDebounce - QRModel.minDebounce)
                        .inMilliseconds ~/
                    const Duration(milliseconds: 50).inMilliseconds,
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
                    ),
                  ],
                ),
              ),
              Slider(
                min: QRModel.minShakeCountReset.inMilliseconds.toDouble(),
                max: QRModel.maxShakeCountReset.inMilliseconds.toDouble(),
                divisions:
                    (QRModel.maxShakeCountReset - QRModel.minShakeCountReset)
                            .inMilliseconds ~/
                        const Duration(milliseconds: 500).inMilliseconds,
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
                child: NeuTextButton(
                  label: context.l10n.settingsQRCancel,
                  backgroundColor: context.colorScheme.surface,
                  foregroundColor: context.colorScheme.onSurface,
                  onPressed: context.pop,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(child: _SaveButton()),
            ],
          ),
        ),
      ],
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
    return NeuTextButton(
      onPressed: _debounce
          ? null
          : () async {
              setState(() => _debounce = true);
              await ref
                  .read(qRSettingControllerProvider.notifier)
                  .applySettings();
              ref
                  .read(qRControllerProvider.notifier)
                  .onQrChanged(ref.read(qRSettingControllerProvider));
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
      label: context.l10n.settingsQRSave,
    );
  }
}
