import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/custom_toast.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'dart:html' as html;
import '../design_systems/components/gradient_text.dart';

class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 34,
            runSpacing: 22,
            alignment: WrapAlignment.center,
            children: [
              Tooltip(
                  message: 'Download Android',
                  child: HoverImage(
                    imagePath: 'assets/android.svg',
                    title: 'Android',
                    onTap: () {
                      html.window.open(
                          "https://play.google.com/store/apps/details?id=com.app.bgtunnel",
                          '_blank');
                    },
                  )),
              Tooltip(
                  message: 'Download iOS',
                  child: HoverImage(
                      imagePath: 'assets/apple.svg',
                      title: 'iOS',
                      onTap: () {
                        html.window.open(
                            "https://apps.apple.com/us/app/bgtunnel-secure-vpn-privacy/id6608970030",
                            '_blank');
                      })),
              Tooltip(
                  message: 'Platform macOS still under development',
                  child: HoverImage(
                    imagePath: 'assets/mac.svg',
                    title: 'macOS',
                    onTap: () {
                      CustomToast.show(
                          context,
                          "Platform macOS still under development",
                          ToastType.error);
                    },
                  )),
              Tooltip(
                  message: 'Platform Windwows still under development',
                  child: HoverImage(
                    imagePath: 'assets/windows.svg',
                    title: 'Windwows',
                    onTap: () {
                      CustomToast.show(
                          context,
                          "Platform Windwows still under development",
                          ToastType.error);
                    },
                  )),
              Tooltip(
                  message: 'Platform Android TV still under development',
                  child: HoverImage(
                    imagePath: 'assets/tv.svg',
                    title: 'Android TV',
                    onTap: () {
                      CustomToast.show(
                          context,
                          "Platform Android TV still under development",
                          ToastType.error);
                    },
                  )),
              Tooltip(
                  message: 'Platform Chrome still under development.',
                  child: HoverImage(
                    imagePath: 'assets/chrome.svg',
                    title: 'Chrome',
                    onTap: () {
                      CustomToast.show(
                          context,
                          "Platform Chrome still under development",
                          ToastType.error);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverImage extends StatefulWidget {
  final void Function() onTap;
  final String imagePath;
  final String title;
  const HoverImage(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.onTap})
      : super(key: key);

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
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 80, width: 120, // Increase size on hover
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered
                  ? Colors.deepPurple
                  : Colors.transparent, // Border color on hover
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRect(
                child: SvgPicture.asset(
                  widget.imagePath,
                  height: 30,
                ),
              ),
              GradientText(
                widget.title,
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 255, 156, 156),
                  Color.fromARGB(255, 255, 206, 157)
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
