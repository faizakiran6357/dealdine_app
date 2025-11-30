
// // // // import 'package:dealdine_application/features/onboarding/presentation/onboarding_4.dart';
// // // // import 'package:go_router/go_router.dart';

// // // // // AUTH
// // // // import '../../features/auth/presentation/splash_screen.dart';
// // // // import '../../features/auth/presentation/login_screen.dart';
// // // // import '../../features/auth/presentation/forgot_password_screen.dart';
// // // // import '../../features/auth/presentation/verification_screen.dart';
// // // // import '../../features/auth/presentation/signup_screen.dart';

// // // // // ONBOARDING
// // // // import '../../features/onboarding/presentation/onboarding_1.dart';
// // // // import '../../features/onboarding/presentation/onboarding_2.dart';
// // // // import '../../features/onboarding/presentation/onboarding_3.dart';

// // // // // LOCATION
// // // // import '../../features/location/presentation/location_screen.dart';

// // // // // HOME MODULE
// // // // import '../../features/home/presentation/home_screen.dart';
// // // // import '../../features/videos/presentation/videos_screen.dart';
// // // // import '../../features/favourites/presentation/favourites_screen.dart';
// // // // import '../../features/restaurant/presentation/restaurant_detail_screen.dart';

// // // // // PROFILE
// // // // import '../../features/profile/presentation/profile_view_1.dart';
// // // // import '../../features/profile/presentation/profile_view_2.dart';
// // // // import '../../features/profile/presentation/profile_view_3.dart';

// // // // // NOTIFICATIONS
// // // // import '../../features/notifications/presentation/notifications_screen.dart';


// // // // /// ------------------------------------------------------------
// // // // /// 🔥 FINAL GLOBAL ROUTER (this is what app.dart will use)
// // // // /// ------------------------------------------------------------
// // // // final GoRouter appRouter = GoRouter(
// // // //   initialLocation: '/',
// // // //   routes: [
// // // //     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

// // // //     // Onboarding
// // // //     GoRoute(path: '/onboarding/1', builder: (c, s) => const Onboarding1()),
// // // //     GoRoute(path: '/onboarding/2', builder: (c, s) => const Onboarding2()),
// // // //     GoRoute(path: '/onboarding/3', builder: (c, s) => const Onboarding3()),
// // // //     GoRoute(path: '/onboarding/4', builder: (c, s) => const Onboarding4()),

// // // //     // Auth
// // // //     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
// // // //     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
// // // //     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
// // // //     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

// // // //     // Location
// // // //     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

// // // //     // Home
// // // //     GoRoute(path: '/home', builder: (c, s) => const HomeScreen()),
// // // //     GoRoute(path: '/videos', builder: (c, s) => const VideosScreen()),
// // // //     GoRoute(path: '/favourites', builder: (c, s) => const FavouritesScreen()),
// // // //     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

// // // //     // Profile
// // // //     GoRoute(path: '/profile/1', builder: (c, s) => const ProfileView1()),
// // // //     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
// // // //     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

// // // //     // Notifications
// // // //     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
// // // //   ],
// // // // );
// // // import 'package:dealdine_application/features/onboarding/presentation/onboarding_4.dart';
// // // import 'package:go_router/go_router.dart';

// // // // AUTH
// // // import '../../features/auth/presentation/splash_screen.dart';
// // // import '../../features/auth/presentation/login_screen.dart';
// // // import '../../features/auth/presentation/forgot_password_screen.dart';
// // // import '../../features/auth/presentation/verification_screen.dart';
// // // import '../../features/auth/presentation/signup_screen.dart';

// // // // ONBOARDING
// // // import '../../features/onboarding/presentation/onboarding_1.dart';
// // // import '../../features/onboarding/presentation/onboarding_2.dart';
// // // import '../../features/onboarding/presentation/onboarding_3.dart';

// // // // LOCATION
// // // import '../../features/location/presentation/location_screen.dart';

// // // // HOME MODULE
// // // import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
// // // import '../../features/home/presentation/main_screen.dart'; // <-- new bottom nav

// // // // NOTIFICATIONS
// // // import '../../features/notifications/presentation/notifications_screen.dart';

// // // // PROFILE
// // // import '../../features/profile/presentation/profile_view_2.dart';
// // // import '../../features/profile/presentation/profile_view_3.dart';

// // // /// ------------------------------------------------------------
// // // /// 🔥 FINAL GLOBAL ROUTER (this is what app.dart will use)
// // // /// ------------------------------------------------------------
// // // final GoRouter appRouter = GoRouter(
// // //   initialLocation: '/',
// // //   routes: [
// // //     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

