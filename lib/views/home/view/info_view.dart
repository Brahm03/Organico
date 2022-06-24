import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:readmore/readmore.dart';

class InfoView extends StatelessWidget {
  final Map product;
  const InfoView({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidgets(height: context.h * 0.06,width: context.w * 0.8,text: 'Add to cart', onPressed: (){}),
              SizedBox(width: context.w * 0.03,),
              IconConst.message
            ],
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              onpressed: () => NavigationService.instance.pop(),
              trailing: IconConst.heart,
            ),
            SizedBox(
              height: context.h * 0.873,
              child: Padding(
                padding: PMconst.small,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: context.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: context.h * 0.25,
                                  width: context.w * 0.7,
                                  child: Image.asset(
                                    product['image_url'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                product['name'],
                                style: FontStyles.headline4sbold,
                              ),
                              Row(
                                children: [
                                  Text(
                                    product['market'],
                                    style: FontStyles.headline6sdarkgrey,
                                  ),
                                  const Spacer(),
                                  IconConst.minus,
                                  SizedBox(
                                      width: context.w * 0.1,
                                      child: const Center(
                                          child: Text(
                                        '14',
                                        style: FontStyles.headline4sbold,
                                      ))),
                                  IconConst.plus
                                ],
                              ),
                              Text(
                                '${product['cost']} / Kg',
                                style: FontStyles.headline5sbold,
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 6,
                        child: SizedBox(
                          width: context.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Details',
                                style: FontStyles.headline5sbold,
                              ),
                              SizedBox(height: context.h * 0.02),
                              ReadMoreText(
                                product['details'],
                                style: FontStyles.headline6sdarkgrey,
                                trimLines: 3,
                                colorClickableText: ColorConst.dark,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: FontStyles.headline6sbold,
                                lessStyle: FontStyles.headline6sbold,
                              ),
                              SizedBox(height: context.h * 0.02,),
                               ListTile(leading: IconConst.time, title: const Text('Time Delivery', style: FontStyles.headline5sbold,), subtitle: const Text('35 - 40 minut', style: FontStyles.headline6sgrey,),),
                              SizedBox(height: context.h * 0.02,),
                               ListTile(leading: IconConst.category,title: const Text('Category', style: FontStyles.headline5sbold,), subtitle: Text(product['category'], style: FontStyles.headline6sgrey,),),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
