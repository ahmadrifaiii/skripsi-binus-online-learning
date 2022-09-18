import 'package:flutter/material.dart';

import '../screens/auth/login.dart';
import '../screens/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/workorder/detail_workorder.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/main': (context) => const HomeScreen(),
  '/wo-detail': (context) => const WorkOrderDetailScreen(),
};
