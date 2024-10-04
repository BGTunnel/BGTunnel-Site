import 'package:go_router/go_router.dart';
import 'package:landify_design_flutter/landing_page/pages/about_us.dart';
import 'package:landify_design_flutter/landing_page/pages/contact.dart';
import 'package:landify_design_flutter/landing_page/pages/privacy.dart';
import 'package:landify_design_flutter/landing_page/pages/terms.dart';
import 'package:landify_design_flutter/main.dart';

/// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
     GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        
        return NoTransitionPage(
          child: LandingPage(),
        );
      },
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
);
