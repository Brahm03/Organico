import 'dart:async';
import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
        lowerBound: 0.0,
        upperBound: 1.0);
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        _controller.value;
      });
    });
    Timer(const Duration(seconds: 5), () => NavigationService.instance.pushNamedAndRemoveUntil('/auth'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
                opacity: _controller.value,
                child:
                    SizedBox(height: context.h * 0.2, child: IconConst.logo)),
            Opacity(
              opacity: _controller.value,
              child: const Text(
                'Organico',
                style: FontStyles.headline4sbold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
