import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard_admin/helpers/services/title_service.dart';
import '../sections/footer_section.dart';
import '../shared/custom_appbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TitleService.setTitle('BGTunnel - About Us');
    return SelectionArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomResponsiveAppBar(
          isScrolled: false, // Update this with actual scrolled state if needed
          title: Row(
            children: [
              Image.asset('assets/logo.png', height: 32, width: 32),
              const SizedBox(width: 10),
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
          controller: ScrollController(),
          child: Column(
            children: [
              _aboutUsSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutUsSection() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'BGTunnel VPN with V2Ray Protocol',
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'BGTunnel is a leading VPN service provider, dedicated to delivering enhanced privacy and security to our users. Built on the powerful V2Ray protocol, '
                'our VPN ensures that users can enjoy unrestricted and anonymous internet access, even in the most challenging environments.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Why Choose BGTunnel?',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '• **V2Ray Protocol**: BGTunnel leverages the V2Ray protocol to offer cutting-edge proxy services. This enables users to bypass firewalls, censorship, and surveillance with ease, '
                'all while maintaining a high level of security and flexibility.\n'
                '• **Global Server Network**: We offer a wide range of server locations around the world, allowing users to access content from any region, at any time.\n'
                '• **Privacy and Security**: BGTunnel is committed to your privacy. With strong encryption and a strict no-logging policy, your online activities remain private and secure.\n'
                '• **Seamless Integration**: Our VPN is designed to work smoothly with various platforms and applications, making it an easy-to-use tool for everyday internet browsing or specialized needs.\n'
                '• **User-Centric**: We listen to our users and continuously improve our service based on feedback, ensuring a world-class VPN experience for everyone.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Our Mission',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'At BGTunnel, our mission is to empower individuals with a secure and unrestricted internet experience. We believe in the freedom to browse the internet '
                'without limitations and aim to protect users from the ever-growing threats of cybercrime and surveillance.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Customer Support',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'We are dedicated to providing our users with the best support possible. Our customer support team is available 24/7 to assist you with any issues you may encounter.',
                style: GoogleFonts.lato(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Contact Us',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'For more information or assistance, feel free to contact us at support@bgtunnel.com. We are always here to help!',
                style: GoogleFonts.lato(fontSize: 16),
              ),
            ],
          ),
        ));
  }

  void _scrollToIndex(int index) {
    // Implement the scrolling logic here
  }
}
