import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';

class CuponListTileWidget extends StatelessWidget {
  final Color leadingColor;
  final Color listTileColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CuponListTileWidget({
    Key? key,
    required this.leadingColor,
    this.listTileColor = CupertinoColors.white,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AllStyles.instance
          .productStyel(color: listTileColor, borderradius: RadiuConst.small),
      child: ListTile(
          onTap: onTap,
          leading: Container(
            width: context.w * 0.12,
            height: context.w * 0.12,
            padding: PMconst.extraSmall,
            child: IconConst.cupon,
          ),
          title: subtitle == '' ? Align(alignment: Alignment.centerLeft,child: Text(title, style: FontStyles.headline4sbold)) : Text(title, style: FontStyles.headline4sbold),
          subtitle: subtitle != '' ? Text(subtitle, style: FontStyles.headline6sdarkgrey) : SizedBox(),
          trailing: trailing),
    );
  }
}
