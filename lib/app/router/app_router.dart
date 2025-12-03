
// import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_add_deal_screen.dart';
// import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_analytics_screen.dart';
// import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_dashboard_screen.dart';
// import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_profile_screen.dart';
// import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_upload_video_screen.dart';
// import 'package:go_router/go_router.dart';

// // SPLASH + ONBOARDING
// import 'package:dealdine_application/features/auth/presentation/splash_screen.dart';
// import 'package:dealdine_application/features/auth/presentation/splash_screen2.dart';
// import 'package:dealdine_application/features/onboarding/presentation/onboarding.dart';

// // ROLE SELECTION
// import 'package:dealdine_application/features/auth/presentation/role_selection_screen.dart';

// // AUTH
// import '../../features/auth/presentation/login_screen.dart';
// import '../../features/auth/presentation/forgot_password_screen.dart';
// import '../../features/auth/presentation/verification_screen.dart';
// import '../../features/auth/presentation/signup_screen.dart';

// // LOCATION
// import '../../features/location/presentation/location_screen.dart';

// // HOME MODULE
// import '../../features/home/presentation/main_screen.dart';
// import '../../features/restaurant/presentation/restaurant_detail_screen.dart';

// // PROFILE
// import '../../features/profile/presentation/profile_view_2.dart';
// import '../../features/profile/presentation/profile_view_3.dart';

// // NOTIFICATIONS
// import '../../features/notifications/presentation/notifications_screen.dart';


// /// ⭐ ADMIN FLOW
// import '../../features/admin_flow/presentation/admin_dashboard_screen.dart';
// import '../../features/admin_flow/presentation/admin_approvals_screen.dart';
// import '../../features/admin_flow/presentation/admin_analytics_screen.dart';
// import '../../features/admin_flow/presentation/admin_notifications_screen.dart';

// /// =====================================================================
// /// 🔥 FINAL GLOBAL ROUTER
// /// =====================================================================
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',  // Splash screen first
//   routes: [

//     /// -------------------------------------------------------------------
//     /// APP ENTRY
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),
//     GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

//     /// ONBOARDING
//     GoRoute(path: '/onboarding', builder: (c, s) => const OnboardingMain()),

//     /// ROLE SELECTION (Added)
//     GoRoute(path: '/role', builder: (c, s) => const RoleSelectionScreen()),

//     /// -------------------------------------------------------------------
//     /// AUTH
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
//     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
//     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
//     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

//     /// LOCATION
//     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

//     /// HOME
//     GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

//     /// USER SIDE RESTAURANT DETAIL
//     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

//     /// PROFILE
//     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
//     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

//     /// NOTIFICATIONS
//     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),

//     /// ===================================================================
//     /// ⭐ RESTAURANT FLOW ROUTES (NO TRANSITION FOR STICKY LAYOUT FEEL)
//     /// ===================================================================
//     GoRoute(
//       path: '/restaurant/dashboard',
//       pageBuilder: (c, s) => const NoTransitionPage(
//         child: RestaurantDashboardScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/restaurant/add-deal',
//       pageBuilder: (c, s) => const NoTransitionPage(
//         child: AddDealScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/restaurant/upload-video',
//       pageBuilder: (c, s) => const NoTransitionPage(
//         child: RestaurantUploadVideoScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/restaurant/analytics',
//       pageBuilder: (c, s) => const NoTransitionPage(
//         child: RestaurantAnalyticsScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/restaurant/profile',
//       pageBuilder: (c, s) => const NoTransitionPage(
//         child: RestaurantProfileScreen(),
//       ),
//     ),

//     /// ===================================================================
//     /// ⭐ ADMIN FLOW ROUTES
//     /// ===================================================================
//     GoRoute(path: '/admin/dashboard', builder: (c, s) => const AdminDashboardScreen()),
//     GoRoute(path: '/admin/approvals', builder: (c, s) => const AdminApprovalsScreen()),
//     GoRoute(path: '/admin/analytics', builder: (c, s) => const AdminAnalyticsScreen()),
//     GoRoute(path: '/admin/notifications', builder: (c, s) => const AdminNotificationsScreen()),
//   ],
  
// );

import 'package:go_router/go_router.dart';

