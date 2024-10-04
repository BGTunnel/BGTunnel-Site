import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class BackgroundMap extends StatefulWidget {
  final bool isConnected;
  const BackgroundMap({
    super.key,
    required this.isConnected,
  });

  @override
  _BackgroundMapState createState() => _BackgroundMapState();
}

class _BackgroundMapState extends State<BackgroundMap>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late MapZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior(
        toolbarSettings: const MapToolbarSettings(
          direction: Axis.vertical,
          position: MapToolbarPosition.bottomRight,
        ),
        enableDoubleTapZooming: false,
        maxZoomLevel: 7,
        minZoomLevel: 7);
  }

  @override
  void didUpdateWidget(covariant BackgroundMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isConnected != widget.isConnected) {
      setState(() {
        // Trigger a rebuild when isConnected changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuilding BackgroundMap with isConnected: ${widget.isConnected}');
    _zoomPanBehavior.focalLatLng = widget.isConnected
        ? const MapLatLng(
            -25.2744,
            133.7751,
          )
        : const MapLatLng(-30.5595, 22.9375);
    return SfMaps(
      layers: [
        MapShapeLayer(
            dataLabelSettings: MapDataLabelSettings(
                textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                    color: widget.isConnected
                        ? AppColors.kInfoColor.withOpacity(0.1)
                        : AppColors.kDarkGray.withOpacity(0.1))),
            loadingBuilder: (context) {
              return Center(
                child: LoadingAnimationWidget.fallingDot(
                  color: AppColors.kPrimaryColor,
                  size: 30,
                ),
              );
            },
            source: const MapShapeSource.asset(
              'assets/world_map.json',
              shapeDataField: 'name',
              dataCount: 1,
            ),
            color: widget.isConnected
                ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)
                : AppColors.kDarkGray.withOpacity(0.1),
            showDataLabels: true,
            strokeWidth: 0.1,
            strokeColor: widget.isConnected
                ? AppColors.kTextColorDark.withOpacity(0.2)
                : AppColors.kTextColorDark.withOpacity(0.1),
            initialMarkersCount: 1,
            zoomPanBehavior: _zoomPanBehavior,
            markerTooltipBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.isConnected
                              ? 'You are connected to '
                              : 'Your connection Exposed ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.surface),
                        ),
                        TextSpan(
                          text: widget.isConnected ? 'Australia' : 'Singapore',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.surface),
                        ),
                      ],
                    ),
                  ));
            },
            markerBuilder: (context, index) {
              return widget.isConnected
                  ? MapMarker(
                      latitude: -25.2744,
                      longitude: 133.7751,
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: LoadingAnimationWidget.beat(
                          color: AppColors.kPrimaryColor,
                          size: 20,
                        ),
                      ),
                    )
                  : MapMarker(
                      latitude: -30.5595,
                      longitude: 22.9375,
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: LoadingAnimationWidget.beat(
                          color: AppColors.kPrimaryColor,
                          size: 20,
                        ),
                      ),
                    );
            }),
      ],
    );
  }
}
