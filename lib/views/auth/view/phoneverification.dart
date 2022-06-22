import 'package:flutter/material.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/widgets/appbar.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(onpressed: (){}, text: 'Phone verification',),
            SizedBox(height: context.h * 0.03),
            SizedBox(height: context.h * 0.45,child: Image.asset('assets/images/verification.png')),
            
          ],
        ),
      ),
    );
  }
}
