import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/categories_widget.dart';
import 'package:organic/widgets/coupon_list_tile.dart';
import 'package:organic/widgets/productbigwidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your Lacation',
                style: FontStyles.headline6sdarkgrey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bandung, Cimahi',
                    style: FontStyles.headline6sbold,
                  ),
                  SizedBox(width: context.w * 0.01),
                  IconConst.dawnarrow
                ],
              ),
              Padding(
                padding: PMconst.medium,
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      onTap: () => NavigationService.instance.pushNamed(routeName: '/search_view', args: context),
                      decoration: AllStyles.instance.searchFieldStyle,
                    ),
                    SizedBox(height: context.h * 0.03),
                    CouponListTileWidget(
                        trailing: IconConst.rightarrow,
                        leadingColor: ColorConst.whiteGreen,
                        title: 'You have 3 cupon',
                        subtitle: 'Let’s use this coupon'),
                    SizedBox(height: context.h * 0.03),
                    Row(
                      children: [
                        const Text(
                          'Choose Category',
                          style: FontStyles.headline6sbold,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              'See all',
                              style: FontStyles.headline6sdarkgrey,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: context.h * 0.17,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              context.watch<HomeCubit>().categoriesList.length,
                          itemBuilder: (_, __) {
                            return CategoriesWidget(index: __);
                          }),
                    ),
                    SizedBox(height: context.h * 0.05),
                    Row(
                      children: [
                        const Text(
                          'Best selling',
                          style: FontStyles.headline6sbold,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              'See all',
                              style: FontStyles.headline6sdarkgrey,
                            ))
                      ],
                    ),
                    SizedBox(height: context.h * 0.005),
                    SizedBox(
                      height: context.h * 0.28,
                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: DataService.instance.alldata[1].length,itemBuilder: (_, __) {
                        return InkWell(onTap: () => NavigationService.instance.pushNamed(routeName: '/info_view', args: DataService.instance.alldata[1][__]),child: ProductBigWidget(height: context.h * 0.1,index: __, color: context.watch<HomeCubit>().colorList[__]));
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
