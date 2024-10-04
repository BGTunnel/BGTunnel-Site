import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/button_connect.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/logo_share.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../utils/connection_provider.dart';
import '../colors/colors.dart';
import 'backgroundMap.dart';

class HomePageIOS extends ConsumerStatefulWidget {
  const HomePageIOS({super.key});

  @override
  _HomePageIOSState createState() => _HomePageIOSState();
}

class _HomePageIOSState extends ConsumerState<HomePageIOS>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectionProvider);
    return Scaffold(
        body: Stack(children: [
      BackgroundMap(
        isConnected: isConnected,
      ),
      const LogoShare(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(
                      color: isConnected
                          ? AppColors.kPrimaryColor
                          : AppColors.kLightGray,
                      width: isConnected ? 3 : 1,
                    ),
                  ),
                  gradient: isConnected
                      ? LinearGradient(
                          colors: [
                            AppColors.kPrimaryColor.withAlpha(5),
                            AppColors.kInfoColor.withAlpha(5),
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : LinearGradient(
                          colors: [
                            AppColors.kBackgroundColorDark,
                            AppColors.kErrorColor.withAlpha(5),
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    HapticFeedback.selectionClick();
                                  },
                                  child: ListTileTheme(
                                      child: ListTile(
                                    title: Text(
                                      isConnected
                                          ? 'Australia'
                                          : 'South Africa',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: const Icon(Icons.arrow_right),
                                    leading: SvgPicture.asset(
                                      isConnected
                                          ? 'assets/Australia.svg'.toLowerCase()
                                          : 'assets/South Africa.svg'
                                              .toLowerCase()
                                              .replaceAll(' ', '-'),
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      HapticFeedback.selectionClick();
                                    },
                                  ))),
                              Divider(
                                  thickness: isConnected ? 0.3 : 0.2,
                                  height: isConnected ? 2 : 1.3,
                                  color: isConnected
                                      ? AppColors.kPrimaryColor
                                      : AppColors.kErrorColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: isConnected
                                            ? const LinearGradient(
                                                colors: [
                                                  AppColors.kPrimaryColor,
                                                  AppColors.kInfoColor,
                                                ],
                                                stops: [0.0, 0.5],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : const LinearGradient(colors: [
                                                AppColors.kAccentColor,
                                                AppColors.kErrorColor
                                              ])),
                                    child: IconButton(
                                      alignment: Alignment.center,
                                      iconSize: 25,
                                      color: AppColors.kTextColorDark,
                                      splashColor: AppColors.kWarningColor,
                                      highlightColor: AppColors.kDarkGray,
                                      mouseCursor: MouseCursor.uncontrolled,
                                      tooltip: "Setting",
                                      icon: SvgPicture.asset(
                                        'assets/setting.svg'
                                            .toLowerCase()
                                            .replaceAll(' ', '-'),
                                        fit: BoxFit.contain,
                                      ),
                                      onPressed: () {
                                        HapticFeedback.selectionClick();
                                      },
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: isConnected
                                            ? const LinearGradient(
                                                colors: [
                                                  AppColors.kPrimaryColor,
                                                  AppColors.kInfoColor,
                                                ],
                                                stops: [0.0, 0.5],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : const LinearGradient(colors: [
                                                AppColors.kAccentColor,
                                                AppColors.kErrorColor
                                              ])),
                                    child: IconButton(
                                      alignment: Alignment.center,
                                      iconSize: 25,
                                      color: AppColors.kTextColorDark,
                                      splashColor: AppColors.kErrorColor,
                                      highlightColor: AppColors.kDarkGray,
                                      mouseCursor: MouseCursor.uncontrolled,
                                      tooltip: "Statistic",
                                      icon: SvgPicture.asset(
                                        'assets/statistic.svg'
                                            .toLowerCase()
                                            .replaceAll(' ', '-'),
                                        fit: BoxFit.contain,
                                      ),
                                      onPressed: () {
                                        HapticFeedback.selectionClick();
                                      },
                                    ),
                                  ),
                                  const VerticalDivider(),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: ConnectButton(
                                glowingColor: isConnected
                                    ? AppColors.kPrimaryColor.withOpacity(0.6)
                                    : AppColors.kErrorColor,
                                onTap: () async {
                                  if (isConnected) {
                                    ref
                                        .read(connectionProvider.notifier)
                                        .updateConnectionStatus(!isConnected);
                                    _controller.reverse();
                                  } else {
                                    _controller.forward();
                                    ref
                                        .read(connectionProvider.notifier)
                                        .updateConnectionStatus(true);
                                  }
                                  setState(() {});
                                },
                                ringOutsideColor: isConnected
                                    ? AppColors.kPrimaryColor.withOpacity(0.6)
                                    : AppColors.kErrorColor,
                                colorRing: isConnected
                                    ? [
                                        AppColors.kPrimaryColor,
                                        Colors.purple,
                                        Colors.purpleAccent,
                                        Colors.blueAccent,
                                      ]
                                    : [
                                        Colors.deepOrange,
                                        Colors.deepOrange,
                                        Colors.deepOrange,
                                        Colors.deepOrange,
                                      ],
                                shadowColor: isConnected
                                    ? AppColors.kPrimaryColor.withOpacity(0.3)
                                    : Colors.transparent,
                                containerColor: isConnected
                                    ? AppColors.kPrimaryColor.withOpacity(0.6)
                                    : Colors.transparent,
                                iconValue: isConnected
                                    ? SvgPicture.asset(
                                        'assets/connected.svg',
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                      )
                                    : SvgPicture.asset(
                                        'assets/disconnect.svg',
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                      )))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
