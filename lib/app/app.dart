
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/router/app_router.dart';
import '../core/theme/app_theme.dart';
import '../application/providers/user_profile_provider.dart'; 

class DealDineApp extends StatelessWidget {
  const DealDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: MaterialApp.router(
        title: 'DealDine',
        theme: AppTheme.lightTheme,
        routerConfig: appRouter, 
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
