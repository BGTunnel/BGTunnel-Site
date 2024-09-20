import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/dashboard_admin/helpers/services/storage/local_storage.dart';
import 'package:landify_design_flutter/dashboard_admin/helpers/theme/app_theme.dart';
import 'package:landify_design_flutter/landing_page/sections/achievements_section.dart';
import 'package:landify_design_flutter/landing_page/sections/companies_sections.dart';
import 'package:landify_design_flutter/landing_page/sections/features_section.dart';
import 'package:landify_design_flutter/landing_page/sections/footer_section.dart';
import 'package:landify_design_flutter/landing_page/sections/main_section.dart';
import 'package:landify_design_flutter/landing_page/sections/pricing_section.dart';
import 'package:landify_design_flutter/landing_page/sections/stories_section.dart';
import 'package:landify_design_flutter/landing_page/shared/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dashboard_admin/helpers/services/navigation_services.dart';
import 'dashboard_admin/helpers/services/title_service.dart';
import 'dashboard_admin/helpers/theme/app_notifier.dart';
import 'landing_page/utils/breakpoint.dart';
import 'routes.dart';
import 'landing_page/sections/integrations_section.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await dotenv.load(fileName: ".env");
  await LocalStorage.init();
  AppStyle.init();
  runApp(riverpod.ProviderScope(
      child: ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (_, notifier, ___) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            NavigationService.registerContext(context);
            return LayoutBuilder(
              builder: (context, constraint) {
                return BreakpointProvider(
                  breakpoint: Breakpoint.get(constraint.maxWidth),
                  child: Directionality(
                      textDirection: AppTheme.textDirection,
                      child: child ?? Container()),
                );
              },
            );
          },
        );
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  final GlobalKey _featuresSectionKey = GlobalKey();
  final GlobalKey _storiesSectionKey = GlobalKey();
  final GlobalKey _achievementsSectionKey = GlobalKey();
  final GlobalKey _pricingPageKey = GlobalKey();
  final GlobalKey _integrationsSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll listener to update _isScrolled based on scroll offset
  void _onScroll() {
    if (_scrollController.offset > 50) {
      // If scrolled down more than 50 pixels, mark as scrolled
      if (!_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      }
    } else {
      // If back to the top, mark as not scrolled
      if (_isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    }
  }

  // Method to scroll to the section dynamically based on its GlobalKey
  void _scrollToIndex(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // Get the position of the section on the screen
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1), // Animation duration
        curve: Curves.easeInOut, // Smooth scrolling
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TitleService.setTitle(
        'BGTunnel - Experience the Ultimate in Privacy with BGTunnel');
    return SelectionArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomResponsiveAppBar(
            isScrolled: _isScrolled,
            title: Row(
              children: [
                Image.asset('assets/logo.png', height: 32, width: 32),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      'BGTunnel',
                      style: GoogleFonts.ubuntuCondensed(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _scrollToIndex(_featuresSectionKey);
                },
                child: Text(
                  'Features',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_storiesSectionKey);
                },
                child: Text(
                  'Stories',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_achievementsSectionKey);
                },
                child: Text(
                  'Achievements',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_pricingPageKey);
                },
                child: Text(
                  'Pricing',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_integrationsSectionKey);
                },
                child: Text(
                  'Locations',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          drawer: CustomDrawer(
            menuItems: [
              TextButton(
                onPressed: () {
                  _scrollToIndex(_featuresSectionKey);
                },
                child: const Text('Features'),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_storiesSectionKey);
                },
                child: const Text('Stories'),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_achievementsSectionKey);
                },
                child: const Text('Achievements'),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_pricingPageKey);
                },
                child: const Text('Pricing'),
              ),
              TextButton(
                onPressed: () {
                  _scrollToIndex(_integrationsSectionKey);
                },
                child: const Text('Locations'),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Apply animation to each section
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: const MainSection(),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: const CompaniesSections(),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: FeaturesSection(key: _featuresSectionKey),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: StoriesSection(key: _storiesSectionKey),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: AchievementsSection(key: _achievementsSectionKey),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: PricingPage(key: _pricingPageKey),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: IntegrationsSection(key: _integrationsSectionKey),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    SlideEffect(
                      duration: 500.ms,
                    ),
                  ],
                  child: const FooterSection(),
                ),
              ],
            ),
          )),
    );
  }
}