// // //     // Onboarding
// // //     GoRoute(path: '/onboarding/1', builder: (c, s) => const Onboarding1()),
// // //     GoRoute(path: '/onboarding/2', builder: (c, s) => const Onboarding2()),
// // //     GoRoute(path: '/onboarding/3', builder: (c, s) => const Onboarding3()),
// // //     GoRoute(path: '/onboarding/4', builder: (c, s) => const Onboarding4()),

// // //     // Auth
// // //     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
// // //     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
// // //     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
// // //     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

// // //     // Location
// // //     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

// // //     // MainScreen with Bottom Navigation
// // //     GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

// // //     // Other screens
// // //     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),
// // //     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
// // //     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),
// // //     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
// // //   ],
// // // );
// // import 'package:dealdine_application/features/auth/presentation/splash_screen2.dart';
// // import 'package:dealdine_application/features/onboarding/presentation/onboarding.dart';
// // import 'package:go_router/go_router.dart';

// // // AUTH
// // import '../../features/auth/presentation/splash_screen.dart';
// // import '../../features/auth/presentation/login_screen.dart';
// // import '../../features/auth/presentation/forgot_password_screen.dart';
// // import '../../features/auth/presentation/verification_screen.dart';
// // import '../../features/auth/presentation/signup_screen.dart';

// // // LOCATION
// // import '../../features/location/presentation/location_screen.dart';

// // // HOME MODULE
// // import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
// // import '../../features/home/presentation/main_screen.dart';

// // // NOTIFICATIONS
// // import '../../features/notifications/presentation/notifications_screen.dart';

// // // PROFILE
// // import '../../features/profile/presentation/profile_view_2.dart';
// // import '../../features/profile/presentation/profile_view_3.dart';

// // /// ------------------------------------------------------------
// // /// 🔥 FINAL GLOBAL ROUTER
// // /// ------------------------------------------------------------
// // final GoRouter appRouter = GoRouter(
// //   initialLocation: '/',
// //   routes: [
// //     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

// //     // NEW Splash 2
// //     GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

   
// //        /// ⭐ NEW MERGED ONBOARDING SWIPE SCREEN (Single Screen)
// //     /// ------------------------------------------------------------
// //     GoRoute(
// //       path: '/onboarding',
// //       builder: (c, s) => const OnboardingMain(),
// //     ),

// //     // Auth
// //     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
// //     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
// //     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
// //     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

// //     // Location
// //     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

// //     // Main Home (Bottom Navigation)
// //     GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

// //     // Restaurant
// //     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

// //     // Profile
// //     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
// //     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

// //     // Notifications
// //     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
// //   ],
// // );
// import 'package:dealdine_application/features/auth/presentation/splash_screen2.dart';
// import 'package:dealdine_application/features/onboarding/presentation/onboarding.dart';
// import 'package:go_router/go_router.dart';

// // AUTH
// import '../../features/auth/presentation/splash_screen.dart';
// import '../../features/auth/presentation/login_screen.dart';
// import '../../features/auth/presentation/forgot_password_screen.dart';
// import '../../features/auth/presentation/verification_screen.dart';
// import '../../features/auth/presentation/signup_screen.dart';

// // LOCATION
// import '../../features/location/presentation/location_screen.dart';

// // HOME MODULE
// import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
// import '../../features/home/presentation/main_screen.dart';

// // NOTIFICATIONS
// import '../../features/notifications/presentation/notifications_screen.dart';

// // PROFILE
// import '../../features/profile/presentation/profile_view_2.dart';
// import '../../features/profile/presentation/profile_view_3.dart';

// /// ---------------------------------------------------------------------
// /// ⭐  RESTAURANT FLOW SCREENS
// /// ---------------------------------------------------------------------
// import '../../features/restaurant_flow/presentation/restaurant_dashboard_screen.dart';
// import '../../features/restaurant_flow/presentation/restaurant_add_deal_screen.dart';
// import '../../features/restaurant_flow/presentation/restaurant_upload_video_screen.dart';
// import '../../features/restaurant_flow/presentation/restaurant_analytics_screen.dart';
// import '../../features/restaurant_flow/presentation/restaurant_profile_screen.dart';

