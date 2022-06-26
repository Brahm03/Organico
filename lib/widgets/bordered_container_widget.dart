import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';

class BorderedContainerWidget extends StatelessWidget {
  final Widget containerChild;
  final double? height;
  const BorderedContainerWidget(
      {Key? key, required this.containerChild, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: PMconst.small,
        height: height,
        decoration: AllStyles.instance.productStyel(
          color: Colors.transparent,
          borderColor: ColorConst.whitePink,
        ),
        child: containerChild);
  }
}
