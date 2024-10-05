import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';


class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 64,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              HoverImage(imagePath: 'assets/logo_hubspot.png'),
              HoverImage(imagePath: 'assets/logo_strapi.png'),
              HoverImage(imagePath: 'assets/logo_microsoft.png'),
              HoverImage(imagePath: 'assets/logo_google.png'),
              HoverImage(imagePath: 'assets/logo_airbnb.png'),
              HoverImage(imagePath: 'assets/logo_fedex.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverImage extends StatefulWidget {
  final String imagePath;

  const HoverImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: _isHovered ? 36 : 28, // Increase size on hover
        child: Image.asset(widget.imagePath),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
