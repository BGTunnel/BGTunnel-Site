import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/gradient_text.dart';
import 'package:landify_design_flutter/landing_page/sections/achievements_section.dart';
import 'package:landify_design_flutter/landing_page/sections/companies_sections.dart';
import 'package:landify_design_flutter/landing_page/sections/features_section.dart';
import 'package:landify_design_flutter/landing_page/sections/footer_section.dart';
import 'package:landify_design_flutter/landing_page/sections/main_section.dart';
import 'package:landify_design_flutter/landing_page/sections/pricing_section.dart';
import 'package:landify_design_flutter/landing_page/sections/stories_section.dart';
import 'package:landify_design_flutter/landing_page/shared/custom_appbar.dart';
import 'package:landify_design_flutter/navigation_services.dart';
import 'package:landify_design_flutter/title_service.dart';
import 'landing_page/utils/breakpoint.dart';
import 'landing_page/utils/connection_provider.dart';
import 'routes.dart';
import 'landing_page/sections/integrations_section.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      builder: (context, child) {
        NavigationService.registerContext(context);
        return LayoutBuilder(
          builder: (context, constraint) {
            return BreakpointProvider(
              breakpoint: Breakpoint.get(constraint.maxWidth),
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: child ?? Container()),
            );
          },
        );
      },
    );
  }
}

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  final GlobalKey _featuresSectionKey = GlobalKey();
  final GlobalKey _storiesSectionKey = GlobalKey();
  final GlobalKey _achievementsSectionKey = GlobalKey();
  final GlobalKey _pricingPageKey = GlobalKey();
  final GlobalKey _integrationsSectionKey = GlobalKey();
  final random = Random();
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
    final isConnected = ref.watch(connectionProvider);
    TitleService.setTitle(
        'BGTunnel - Experience the Ultimate in Privacy with BGTunnel');
    return SelectionArea(
        child: Stack(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:
                    isConnected ? Alignment.topCenter : Alignment.bottomCenter,
                end: isConnected
                    ? Alignment.bottomCenter
                    : Alignment.bottomRight,
                colors: isConnected
                    ? [
                        const Color.fromARGB(
                            255, 48, 0, 82), // Dark Purple (Indigo)
                        const Color.fromARGB(
                            255, 72, 0, 96), // Dark Purple (Purple)
                        Colors.black,
                      ]
                    : [
                        const Color.fromARGB(
                            255, 16, 16, 16), // Dark Purple (Indigo)
                        const Color.fromARGB(255, 16, 16, 16),
                        const Color.fromARGB(255, 16, 16, 16),
                      ],
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: true,
                appBar: CustomResponsiveAppBar(
                  isScrolled: _isScrolled,
                  title: Row(
                    children: [
                      Image.asset('assets/logo.png', height: 32, width: 32),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text(
                            'BGTunnel',
                            style: GoogleFonts.protestStrike(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_featuresSectionKey);
                      },
                      child: GradientText(
                        'Features',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_storiesSectionKey);
                      },
                      child: GradientText(
                        'Stories',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_achievementsSectionKey);
                      },
                      child: GradientText(
                        'Achievements',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_pricingPageKey);
                      },
                      child: GradientText(
                        'Pricing',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_integrationsSectionKey);
                      },
                      child: GradientText(
                        'Locations',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
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
                      child: GradientText(
                        'Features',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_storiesSectionKey);
                      },
                      child: GradientText(
                        'Stories',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_achievementsSectionKey);
                      },
                      child: GradientText(
                        'Achievements',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_pricingPageKey);
                      },
                      child: GradientText(
                        'Pricing',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 215, 170, 255)
                        ]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _scrollToIndex(_integrationsSectionKey);
                      },
                      child: GradientText(
                        'Locations',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 219, 219, 219),
                          Color.fromARGB(255, 136, 0, 255)
                        ]),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      // Apply animation to each section
                      const MainSection(),
                      const CompaniesSections(),
                      FeaturesSection(key: _featuresSectionKey),
                      StoriesSection(key: _storiesSectionKey),
                      AchievementsSection(key: _achievementsSectionKey),
                      PricingPage(key: _pricingPageKey),
                      IntegrationsSection(key: _integrationsSectionKey),
                      const FooterSection(),
                    ],
                  ),
                ))),
      ],
    ));
  }
}
