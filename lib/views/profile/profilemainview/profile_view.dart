import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';

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
                trailing: InkWell(onTap: () => NavigationService.instance.pushNamed(routeName: '/notificationview'),child: IconConst.notification),
                text: "Profile",
                onpressed: (){},
            ),
            SizedBox(height: context.h * 0.01),
            const CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage('assets/images/Avatar.png'),
            ),
            SizedBox(height: context.h * 0.01),
            const Text("Jane Doe", style: FontStyles.headline4sbold),
            const Text("(307) 555-0133", style: FontStyles.headline5s),
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
                        decoration: AllStyles.instance.productStyel(borderradius: RadiuConst.small,color: ColorConst.profilemaincolor),
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
