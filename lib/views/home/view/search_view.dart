import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

class SearchView extends StatelessWidget {
  final BuildContext newcontext;
  const SearchView({required this.newcontext,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(),child: scafold(newcontext));
  }

  Scaffold scafold(BuildContext newcontext) {
    return Scaffold(
    body: SafeArea(
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
                      decoration: AllStyles.instance.searchFieldStyle,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: PMconst.medium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recents',
                style: FontStyles.headline5sbold,
              ),
              SizedBox(
                height: newcontext.h * 0.3,
                child: ListView.builder(itemCount: 4,itemBuilder: (_, __) {
                  return ListTile(
                    leading: IconConst.search,
                    title: Text(newcontext.watch<HomeCubit>().mostSearched[__].toString(), style: FontStyles.headline6sdarkgrey,),
                  );
                }),
              )
            ],
          ),
        )
      ],
    )),
  );
  }
}
