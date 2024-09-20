import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard_admin/helpers/services/title_service.dart';
import '../sections/footer_section.dart';
import '../shared/custom_appbar.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would send the contact form data to the backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting form...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TitleService.setTitle('BGTunnel - Contact Us');
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomResponsiveAppBar(
        isScrolled: false,
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
              // Navigate to other sections like Features, Pricing, etc.
            },
            child: Text('Features', style: GoogleFonts.lato()),
          ),
          TextButton(
            onPressed: () {
              // Scroll to relevant sections
            },
            child: Text('Stories', style: GoogleFonts.lato()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contact Us',
                style:
                    GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'We would love to hear from you! If you have any questions, feedback, or need support, feel free to contact us using the form below.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 18),
              ),
              const SizedBox(height: 40),
              _buildContactForm(screenWidth),
              const SizedBox(height: 20),
              const FooterSection(), // Your footer section, optional
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm(double screenWidth) {
    // Calculate form width dynamically based on screen width
    double formWidth = screenWidth > 1200
        ? screenWidth * 0.4 // Large screen (desktop)
        : screenWidth > 800
            ? screenWidth * 0.6 // Medium screen (tablet)
            : screenWidth * 0.9; // Small screen (mobile)

    return Center(
      child: Container(
        width: formWidth,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
