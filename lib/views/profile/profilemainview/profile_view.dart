import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitData = context.watch<HomeCubit>();
    var cubitDataFunction = context.read<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
                text: "Profile",
                trailing: IconButton(
                    onPressed: () {
                      NavigationService.instance
                          .pushNamed(routeName: '/notificationview');
                    },
                    icon: IconConst.notification)),
            SizedBox(height: context.h * 0.01),
            const CircleAvatar(
              radius: 70,
              foregroundImage: AssetImage('assets/images/Avatar.png'),
            ),
            SizedBox(height: context.h * 0.01),
            const Text("Jane Doe", style: FStyles.headline4sbold),
            const Text("(307) 555-0133", style: FStyles.headline5main),
            SizedBox(height: context.h * 0.04),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cubitData.titleList.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    child: ProfileListTileWidget(
                      leading: Container(
                        width: context.w * 0.10,
                        height: context.w * 0.10,
                        padding: PMconst.extraSmall,
                        child: cubitData.profileIconList[i],
                        decoration: BoxOnlyDecoration.decor(
                            ColorConst.profilemaincolor,
                            bottomLeft: 10.0,
                            bottomRight: 10.0,
                            topLeft: 10.0,
                            topRight: 10.0),
                      ),
                      title: cubitData.titleList[i],
                    ),
                    onTap: () {
                      if (i == 0) {
                        NavigationService.instance
                            .pushNamed(routeName: '/editprofileview', args: context);
                      } else
                      if (i == 3) {
                        NavigationService.instance
                            .pushNamed(routeName: '/addressview');
                      } else if (i == 4) {
                        NavigationService.instance
                            .pushNamed(routeName: '/paymentmethodview', args: context);
                      } else if (i == 5) {
                        NavigationService.instance.pushNamed(
                            routeName: '/customerserviceview', args: context);
                      }
                       else if (i == 6) {
                        NavigationService.instance.pushNamed(
                            routeName: '/changepasswordview', args: context);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
