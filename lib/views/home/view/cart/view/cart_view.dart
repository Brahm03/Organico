import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = DataService.instance.alldata;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(onpressed: (){}, text: 'My cart', showbutton: false,),
            SizedBox(height: context.h * 0.04),
            Padding(
              padding: PMconst.extraSmall,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                decoration: AllStyles.instance.productStyel(borderColor: ColorConst.darkGrey,color: Colors.transparent),
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
                    Container(
                      padding: PMconst.small,
                      decoration: AllStyles.instance.productStyel(color: ColorConst.whiteGreen),
                      child: Row(
                        children: [
                          Image.asset('assets/images/broccoli.png', width: 80),
                          SizedBox(width: context.w * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[0][2]['name'],
                                  style: FontStyles.headline5sbold),
                              Text("${data[0][2]['howmuch']} Kilogram",
                                  style: FontStyles.headline5sbold),
                              Text("\$ ${data[0][2]['cost']}",
                                  style: FontStyles.headline6sbold),
                            ],
                          ),
                          SizedBox(width: context.w * 0.07),
                          SizedBox(
                            width: context.w * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(splashRadius: RadiuConst.small,onPressed: (){},icon: IconConst.minus),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "1",
                                        style: FontStyles.headline5sbold,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(splashRadius: RadiuConst.small,onPressed: (){},icon: IconConst.plus),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: PMconst.small,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: context.h * 0.06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total", style: FontStyles.headline6sbold),
                      Text("\$${data[0][2]['cost']}", style: FontStyles.headline6sbold)
                    ],
                  ),
                ),
                ButtonWidgets(width: context.w * 0.8,text: 'Add to bag', onPressed: () => NavigationService.instance.pushNamed(routeName: '/bag_view', args: context)),
              ],
            ),
            SizedBox(height: context.h * 0.01)

          ],
        ),
        
      ),
    );
  }
}
