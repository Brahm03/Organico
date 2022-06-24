import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
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
                        name: DataService.instance.alldata[0][__]['name'].toString(),
                        market: DataService.instance.alldata[0][__]['market'].toString(),
                        image_url: DataService.instance.alldata[0][__]['image_url'].toString(),
                        cost: DataService.instance.alldata[0][__]['cost'].toString(),
                        height: context.h * 0.15,
                        index: __, color: context.watch<HomeCubit>().colorList[__]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
