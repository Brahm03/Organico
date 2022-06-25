import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';

import '../../../widgets/appbar.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "My Address",
              onpressed: (){},
            ),
            Padding(
              padding: PMconst.medium,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                decoration: AllStyles.instance.productStyel(color: ColorConst.dark),
                child: ProfileListTileWidget(
                    title: "Home",
                    subtitle: const Text("3517 W. Gray St. Utica, Pennsylvania 57867"),
                    trailing: IconConst.rightarrow),
              ),
            ),
            Padding(
              padding: PMconst.medium,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                decoration: AllStyles.instance.productStyel(color: ColorConst.green),
                child: ProfileListTileWidget(
                    title: "Work",
                    subtitle: const Text("2715 Ash Dr. San Jose, South Dakota 83475"),
                    trailing: IconConst.rightarrow),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonWidgets(text: 'text', onPressed: (){}),
    );
  }
}