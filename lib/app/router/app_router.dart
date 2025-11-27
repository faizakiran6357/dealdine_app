
// // import 'package:dealdine_application/features/onboarding/presentation/onboarding_4.dart';
// // import 'package:go_router/go_router.dart';

// // // AUTH
// // import '../../features/auth/presentation/splash_screen.dart';
// // import '../../features/auth/presentation/login_screen.dart';
// // import '../../features/auth/presentation/forgot_password_screen.dart';
// // import '../../features/auth/presentation/verification_screen.dart';
// // import '../../features/auth/presentation/signup_screen.dart';

// // // ONBOARDING
// // import '../../features/onboarding/presentation/onboarding_1.dart';
// // import '../../features/onboarding/presentation/onboarding_2.dart';
// // import '../../features/onboarding/presentation/onboarding_3.dart';

// // // LOCATION
// // import '../../features/location/presentation/location_screen.dart';

// // // HOME MODULE
// // import '../../features/home/presentation/home_screen.dart';
// // import '../../features/videos/presentation/videos_screen.dart';
// // import '../../features/favourites/presentation/favourites_screen.dart';
// // import '../../features/restaurant/presentation/restaurant_detail_screen.dart';

// // // PROFILE
// // import '../../features/profile/presentation/profile_view_1.dart';
// // import '../../features/profile/presentation/profile_view_2.dart';
// // import '../../features/profile/presentation/profile_view_3.dart';

// // // NOTIFICATIONS
// // import '../../features/notifications/presentation/notifications_screen.dart';


// // /// ------------------------------------------------------------
// // /// 🔥 FINAL GLOBAL ROUTER (this is what app.dart will use)
// // /// ------------------------------------------------------------
// // final GoRouter appRouter = GoRouter(
// //   initialLocation: '/',
// //   routes: [
// //     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

// //     // Onboarding
// //     GoRoute(path: '/onboarding/1', builder: (c, s) => const Onboarding1()),
// //     GoRoute(path: '/onboarding/2', builder: (c, s) => const Onboarding2()),
// //     GoRoute(path: '/onboarding/3', builder: (c, s) => const Onboarding3()),
// //     GoRoute(path: '/onboarding/4', builder: (c, s) => const Onboarding4()),

// //     // Auth
// //     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
// //     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
// //     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
// //     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

// //     // Location
// //     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

// //     // Home
// //     GoRoute(path: '/home', builder: (c, s) => const HomeScreen()),
// //     GoRoute(path: '/videos', builder: (c, s) => const VideosScreen()),
// //     GoRoute(path: '/favourites', builder: (c, s) => const FavouritesScreen()),
// //     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

// //     // Profile
// //     GoRoute(path: '/profile/1', builder: (c, s) => const ProfileView1()),
// //     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
// //     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

// //     // Notifications
// //     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
// //   ],
// // );
// import 'package:dealdine_application/features/onboarding/presentation/onboarding_4.dart';
// import 'package:go_router/go_router.dart';

// // AUTH
// import '../../features/auth/presentation/splash_screen.dart';
// import '../../features/auth/presentation/login_screen.dart';
// import '../../features/auth/presentation/forgot_password_screen.dart';
// import '../../features/auth/presentation/verification_screen.dart';
// import '../../features/auth/presentation/signup_screen.dart';

// // ONBOARDING
// import '../../features/onboarding/presentation/onboarding_1.dart';
// import '../../features/onboarding/presentation/onboarding_2.dart';
// import '../../features/onboarding/presentation/onboarding_3.dart';

// // LOCATION
// import '../../features/location/presentation/location_screen.dart';

// // HOME MODULE
// import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
// import '../../features/home/presentation/main_screen.dart'; // <-- new bottom nav

// // NOTIFICATIONS
// import '../../features/notifications/presentation/notifications_screen.dart';

// // PROFILE
// import '../../features/profile/presentation/profile_view_2.dart';
// import '../../features/profile/presentation/profile_view_3.dart';

// /// ------------------------------------------------------------
// /// 🔥 FINAL GLOBAL ROUTER (this is what app.dart will use)
// /// ------------------------------------------------------------
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

//     // Onboarding
//     GoRoute(path: '/onboarding/1', builder: (c, s) => const Onboarding1()),
//     GoRoute(path: '/onboarding/2', builder: (c, s) => const Onboarding2()),
//     GoRoute(path: '/onboarding/3', builder: (c, s) => const Onboarding3()),
//     GoRoute(path: '/onboarding/4', builder: (c, s) => const Onboarding4()),

//     // Auth
//     GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
//     GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
//     GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
//     GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

//     // Location
//     GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

//     // MainScreen with Bottom Navigation
//     GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

//     // Other screens
//     GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),
//     GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
//     GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),
//     GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
//   ],
// );
import 'package:dealdine_application/features/auth/presentation/splash_screen2.dart';
import 'package:dealdine_application/features/onboarding/presentation/onboarding.dart';
import 'package:go_router/go_router.dart';

// AUTH
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/verification_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';

// LOCATION
import '../../features/location/presentation/location_screen.dart';

// HOME MODULE
import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
import '../../features/home/presentation/main_screen.dart';

// NOTIFICATIONS
import '../../features/notifications/presentation/notifications_screen.dart';

// PROFILE
import '../../features/profile/presentation/profile_view_2.dart';
import '../../features/profile/presentation/profile_view_3.dart';

/// ------------------------------------------------------------
/// 🔥 FINAL GLOBAL ROUTER
/// ------------------------------------------------------------
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (c, s) => const SplashScreen()),

    // NEW Splash 2
    GoRoute(path: '/splash2', builder: (c, s) => const SplashScreen2()),

   
       /// ⭐ NEW MERGED ONBOARDING SWIPE SCREEN (Single Screen)
    /// ------------------------------------------------------------
    GoRoute(
      path: '/onboarding',
      builder: (c, s) => const OnboardingMain(),
    ),

    // Auth
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/forgot', builder: (c, s) => const ForgotPasswordScreen()),
    GoRoute(path: '/verification', builder: (c, s) => const VerificationScreen()),
    GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

    // Location
    GoRoute(path: '/location', builder: (c, s) => const LocationScreen()),

    // Main Home (Bottom Navigation)
    GoRoute(path: '/home', builder: (c, s) => const MainScreen()),

    // Restaurant
    GoRoute(path: '/restaurant', builder: (c, s) => const RestaurantDetailScreen()),

    // Profile
    GoRoute(path: '/profile/2', builder: (c, s) => const ProfileView2()),
    GoRoute(path: '/profile/3', builder: (c, s) => const ProfileView3()),

    // Notifications
    GoRoute(path: '/notifications', builder: (c, s) => NotificationsScreen()),
  ],
);
