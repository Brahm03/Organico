import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

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
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: IconConst.leftarrow),
            ),
            Expanded(
              child: Padding(
                padding: PMconst.small,
                child: Column(
                  children: [
                    Container(
                      height: context.h * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxAllDecoration.decor(ColorConst.whiteGreen),
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
            Expanded(
              child: MyTextField.textField(
                  text: "Type a message", controller: data.messageController),
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
