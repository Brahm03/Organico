import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';
import 'package:organic/widgets/textformfield.dart';

class CustomerServiceView extends StatelessWidget {
  final BuildContext forcontext;
  const CustomerServiceView({Key? key, required this.forcontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customerScaffold(forcontext);
  }

  Scaffold customerScaffold(BuildContext context) {
    var data = context.watch<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Customer Service",
              onpressed: (){},
            ),
            Expanded(
              child: Padding(
                padding: PMconst.small,
                child: Column(
                  children: [
                    Container(
                      height: context.h * 0.1,
                      alignment: Alignment.center,
                      decoration: AllStyles.instance.productStyel(color: ColorConst.profilemaincolor),
                      child: ProfileListTileWidget(
                        title: "Jane",
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/chatimage.png'),
                        ),
                        trailing: IconConst.callgreen,
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
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            const Expanded(
              child: TextformFieldWidgets(
                  hintText: "Type a message"),
            ),
            IconButton(
              onPressed: () {},
              icon: IconConst.sendmessage,
              iconSize: 50,
            )
          ],
        ),
      ),
    );
  }
}
