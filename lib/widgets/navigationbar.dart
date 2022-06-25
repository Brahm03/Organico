import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

class NavigationbarWidget extends StatelessWidget {
  const NavigationbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
        activeColor: HomeCubit.dark ? ColorConst.white : ColorConst.dark,
        currentIndex: context.watch<HomeCubit>().currentIndex,
        onTap: (v) => context.read<HomeCubit>().onStateChange(v),
        items: [
          BottomNavigationBarItem(icon: IconConst.home, label: 'Home',),
          BottomNavigationBarItem(icon: IconConst.search, label: 'Explore'),
          BottomNavigationBarItem(icon: IconConst.cart, label: 'Cart'),
          BottomNavigationBarItem(icon: IconConst.profile, label: 'Profile'),
        ]);
  }
}
