import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/keyboard_service.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/intl_phone_field_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class EditProfileView extends StatelessWidget {
  final BuildContext forcontext;
  const EditProfileView({Key? key, required this.forcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editProfileScaffold(forcontext);
  }

  Scaffold editProfileScaffold(BuildContext context) {
    var cubitData = context.watch<HomeCubit>();
    var cubitDataFunction = context.read<HomeCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: PMconst.small,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                text: "Edit Profile",
                leading:
                    IconButton(onPressed: () {
                      NavigationService.instance.pop("");
                    }, icon: IconConst.leftarrow),
              ),
              SizedBox(height: context.h * 0.01),
              SizedBox(
                child: StatefulBuilder(
                  builder: ((context, setState) {
                    if (!KeyBoardService.instance.isKeyBoard(context)) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            SizedBox(
                              child: cubitData.image != null
                                  ? CircleAvatar(
                                      radius: context.w * 0.15,
                                      backgroundImage: FileImage(
                                        File(cubitData.image!.path),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: context.w * 0.15,
                                      backgroundImage: const AssetImage(
                                          'assets/images/Avatar.png'),
                                    ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: IconButton(
                                  color: ColorConst.white,
                                  onPressed: () {
                                    cubitDataFunction.fromGallery();
                                    setState(
                                      () {},
                                    );
                                  },
                                  icon: IconConst.camerawhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                ),
              ),
              SizedBox(height: context.h * 0.02),
              Text("Name", style: FStyles.headline4text),
              SizedBox(height: context.h * 0.01),
              MyTextField.textField(
                  text: "Your Name", controller: cubitData.nameController),
              SizedBox(height: context.h * 0.02),
              Text("Phone", style: FStyles.headline4text),
              SizedBox(height: context.h * 0.01),
              PhoneTextField.phoneField(
                  text: "Your Phone Number",
                  controller: cubitData.phoneController),
              Text("Address", style: FStyles.headline4text),
              SizedBox(height: context.h * 0.01),
              MyTextField.textField(
                  text: "Your Address",
                  controller: cubitData.locationController,
                  maxlines: 4),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButtonWidget(
          height: context.h * 0.06, 
          child: Text("Save"), onPressed: () {
            NavigationService.instance.pushNamed(routeName: '/changednumberconfirmationview', args: context);
          }),
    );
  }
}
