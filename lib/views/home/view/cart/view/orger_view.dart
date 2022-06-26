import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/widgets/appbar.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(onpressed: () => NavigationService.instance.pop(), text: 'My orders',)
          ],
        ),
      ),
    );
  }
}
