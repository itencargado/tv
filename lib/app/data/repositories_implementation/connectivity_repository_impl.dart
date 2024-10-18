import 'dart:io';
import 'package:tv/app/data/services/remote/internet_checker.dart';
import 'package:tv/app/domain/repositories/connectivity_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository{
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  ConnectivityRepositoryImpl(this._connectivity, this._internetChecker);

  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }
    return _internetChecker.hasInternet();
  }


}