



import 'package:flutter/material.dart';
import 'package:tv/app/presentation/modules/home/views/home_view.dart';
import 'package:tv/app/presentation/modules/sign_in/views/sign_in_view.dart';
import 'package:tv/app/presentation/modules/splash/views/splash_view.dart';
import 'package:tv/app/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes{

  return{
    Routes.splash: (context) => const SplashView(),
    Routes.singIn: (context) => const SingInView(),
    Routes.home: (context) => const HomeView(),
  };

}