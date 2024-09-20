import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';

class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 64,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              Image.asset('assets/logo_hubspot.png', height: 28),
              Image.asset('assets/logo_strapi.png', height: 28),
              Image.asset('assets/logo_microsoft.png', height: 28),
              Image.asset('assets/logo_google.png', height: 28),
              Image.asset('assets/logo_airbnb.png', height: 28),
              Image.asset('assets/logo_fedex.png', height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
