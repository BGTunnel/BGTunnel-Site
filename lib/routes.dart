import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landify_design_flutter/dashboard_admin/helpers/services/auth_services.dart';
import 'package:landify_design_flutter/dashboard_admin/view/dashboard/member_list_screen.dart';
import 'package:landify_design_flutter/landing_page/pages/about_us.dart';
import 'package:landify_design_flutter/landing_page/pages/contact.dart';
import 'package:landify_design_flutter/landing_page/pages/privacy.dart';
import 'package:landify_design_flutter/landing_page/pages/terms.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/dashboard_admin/view/auth/login_screen.dart';
import 'package:landify_design_flutter/dashboard_admin/view/dashboard/dashboard_screen.dart';

import 'dashboard_admin/view/dashboard/node_list_screen.dart';

final AuthService _authService = AuthService();

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final token = await _authService.getToken();
  final isLoggedIn = token != null && !_authService.isTokenExpired(token);

  if (!isLoggedIn && state.path!.startsWith('/dashboard')) {
    return '/auth/login';
  }
  return null; // No redirection needed
}

/// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: DashboardScreen(),
        );
      },
      redirect: authGuard, // Apply the auth guard middleware
    ),
    GoRoute(
      path: '/dashboard/member',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MemberListScreen()),
      redirect: authGuard, // Apply the auth guard middleware
    ),
    GoRoute(
      path: '/dashboard/node',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: NodeListScreen()),
      redirect: authGuard, // Apply the auth guard middleware
    ),
    GoRoute(
      path: '/privacy',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: PrivacyPage()),
    ),
    GoRoute(
      path: '/terms',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: TermsPage()),
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AboutUsPage()),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ContactUsPage()),
    ),
  ],
  // Redirect logic for the whole app (used to catch unauthorized access globally)
  redirect: (context, state) {
    final token = _authService.getToken();
    // Check if user is trying to access the login page but is already authenticated
    if (token != null && state.path == '/auth/login') {
      return '/dashboard'; // Redirect authenticated users away from the login screen
    }
    return null;
  },
);
