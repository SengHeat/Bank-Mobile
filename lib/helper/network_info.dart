// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult result = (await connectivity.checkConnectivity()) as ConnectivityResult;
    return result != ConnectivityResult.none;
  }

  static checkConnectivity(context) async {
    bool firstTime = true;
    late bool isNotConnected;
    isNotConnected = false;

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      isNotConnected = false;
      if (!firstTime) {
        if (result == ConnectivityResult.none) {
          isNotConnected = true;
        } else {
          isNotConnected = !await _updateConnectivityStatus();
        }
        isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
      firstTime = false;
    } as void Function(List<ConnectivityResult> event)?);
    return isNotConnected;
  }

  static Future<bool> _updateConnectivityStatus() async {
    bool? isConnected;
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } catch (e) {
      isConnected = false;
    }
    return isConnected!;
  }
}
