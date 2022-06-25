import 'package:flutter/material.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
class ProfileListTileWidget extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? subtitle;
  const ProfileListTileWidget({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
    this.leading,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        leading: leading,
        title: Text(title, style: FontStyles.headline5sbold),
        subtitle: subtitle,
        trailing: trailing,

        );
  }
}