// /// ---------------------------------------------------------------------
// /// ⭐  ADMIN FLOW SCREENS
// /// ---------------------------------------------------------------------
// import '../../features/admin_flow/presentation/admin_dashboard_screen.dart';
// import '../../features/admin_flow/presentation/admin_approvals_screen.dart';
// import '../../features/admin_flow/presentation/admin_analytics_screen.dart';
// import '../../features/admin_flow/presentation/admin_notifications_screen.dart';


// /// =====================================================================
// /// 🔥 FINAL GLOBAL ROUTER
// /// =====================================================================
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     /// -------------------------------------------------------------------
//     /// APP ENTRY
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),
//     GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

//     /// Onboarding
//     GoRoute(path: '/onboarding', builder: (c, s) => const OnboardingMain()),

//     /// -------------------------------------------------------------------
//     /// AUTH ROUTES
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
//     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
//     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
//     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

//     /// -------------------------------------------------------------------
//     /// LOCATION SCREEN
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

//     /// -------------------------------------------------------------------
//     /// HOME MAIN BOTTOM NAVIGATION
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

//     /// -------------------------------------------------------------------
//     /// RESTAURANT SCREEN (User Side)
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

//     /// -------------------------------------------------------------------
//     /// PROFILE ROUTES
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
//     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

//     /// -------------------------------------------------------------------
//     /// NOTIFICATIONS
//     /// -------------------------------------------------------------------
//     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),


//     /// ===================================================================
//     /// ⭐ RESTAURANT FLOW ROUTES
//     /// ===================================================================
//     GoRoute(path: '/restaurant/dashboard', builder: (c, s) => const RestaurantDashboardScreen()),
//     GoRoute(path: '/restaurant/add-deal', builder: (c, s) => const RestaurantAddDealScreen()),
//     GoRoute(path: '/restaurant/upload-video', builder: (c, s) => const RestaurantUploadVideoScreen()),
//     GoRoute(path: '/restaurant/analytics', builder: (c, s) => const RestaurantAnalyticsScreen()),
//     GoRoute(path: '/restaurant/profile', builder: (c, s) => const RestaurantProfileScreen()),


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
import '../../features/restaurant_flow/presentation/restaurant_dashboard_screen.dart';
import '../../features/restaurant_flow/presentation/restaurant_add_deal_screen.dart';
import '../../features/restaurant_flow/presentation/restaurant_upload_video_screen.dart';
import '../../features/restaurant_flow/presentation/restaurant_analytics_screen.dart';
import '../../features/restaurant_flow/presentation/restaurant_profile_screen.dart';

/// ⭐ ADMIN FLOW
import '../../features/admin_flow/presentation/admin_dashboard_screen.dart';
import '../../features/admin_flow/presentation/admin_approvals_screen.dart';
import '../../features/admin_flow/presentation/admin_analytics_screen.dart';
import '../../features/admin_flow/presentation/admin_notifications_screen.dart';

/// =====================================================================
/// 🔥 FINAL GLOBAL ROUTER
/// =====================================================================
final GoRouter appRouter = GoRouter(
  initialLocation: '/',  // Splash screen first
  routes: [

    /// -------------------------------------------------------------------
    /// APP ENTRY
    /// -------------------------------------------------------------------
    GoRoute(path: '/', builder: (c, s) => const SplashScreen()),
    GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

    /// ONBOARDING
    GoRoute(path: '/onboarding', builder: (c, s) => const OnboardingMain()),

    /// ROLE SELECTION (Added)
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
    /// ⭐ RESTAURANT FLOW ROUTES
    /// ===================================================================
    GoRoute(path: '/restaurant/dashboard', builder: (c, s) => const RestaurantDashboardScreen()),
    GoRoute(path: '/restaurant/add-deal', builder: (c, s) => const RestaurantAddDealScreen()),
    GoRoute(path: '/restaurant/upload-video', builder: (c, s) => const RestaurantUploadVideoScreen()),
    GoRoute(path: '/restaurant/analytics', builder: (c, s) => const RestaurantAnalyticsScreen()),
    GoRoute(path: '/restaurant/profile', builder: (c, s) => const RestaurantProfileScreen()),

    /// ===================================================================
    /// ⭐ ADMIN FLOW ROUTES
    /// ===================================================================
    GoRoute(path: '/admin/dashboard', builder: (c, s) => const AdminDashboardScreen()),
    GoRoute(path: '/admin/approvals', builder: (c, s) => const AdminApprovalsScreen()),
    GoRoute(path: '/admin/analytics', builder: (c, s) => const AdminAnalyticsScreen()),
    GoRoute(path: '/admin/notifications', builder: (c, s) => const AdminNotificationsScreen()),
  ],
);
