import 'package:flutter/cupertino.dart';
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
import 'package:organic/widgets/productbigwidget.dart';

class SearchView extends StatelessWidget {
  final BuildContext newcontext;
  const SearchView({required this.newcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: scafold(newcontext));
  }

  Scaffold scafold(BuildContext newcontext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: newcontext.w * 0.05),
                child: SizedBox(
                  height: newcontext.h * 0.1,
                  width: newcontext.w,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () => NavigationService.instance.pop(),
                          child: IconConst.leftarrow),
                      const Spacer(),
                      SizedBox(
                          width: newcontext.w * 0.8,
                          height: newcontext.h * 0.05,
                          child: CupertinoSearchTextField(
                            onChanged: (text) =>
                                newcontext.read<HomeCubit>().search(text),
                            decoration: AllStyles.instance.searchFieldStyle,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: PMconst.medium,
                child: SizedBox(
                  height: newcontext.h * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recents',
                          style: FontStyles.headline5sbold,
                        ),
                        SizedBox(height: newcontext.h * 0.01),
                        SizedBox(
                          height: newcontext.h * 0.3,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (_, __) {
                                return ListTile(
                                  trailing: IconConst.x,
                                  leading: IconConst.search,
                                  title: Text(
                                    newcontext
                                        .watch<HomeCubit>()
                                        .mostSearched[__]
                                        .toString(),
                                    style: FontStyles.headline6sdarkgrey,
                                  ),
                                );
                              }),
                        ),
                        const Text(
                          'Popular',
                          style: FontStyles.headline5sbold,
                        ),
                        SizedBox(height: newcontext.h * 0.01),
                        SizedBox(
                          height: newcontext.h,
                          width: newcontext.w,
                          child: GridView.builder(
                              itemCount: newcontext
                                  .watch<HomeCubit>()
                                  .searchedItems
                                  .length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: newcontext.h * 0.05,
                                      mainAxisExtent: newcontext.h * 0.35),
                              itemBuilder: (_, __) {
                                return ProductBigWidget(
                                    market: newcontext
                                        .watch<HomeCubit>()
                                        .searchedItems
                                        .toList()[__]['market']
                                        .toString(),
                                    image_url: newcontext
                                        .watch<HomeCubit>()
                                        .searchedItems
                                        .toList()[__]['image_url']
                                        .toString(),
                                    cost: newcontext
                                        .watch<HomeCubit>()
                                        .searchedItems
                                        .toList()[__]['cost']
                                        .toString(),
                                    name: newcontext
                                        .watch<HomeCubit>()
                                        .searchedItems
                                        .toList()[__]['name']
                                        .toString(),
                                    height: newcontext.h * 0.15,
                                    index: __,
                                    color: newcontext
                                        .watch<HomeCubit>()
                                        .colorList[__]);
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
