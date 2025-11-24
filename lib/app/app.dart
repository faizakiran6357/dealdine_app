// import 'package:flutter/material.dart';
// import '../app/router/app_router.dart';
// import '../core/theme/app_theme.dart';

// class DealDineApp extends StatelessWidget {
//   const DealDineApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'DealDine',
//       theme: AppTheme.lightTheme,
//       routerConfig: appRouter, // now works ✔
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../app/router/app_router.dart';
import '../core/theme/app_theme.dart';

class DealDineApp extends StatelessWidget {
  const DealDineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DealDine',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter, // now works ✔
      debugShowCheckedModeBanner: false,
    );
  }
}