import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/views/home/state/homeState.dart';
import 'package:organic/widgets/navigationbar.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: scafold());
  }

  Scaffold scafold() {
    return Scaffold(
      bottomNavigationBar: const NavigationbarWidget(),
      body: BlocBuilder<HomeCubit, MainState>(builder: (context, state) {
        if (state is HomeState) {
          return const Center(
            child: Text('Home'),
          );
        } else if (state is Explorestate) {
          return const Center(
            child: Text('Explore'),
          );
        } else if (state is CartState) {
          return const Center(
            child: Text('Cart'),
          );
        } else if (state is ProfileState) {
          return const Center(
            child: Text('Profile'),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
