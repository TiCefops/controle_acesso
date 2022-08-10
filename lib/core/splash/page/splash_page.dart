import 'package:cefops_controll_acess/core/splash/bloc/splash_event.dart';
import 'package:cefops_controll_acess/core/utils/firebase/remote_config/remote_config_configure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  final SplashBloc bloc = Modular.get<SplashBloc>();


  @override
  void initState() {
    super.initState();
    bloc.add(InitEvent());
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
       bloc.add(NavegarEvent());

      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(InitEvent()),
      child: Scaffold(
          body: LogoAnimado(animation)
      ),
    );
  }
}

class LogoAnimado extends AnimatedWidget {
  final Animation<double> animation;

  const LogoAnimado(this.animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final controller =Tween<double>(begin: 0, end: 300);
    return Center(
      child: SizedBox(
          width: controller.evaluate(animation),
          height: controller.evaluate(animation),
          child: Image.asset("assets/images/logo.png")),
    );
  }
}
