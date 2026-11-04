import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

const _maxLength = 60;

/// 期限の選択肢（分）。null は自動で消さない
const _expiryOptions = <(int?, String)>[
  (30, '30分'),
  (60, '1時間'),
  (240, '4時間'),
  (1440, '24時間'),
  (4320, '3日'),
  (10080, '7日'),
  (null, '消さない'),
];

/// 今の期限を残す選択
const _keepExpiry = -1;

/// ステータス（吹き出し）を設定するシート。変えたら true を返す
Future<bool> showStatusSheet(BuildContext context) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Ds.r28)),
    builder: (_) => const _StatusSheet(),
  );
  return result ?? false;
}

class _StatusSheet extends StatefulWidget {
  const _StatusSheet();

  @override
  State<_StatusSheet> createState() => _StatusSheetState();
}

class _StatusSheetState extends State<_StatusSheet> {
  final _text = TextEditingController();
  bool _isVisible = true;
  int? _currentExpiresAt;
  int? _choice;
  bool _loading = true;
  bool _saving = false;
  String? _error;
  bool _hasStatus = false;

  @override
  void initState() {
    super.initState();
    _text.addListener(() => setState(() {}));
    _load();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final s = await SettingsApi.viewerStatus();
      if (!mounted) return;
      setState(() {
        _text.text = s?.str('text') ?? '';
        _isVisible = s?.boolean('isVisible', true) ?? true;
        _currentExpiresAt = s == null || s['expiresAt'] == null ? null : s.integer('expiresAt');
        _choice = _currentExpiresAt != null ? _keepExpiry : null;
        _hasStatus = _text.text.isNotEmpty;
        _loading = false;
      });
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _error = e.message;
          _loading = false;
        });
      }
    }
  }

  int? get _expiresAt {
    if (_choice == _keepExpiry) return _currentExpiresAt;
    if (_choice == null) return null;
    return DateTime.now().add(Duration(minutes: _choice!)).millisecondsSinceEpoch ~/ 1000;
  }

  Future<void> _save({bool clear = false}) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await SettingsApi.updateStatus(
        text: clear ? '' : _text.text.trim(),
        isVisible: _isVisible,
        expiresAt: clear ? null : _expiresAt,
      );
      if (!mounted) return;
      Ds.success();
      context.toast(clear ? 'ステータスを消しました' : 'ステータスを更新しました');
      Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) {
        context.toast(e.message, error: true);
        setState(() => _saving = false);
      }
    }
  }

  String _formatExpiry(int unix) {
    final d = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    String p(int n) => n.toString().padLeft(2, '0');
    return '今の期限（${d.month}/${d.day} ${p(d.hour)}:${p(d.minute)}）';
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final length = _text.text.trim().characters.length;
    return Padding(
      padding: EdgeInsets.fromLTRB(Ds.s20, Ds.s20, Ds.s20, bottom + Ds.s20),
      child: _loading
          ? const Column(mainAxisSize: MainAxisSize.min, children: [Skeleton(height: 56, radius: 14), SizedBox(height: Ds.s12), Skeleton(height: 120, radius: 14)])
          : _error != null
              ? StateView.error(_error!, onRetry: _load)
              : SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text('ステータス', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: Ds.s12),
                    TextField(
                      controller: _text,
                      autofocus: !_hasStatus,
                      maxLength: _maxLength,
                      minLines: 1,
                      maxLines: 3,
                      decoration: settingsField(context, 'いまのひとこと', hint: '例: 新作を準備中です'),
                    ),
                    const SizedBox(height: Ds.s4),
                    Text('自動で消すまでの時間', style: TextStyle(color: context.muted, fontSize: 12.5, fontWeight: FontWeight.w700)),
                    const SizedBox(height: Ds.s6),
                    Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
                      if (_currentExpiresAt != null)
                        ChoiceChip(label: Text(_formatExpiry(_currentExpiresAt!)), selected: _choice == _keepExpiry, onSelected: (_) => setState(() => _choice = _keepExpiry)),
                      for (final o in _expiryOptions)
                        ChoiceChip(label: Text(o.$2), selected: _choice == o.$1, onSelected: (_) => setState(() => _choice = o.$1)),
                    ]),
                    const SizedBox(height: Ds.s8),
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('プロフィールに表示する', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5)),
                      value: _isVisible,
                      onChanged: (v) => setState(() => _isVisible = v),
                    ),
                    const SizedBox(height: Ds.s8),
                    PrimaryButton(label: _saving ? '保存中…' : '保存', onPressed: _saving || length == 0 || length > _maxLength ? null : () => _save()),
                    if (_hasStatus) ...[
                      const SizedBox(height: Ds.s8),
                      SecondaryButton(label: '消す', onPressed: _saving ? null : () => _save(clear: true)),
                    ],
                  ]),
                ),
    );
  }
}
