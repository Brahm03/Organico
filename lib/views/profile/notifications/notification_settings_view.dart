import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/widgets/appbar.dart';


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
              onpressed: () => NavigationService.instance.pop(),
            ),
            SwitchListTile.adaptive(
                title: Text("In App Notification", style: FontStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("New Promo", style: FontStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("Tips & trick", style: FontStyles.headline4s),
                value: true,
                onChanged: (v) {}),
            SwitchListTile.adaptive(
                title: Text("Update Application", style: FontStyles.headline4s),
                value: false,
                onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
