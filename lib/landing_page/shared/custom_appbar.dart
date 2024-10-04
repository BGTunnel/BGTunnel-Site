import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomResponsiveAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final bool isScrolled;

  const CustomResponsiveAppBar({
    super.key,
    required this.title,
    required this.actions,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AppBar(
      backgroundColor: isScrolled ? Colors.black : Colors.transparent,
      elevation: 0,
      title: isMobile
          ? title
          : Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  children: [
                    title,
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
}

class CustomDrawer extends StatelessWidget {
  final List<Widget> menuItems;

  const CustomDrawer({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const SizedBox.shrink()
        : Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ...menuItems.map((item) => ListTile(
                      title: item,
                      onTap: () {
                        // Handle navigation or scrolling
                        Navigator.pop(context); // Close drawer after clicking
                      },
                    )),
              ],
            ),
          );
  }
}
