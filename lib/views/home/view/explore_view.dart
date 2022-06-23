import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/productbigwidget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarWidget(
              trailing: IconButton(
                icon: IconConst.filter,
                onPressed: () {},
              ),
              onpressed: () {},
              text: 'Explore',
              showbutton: false,
            ),
            Container(
              padding: PMconst.medium,
              height: context.h * 0.774,
              child: GridView.builder(
                itemCount: DataService.instance.alldata[0].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: context.h * 0.05,mainAxisExtent: context.h * 0.35),
                  itemBuilder: (_, __) {
                    return ProductBigWidget(
                        height: context.h * 0.15,
                        index: __, color: ColorConst.whitePink);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
