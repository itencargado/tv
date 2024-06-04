

import 'package:flutter/material.dart';
import 'package:tv/app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'package:tv/app/domain/repositories/connectivity_repository.dart';
import 'package:tv/app/presentation/routes/routes.dart';
import 'package:tv/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              _init();
            }
    );
  }

  Future<void> _init() async {
    final injector =  Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    final hasInternet = await connectivityRepository.hasInternet;
    print('// hasInternet $hasInternet');
    if(hasInternet){
      final authenticationRepository = injector.authenticationRepository;
      final isSignedIn = await authenticationRepository.isSignedIn;
      if(isSignedIn){
        final user = await authenticationRepository.getUserData();
        if(mounted){
          if(user != null){
            _goTo(Routes.home);
          }else {
            _goTo(Routes.singIn);
          }
        }
      }else if(mounted){
        _goTo(Routes.singIn);
      }
    }else{
      
    }
  }
  void _goTo(String routeName){
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
