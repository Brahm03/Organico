import 'package:flutter/material.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/widgets/appbar.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  [
            AppBarWidget(onpressed: (){}, trailing: IconConst.heart,)
          ],
        ),
      ),
    );

  }
}
