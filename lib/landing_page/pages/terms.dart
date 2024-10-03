import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/title_service.dart';
import '../sections/footer_section.dart';
import '../shared/custom_appbar.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TitleService.setTitle('BGTunnel - Terms & Conditions');
    return SelectionArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomResponsiveAppBar(
          isScrolled: false, // Update this with actual scrolled state if needed
          title: Row(
            children: [
              Image.asset('assets/logo.png', height: 32, width: 32),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  onPressed: () {
                    context.go('/');
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
                _scrollToIndex(0);
              },
              child: Text(
                'Features',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToIndex(1);
              },
              child: Text(
                'Stories',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToIndex(2);
              },
              child: Text(
                'Achievements',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToIndex(3);
              },
              child: Text(
                'Pricing',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToIndex(4);
              },
              child: Text(
                'Integrations',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // drawer: Responsive.isMobile(context) ? const CustomDrawerMenu() : null,
        body: SingleChildScrollView(
          controller: ScrollController(), // Add controller if needed
          child: Column(
            children: [
              _termsSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _termsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
      child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to BGTunnel\'s website and V2Ray client application ("we", "us", or "our"). By accessing or using our website and the V2Ray client application ("the Services"), you agree to comply with and be bound by the following Terms and Conditions ("Terms"). If you do not agree with these Terms, please do not use our website or the Services. These Terms govern your use of our Services, including any updates, enhancements, or modifications.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '1. Acceptance of Terms',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'By accessing and using our website and V2Ray client application, you accept and agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree to these Terms, please do not use the Services.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '2. Use of the Services',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'You agree to use the Services only for lawful purposes and in accordance with these Terms. You are responsible for ensuring that your use of the Services does not violate any applicable laws or regulations.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '3. User Responsibilities',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'You agree not to:\n\n'
                '• Engage in any activity that could harm or disrupt the Services.\n'
                '• Use the Services to transmit or distribute any harmful, illegal, or unauthorized content.\n'
                '• Attempt to gain unauthorized access to any systems or networks related to the Services.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '4. Intellectual Property',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'All content, trademarks, and other intellectual property related to the Services are owned by us or our licensors. You are granted a limited, non-exclusive, non-transferable license to use the Services for personal or internal purposes only.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '5. Limitation of Liability',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'To the fullest extent permitted by law, we disclaim all liability for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of the Services.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '6. Indemnification',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'You agree to indemnify and hold us harmless from any claims, liabilities, damages, losses, or expenses (including reasonable attorneys\' fees) arising out of your use of the Services or any violation of these Terms.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '7. Changes to Terms',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We may update these Terms from time to time. Any changes will be posted on this page, and your continued use of the Services after such changes constitutes your acceptance of the new Terms.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '8. Termination',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We reserve the right to terminate or suspend your access to the Services at our sole discretion, without notice, for any reason, including if we believe you have violated these Terms.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                '9. Contact Us',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'If you have any questions or concerns about these Terms, please contact us at:\n'
                'support@bgtunnel.com',
                style: GoogleFonts.lato(fontSize: 16),
              ),
            ],
          )),
    );
  }

  void _scrollToIndex(int index) {
    // Implement the scrolling logic here
  }
}
