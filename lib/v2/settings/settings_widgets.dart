import 'package:aipictors/v2/core/design.dart';
import 'package:flutter/material.dart';

/// 設定のまとまり（見出しと角丸のカード）
class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key, this.title, required this.children, this.footer});

  final String? title;
  final List<Widget> children;
  final String? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: Ds.s4, bottom: Ds.s8),
            child: Text(title!, style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
          ),
        Container(
          decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            for (var i = 0; i < children.length; i++) ...[
              children[i],
              if (i != children.length - 1) Divider(height: 1, indent: Ds.s16, color: context.hairline),
            ],
          ]),
        ),
        if (footer != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s4, Ds.s8, Ds.s4, 0),
            child: Text(footer!, style: TextStyle(color: context.muted, fontSize: 12, height: 1.45)),
          ),
      ]),
    );
  }
}

/// 押すと次の画面へ行く行
class SettingsLink extends StatelessWidget {
  const SettingsLink({super.key, required this.icon, required this.label, required this.onTap, this.trailing, this.destructive = false});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? trailing;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final color = destructive ? context.cs.error : null;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: color)),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (trailing != null) Text(trailing!, style: TextStyle(color: context.muted, fontSize: 13)),
        Icon(Icons.chevron_right_rounded, color: context.muted),
      ]),
      onTap: () {
        Ds.tap();
        onTap();
      },
    );
  }
}

/// スイッチの行。保存中は押せない
class SettingsSwitch extends StatelessWidget {
  const SettingsSwitch({super.key, required this.label, required this.value, required this.onChanged, this.subtitle});

  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      subtitle: subtitle == null ? null : Text(subtitle!, style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.4)),
      value: value,
      onChanged: onChanged,
    );
  }
}

InputDecoration settingsField(BuildContext context, String label, {String? hint, String? prefix}) => InputDecoration(
      labelText: label,
      hintText: hint,
      prefixText: prefix,
      filled: true,
      fillColor: context.surfaceCard,
      border: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide(color: context.hairline)),
      enabledBorder: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide(color: context.hairline)),
    );