// SPLASH + ONBOARDING
import 'package:dealdine_application/features/auth/presentation/splash_screen.dart';
import 'package:dealdine_application/features/auth/presentation/splash_screen2.dart';
import 'package:dealdine_application/features/onboarding/presentation/onboarding.dart';

// ROLE SELECTION
import 'package:dealdine_application/features/auth/presentation/role_selection_screen.dart';

// AUTH
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/verification_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';

// LOCATION
import '../../features/location/presentation/location_screen.dart';

// HOME MODULE
import '../../features/home/presentation/main_screen.dart';
import '../../features/restaurant/presentation/restaurant_detail_screen.dart';

// PROFILE
import '../../features/profile/presentation/profile_view_2.dart';
import '../../features/profile/presentation/profile_view_3.dart';

// NOTIFICATIONS
import '../../features/notifications/presentation/notifications_screen.dart';

/// ⭐ RESTAURANT FLOW
import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_dashboard_screen.dart';
import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_add_deal_screen.dart';
import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_upload_video_screen.dart';
import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_analytics_screen.dart';
import 'package:dealdine_application/features/restuarant_flow/presentation/restaurant_profile_screen.dart';

/// ⭐ ADMIN FLOW
import '../../features/admin_flow/presentation/admin_dashboard_screen.dart';
import '../../features/admin_flow/presentation/admin_approvals_screen.dart';
import '../../features/admin_flow/presentation/admin_analytics_screen.dart';
import '../../features/admin_flow/presentation/admin_notifications_screen.dart';
import 'package:dealdine_application/features/admin_flow/presentation/admin_shell.dart';

/// =====================================================================
/// 🔥 FINAL GLOBAL ROUTER
/// =====================================================================
final GoRouter appRouter = GoRouter(
  initialLocation: '/', // Splash first
  routes: [

    /// -------------------------------------------------------------------
    /// APP ENTRY
    /// -------------------------------------------------------------------
    GoRoute(path: '/', builder: (c, s) => const SplashScreen()),
    GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

    /// ONBOARDING
    GoRoute(path: '/onboarding', builder: (c, s) => const OnboardingMain()),

    /// ROLE SELECTION
    GoRoute(path: '/role', builder: (c, s) => const RoleSelectionScreen()),

    /// -------------------------------------------------------------------
    /// AUTH
    /// -------------------------------------------------------------------
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
    GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
    GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

    /// LOCATION
    GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

    /// HOME
    GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

    /// USER SIDE RESTAURANT DETAIL
    GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

    /// PROFILE
    GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
    GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

    /// NOTIFICATIONS
    GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),

    /// ===================================================================
    /// ⭐ RESTAURANT FLOW — NO TRANSITION FOR SMOOTH UX
    /// ===================================================================
    GoRoute(
      path: '/restaurant/dashboard',
      pageBuilder: (c, s) => const NoTransitionPage(child: RestaurantDashboardScreen()),
    ),
    GoRoute(
      path: '/restaurant/add-deal',
      pageBuilder: (c, s) => const NoTransitionPage(child: AddDealScreen()),
    ),
    GoRoute(
      path: '/restaurant/upload-video',
      pageBuilder: (c, s) => const NoTransitionPage(child: RestaurantUploadVideoScreen()),
    ),
    GoRoute(
      path: '/restaurant/analytics',
      pageBuilder: (c, s) => const NoTransitionPage(child: RestaurantAnalyticsScreen()),
    ),
    GoRoute(
      path: '/restaurant/profile',
      pageBuilder: (c, s) => const NoTransitionPage(child: RestaurantProfileScreen()),
    ),

    /// ===================================================================
    /// ⭐ ADMIN FLOW — WITH AdminShell WRAPPER
    /// ===================================================================
    ShellRoute(
      builder: (context, state, child) => AdminShell(child: child),
      routes: [
        GoRoute(
          path: '/admin/dashboard',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminDashboardScreen()),
        ),
        GoRoute(
          path: '/admin/approvals',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminApprovalsScreen()),
        ),
        GoRoute(
          path: '/admin/analytics',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminAnalyticsScreen()),
        ),
        GoRoute(
          path: '/admin/notifications',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminNotificationsScreen()),
        ),
      ],
    ),
  ],
);
