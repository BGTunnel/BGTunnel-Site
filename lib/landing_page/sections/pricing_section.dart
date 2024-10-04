import 'package:flutter/material.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsivePricingCards();
  }
}

class ResponsivePricingCards extends StatelessWidget {
  const ResponsivePricingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 800;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 56.0),
              const Text(
                "Flexible Pricing Plans",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              isWideScreen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPricingCards(),
                    )
                  : Column(
                      children: _buildPricingCards(),
                    ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildPricingCards() {
    return [
      _buildPricingCard(
        title: "Basic Plan",
        price: "FREE",
        description: "For individuals",
        features: [
          "Basic server locations",
          "Standard encryption methods",
          "Monthly data cap of 10GB"
        ],
        textColor: Colors.white,
        buttonColor: Colors.blue,
        cardWidth: 250.0,
      ),
      const SizedBox(width: 16.0, height: 16.0),
      _buildPricingCard(
        title: "Premium Plan",
        price: "\$5/Month",
        description: "For Streamers & Gamers",
        features: [
          "Access to BGTunnel with V2Ray support",
          "Expanded server locations",
          "Priority customer support",
          "Monthly data cap of 1TB"
        ],
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        textColor: Colors.white,
        buttonColor: Colors.white,
        cardWidth: 270.0,
      ),
      const SizedBox(width: 16.0, height: 16.0),
      _buildPricingCard(
        title: "Ultimate Plan",
        price: "\$39.99/Year",
        description: "For agencies and larger teams",
        features: [
          "Unlimited server locations",
          "Premium 24/7 customer support",
          "No data cap",
          "Support for unlimited devices"
        ],
        textColor: Colors.white,
        buttonColor: Colors.blue,
        cardWidth: 250.0,
      ),
    ];
  }

  Widget _buildPricingCard({
    required String title,
    required String price,
    required String description,
    required List<String> features,
    Color? backgroundColor,
    required Color textColor,
    LinearGradient? gradient,
    required Color buttonColor,
    required double cardWidth,
  }) {
    return GestureDetector(
        onTap: () {
          // Handle card tap
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Glass effect
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            width: cardWidth,
            height: 500,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: gradient == null ? backgroundColor : null,
              gradient: gradient,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features
                      .map(
                        (feature) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: textColor,
                                size: 20.0,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ));
  }
}
