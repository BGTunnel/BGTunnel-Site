import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';

import '../design_systems/components/responsive_row_column.dart';
import '../shared/custom_appbar.dart';
import '../utils/breakpoint.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int faqLength = 6;
    int columnSizes = 1;
    int rowSizes = faqLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = faqLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
      columnSizes = 2;
      rowSizes = faqLength ~/ columnSizes;
    }

    return MaxContainer(
      border: BorderRadius.circular(20),
      child: Container(
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.only(top: 20, bottom: 20)
            : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
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
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
          rowSpacing: 32,
          children: const [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _FAQList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FAQList extends StatelessWidget {
  const _FAQList();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqData = [
      {
        'question': 'What is Bgtunnel VPN?',
        'answer':
            'Bgtunnel VPN encrypts your internet connection, ensuring privacy and security.'
      },
      {
        'question': 'How can I install Bgtunnel VPN?',
        'answer':
            'You can install Bgtunnel VPN from our official website or app stores.'
      },
      {
        'question': 'Does Bgtunnel VPN affect internet speed?',
        'answer':
            'Your connection might slow down slightly due to encryption and server distance.'
      },
      {
        'question': 'Can I use Bgtunnel VPN on multiple devices?',
        'answer':
            'Yes, Bgtunnel VPN supports multiple devices like phones, tablets, and desktops.'
      },
      {
        'question': 'Is there a free version of Bgtunnel VPN?',
        'answer':
            'Bgtunnel VPN offers a free vpn, but you need a premium subscription for long-term use.'
      },
      {
        'question': 'How do I contact customer support?',
        'answer':
            'You can reach us via the support page or by email at support@bgtunnel.com.'
      },
    ];

    return Column(
      children: faqData.map((faq) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Card(
            elevation: 2,
            shadowColor: Colors.black.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.blueAccent.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.blueAccent,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapHeaderToExpand: true,
                      hasIcon: true,
                      expandIcon: Icons.keyboard_arrow_down,
                      collapseIcon: Icons.keyboard_arrow_up,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        faq['question']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent.shade700,
                        ),
                      ),
                    ),
                    collapsed: const SizedBox.shrink(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        faq['answer']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(
                            crossFadePoint: 0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
