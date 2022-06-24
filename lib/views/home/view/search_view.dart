import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w * 0.05),
            child: SizedBox(
              height: context.h * 0.1,
              width: context.w,
              child: Row(
                children: [
                  InkWell(onTap: () => NavigationService.instance.pop(),child: IconConst.leftarrow),
                  const Spacer(),
                  SizedBox(width: context.w * 0.8,height: context.h * 0.05,child: CupertinoSearchTextField(decoration: AllStyles.instance.searchFieldStyle,))
                ],
              ),
            ),
          ),
          Column(
            children: [
              
            ],
          )
        ],
      )),
    );
  }
}
