import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Notification Settings",
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: IconConst.leftarrow),
            ),
            SwitchListTile.adaptive(
                title: Text("In App Notification", style: FStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("New Promo", style: FStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("Tips & trick", style: FStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("Update Application", style: FStyles.headline4s),
                value: false,
                onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
