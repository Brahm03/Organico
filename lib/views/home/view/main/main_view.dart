import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/views/home/state/homeState.dart';
import 'package:organic/views/home/view/cart/view/cart_view.dart';
import 'package:organic/views/home/view/explore/explore_view.dart';
import 'package:organic/views/home/view/home_view.dart';
import 'package:organic/views/profile/profilemainview/profile_view.dart';
import 'package:organic/widgets/navigationbar.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: scafold());
  }

  Scaffold scafold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const NavigationbarWidget(),
      body: BlocBuilder<HomeCubit, MainState>(builder: (context, state) {
        if (state is HomeState) {
          return const HomeView();
        } else if (state is Explorestate) {
          return const ExploreView();
        } else if (state is CartState) {
          return const CartView();
        } else if (state is ProfileState) {
          return ProfileView();
        } else {
          return Container();
        }
      }),
    );
  }
}
