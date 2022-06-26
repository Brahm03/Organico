import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/cart_view_widget.dart';
import 'package:organic/widgets/coupon_list_tile.dart';
import 'package:organic/widgets/textformfield.dart';

class BagView extends StatelessWidget {
  final BuildContext newcontext;
  const BagView({required this.newcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(newcontext);
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidgets(onPressed: () => NavigationService.instance.pushNamed(routeName: '/order_view'), text: 'Order now',),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () => NavigationService.instance.pop(),
              text: 'My bag',
            ),
            SizedBox(height: newcontext.h * 0.01),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: PMconst.extraSmall,
                      child: Container(
                        width: newcontext.w,
                        padding: PMconst.small,
                        decoration: AllStyles.instance
                            .productStyel(color: Colors.transparent),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: ColorConst.grey,
                                child: IconConst.home,
                              ),
                              title: const Text(
                                "Popey Shop - New York",
                                style: FontStyles.headline5sbold,
                              ),
                            ),
                            CartWidget(
                              index: 3,
                              newcontext: context,
                            ),
                            CartWidget(newcontext: newcontext, index: 5),
                            ButtonWidgets(
                              styles: FontStyles.headline4sboldred,
                              text: 'Add more',
                              onPressed: () {},
                              backGroundColor: ColorConst.white,
                              bordercolor: ColorConst.kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: PMconst.medium,
                      child: SizedBox(
                        height: context.h * 1 + 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              style: FontStyles.headline5sbold,
                            ),
                            TextformFieldWidgets(
                              suffixIcon: IconButton(
                                icon: IconConst.pencil,
                                onPressed: () {},
                              ),
                              hintText:
                                  '3517 W. Gray St. Utica, Pennsylvania 57867',
                              maxlines: 5,
                            ),
                            const Text(
                              'Note',
                              style: FontStyles.headline5sbold,
                            ),
                            const TextformFieldWidgets(
                              hintText:
                                  'Please check the product before packaging.',
                              maxlines: 5,
                            ),
                            const Text(
                              'Card',
                              style: FontStyles.headline5sbold,
                            ),
                            const CuponListTileWidget(
                                leadingColor: ColorConst.white,
                                title: 'Free shipping',
                                subtitle: ''),
                            const Text(
                              'Payment method',
                              style: FontStyles.headline5sbold,
                            ),
                            const CuponListTileWidget(
                                leadingColor: ColorConst.white,
                                title: 'Edit card',
                                subtitle: ''),
                            SizedBox(
                              height: context.h * 0.3,
                              child: ListView.builder(physics: const NeverScrollableScrollPhysics(),itemCount: newcontext.watch<HomeCubit>().baginfo.length,itemBuilder: (_, __) {
                                return ListTile(title: Text(newcontext.watch<HomeCubit>().baginfo[__], style: __ == 3 ? FontStyles.headline5sbold : FontStyles.headline5sdarkgrey,), trailing: Text(newcontext.watch<HomeCubit>().baginfoprice[__], style: __ == 3 ? FontStyles.headline5sbold : FontStyles.headline6s,),);
                              }),
                            ),
                            SizedBox(height: context.h * 0.05,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
