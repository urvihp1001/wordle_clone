import 'package:flutter/material.dart';
import 'package:wordle_urvi_version/core/get_it/get_it.dart';
import 'package:wordle_urvi_version/core/router/app_router.dart';
import 'package:wordle_urvi_version/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();// Initialize the binding b4 runapp
  setup();
  runApp(  
    MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
    )
  );
}



