import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';

class CouponListTileWidget extends StatelessWidget {
  final Color leadingColor;
  final Color? listTileColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CouponListTileWidget({
    Key? key,
    required this.leadingColor,
    this.listTileColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        leading: Container(
          width: context.w * 0.12,
          height: context.w * 0.12,
          padding: PMconst.extraSmall,
          // decoration: AllStyles.instance.productStyel(color: listTileColor!),
          child: IconConst.cupon,),
        title: Text(title, style: FontStyles.headline4sbold),
        subtitle: Text(subtitle, style: FontStyles.headline6sdarkgrey),
        trailing: trailing);
  }
}
