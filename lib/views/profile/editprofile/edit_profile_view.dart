import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
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
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

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
                onpressed: () {},
              ),
              SizedBox(height: context.h * 0.01),
              SizedBox(
                child: StatefulBuilder(
                  builder: ((context, setState) {
                    if (!KeyboardService.instance.keyboardchek(context)) {
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
              const Text("Name", style: FontStyles.headline5s),
              SizedBox(height: context.h * 0.01),
              const TextformFieldWidgets(hintText: "Your Name"),
              SizedBox(height: context.h * 0.02),
              const Text("Phone", style: FontStyles.headline5s),
              SizedBox(height: context.h * 0.01),
              IntlPhoneField(
                decoration: InputDecoration(
                        contentPadding: PMconst.small,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(RadiuConst.extraLarge))),
              ),
              const Text("Address", style: FontStyles.headline5s),
              SizedBox(height: context.h * 0.01),
              const TextformFieldWidgets(hintText: "Your Address", maxlines: 4),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonWidgets(
          text: 'text',
          onPressed: () {
            NavigationService.instance.pushNamed(
                routeName: '/changednumberconfirmationview', args: context);
          }),
    );
  }
}
