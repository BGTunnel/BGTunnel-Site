import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class IntegrationsSection extends StatelessWidget {
  const IntegrationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: _Description(),
            ),
            SizedBox(height: 48), // Added space between description and map
            AspectRatio(
              aspectRatio: 3, // Adjust the aspect ratio based on design needs
              child: MapMarkerPage(), // MapServer widget to show the map
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Easy to Connect with 1700+ Servers',
      subtitle:
          'Effective tools for bypassing censorship and securing online privacy are crucial for maintaining freedom of information.',
    );
  }
}

/// Renders the world clock marker map widget
class MapMarkerPage extends StatefulWidget {
  const MapMarkerPage({super.key});

  @override
  _MapMarkerPageState createState() => _MapMarkerPageState();
}

class _MapMarkerPageState extends State {
  late List<_ServersDetails> _worldServerData;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    super.initState();

    _worldServerData = <_ServersDetails>[
      _ServersDetails('South Africa', -30.5595, 22.9375), // South Africa
      _ServersDetails('Australia', -25.2744, 133.7751), // Australia
      _ServersDetails('Brazil', -14.2350, -51.9253), // Brazil
      _ServersDetails('Hong Kong', 22.3964, 114.1095), // Hong Kong
      _ServersDetails('United States', 37.0902, -95.7129), // United States
      _ServersDetails('India', 20.5937, 78.9629), // India
      _ServersDetails('Ireland', 53.4129, -8.2439), // Ireland
      _ServersDetails('Japan', 36.2048, 138.2529), // Japan
      _ServersDetails('Italy', 41.8719, 12.5674), // Italy
      _ServersDetails('South Korea', 35.9078, 127.7669), // South Korea
      _ServersDetails('Mexico', 23.6345, -102.5528), // Mexico
      _ServersDetails('Netherlands', 52.3676, 4.9041), // Netherlands
      _ServersDetails('Norway', 60.4720, 8.4689), // Norway
      _ServersDetails('Poland', 51.9194, 19.1451), // Poland
      _ServersDetails('Qatar', 25.276987, 51.520008), // Qatar
      _ServersDetails('Spain', 40.4637, -3.7492), // Spain
      _ServersDetails('Sweden', 60.1282, 18.6435), // Sweden
      _ServersDetails(
          'United Arab Emirates', 23.4241, 53.8478), // United Arab Emirates
      _ServersDetails('United Kingdom', 55.3781, -3.4360), // United Kingdom
      _ServersDetails('Canada', 56.1304, -106.3468), // Canada
      _ServersDetails('Germany', 51.1657, 10.4515), // Germany
      _ServersDetails('France', 46.6034, 1.8883), // France
      _ServersDetails('Pakistan', 30.3753, 69.3451), // Pakistan
      _ServersDetails('Saudi Arabia', 23.8859, 45.0792), // Saudi Arabia
      _ServersDetails('Singapore', 1.3521, 103.8198), // Singapore
      _ServersDetails('Israel', 31.0461, 34.8516), // Israel
      _ServersDetails('Switzerland', 46.8182, 8.2275), // Switzerland
      _ServersDetails('Qatar #2', 25.276987,
          51.520008), // Qatar (duplicate for demonstration)
      _ServersDetails('United Kingdom #2', 55.3781,
          -3.4360), // United Kingdom (duplicate for demonstration)
      _ServersDetails('Singapore #2', 1.3521,
          103.8198) // Singapore (duplicate for demonstration)
    ];

    _mapSource = const MapShapeSource.asset(
      // Path of the GeoJSON file.
      'assets/world_map.json',
      // Field or group name in the .json file to identify
      // the shapes.
      //
      // Which is used to map the respective shape to
      // data source.
      shapeDataField: 'name',
    );
  }

  @override
  void dispose() {
    _worldServerData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SfMaps(
        layers: <MapLayer>[
          MapShapeLayer(
            showDataLabels: false,
            tooltipSettings: const MapTooltipSettings(
              color: Color.fromRGBO(45, 45, 45, 1),
            ),
            strokeColor: Colors.deepPurple,
            loadingBuilder: (BuildContext context) {
              return const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
            },
            source: _mapSource,
            initialMarkersCount: _worldServerData.length,
            markerTooltipBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  _worldServerData[index].countryName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              );
            },
            markerBuilder: (_, int index) {
              return MapMarker(
                longitude: _worldServerData[index].longitude,
                latitude: _worldServerData[index].latitude,
                alignment: Alignment.topCenter,
                offset: const Offset(0, -4),
                size: const Size(150, 150),
                child: _ServerWidget(
                    countryName: _worldServerData[index].countryName),
              );
            },
            strokeWidth: 0,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

class _ServerWidget extends StatefulWidget {
  const _ServerWidget({
    Key? key,
    required this.countryName,
  }) : super(key: key);

  final String countryName;

  @override
  _ServerWidgetState createState() => _ServerWidgetState();
}

class _ServerWidgetState extends State<_ServerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 8,
            height: 8,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
        ),
        Text(
          widget.countryName,
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _ServersDetails {
  _ServersDetails(this.countryName, this.latitude, this.longitude);

  final String countryName;
  final double latitude;
  final double longitude;
}
// class MapServer extends ConsumerStatefulWidget {
//   const MapServer({super.key});

//   @override
//   _MapServerState createState() => _MapServerState();
// }

// class _MapServerState extends ConsumerState<MapServer> {
//   late MapShapeSource mapSource;
//   late List<_TimeDetails> _worldClockData;
//   @override
//   void initState() {
//     super.initState();
//     mapSource = const MapShapeSource.asset(
//       'assets/world_map.json', // Add the GeoJSON file to your assets folder
//       shapeDataField: 'name',
//     );
//     _fetchMarkers(); // Fetch markers on initialization
//   }

//   Future<void> _fetchMarkers() async {
//     final jsonData = [
//       {"name": "South Africa", "address": "4.221.60.243"},
//       {"name": "Australia", "address": "20.42.220.37"},
//       {"name": "Brazil", "address": "191.235.86.71"},
//       {"name": "Hong Kong", "address": "40.83.122.22"},
//       {"name": "United States", "address": "20.228.249.211"},
//       {"name": "India", "address": "74.225.188.192"},
//       {"name": "Ireland", "address": "52.169.27.133"},
//       {"name": "Japan", "address": "48.218.160.250"},
//       {"name": "Italy", "address": "4.232.162.127"},
//       {"name": "South Korea", "address": "52.231.97.210"},
//       {"name": "Mexico", "address": "158.23.81.224"},
//       {"name": "Netherlands", "address": "168.63.108.160"},
//       {"name": "Norway", "address": "4.219.15.140"},
//       {"name": "Poland", "address": "20.215.241.164"},
//       {"name": "Qatar", "address": "20.173.66.64"},
//       {"name": "Spain", "address": "68.221.204.29"},
//       {"name": "Sweden", "address": "20.91.225.232"},
//       {"name": "United Arab Emirates", "address": "20.233.68.69"},
//       {"name": "United Kingdom", "address": "172.166.227.23"},
//       {"name": "United States #2", "address": "20.25.205.37"},
//       {"name": "India #2", "address": "194.195.115.144"},
//       {"name": "Canada", "address": "20.220.29.122"},
//       {"name": "Germany", "address": "20.52.162.167"},
//       {"name": "France", "address": "162.19.64.18"},
//       {"name": "France #2", "address": "37.187.67.97"},
//       {"name": "Pakistan", "address": "38.60.217.7"},
//       {"name": "Saudi Arabia", "address": "154.205.134.51"},
//       {"name": "Singapore", "address": "51.79.173.217"},
//       {"name": "Israel", "address": "20.217.216.51"},
//       {"name": "Switzerland", "address": "23.166.88.71"},
//       {"name": "Qatar #2", "address": "20.173.73.142"},
//       {"name": "United Kingdom #2", "address": "172.166.106.92"},
//       {"name": "Singapore #2", "address": "20.198.241.32"}
//     ];

//     final List<MapLatLng> fetchedMarkers = [];

//     for (var item in jsonData) {
//       try {
//         final latLong = await getLatLongFromIp(item['address']!);
//         fetchedMarkers.add(MapLatLng(latLong['lat']!, latLong['lon']!));
//       } catch (e) {
//         debugPrint("Error fetching location for ${item['address']}: $e");
//       }
//     }

//     // Update the state with the new markers
//     setState(() {
//       markers.addAll(fetchedMarkers);
//     });
//   }

//   Future<Map<String, double>> getLatLongFromIp(String ip) async {
//     final response = await http.get(Uri.parse('http://ip-api.com/json/$ip'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == 'fail') {
//         throw Exception('Failed to get location for IP: $ip');
//       }
//       return {
//         'lat': data['lat'],
//         'lon': data['lon'],
//       };
//     } else {
//       throw Exception('Failed to load location data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SfMaps(
//       layers: [
//         MapShapeLayer(
//           source: mapSource,
//           showDataLabels: false,
//           dataLabelSettings: const MapDataLabelSettings(
//             textStyle: TextStyle(color: Colors.black, fontSize: 10),
//           ),
//           strokeWidth: 1,
//           strokeColor: Colors.deepPurple,
//           markerBuilder: (context, index) {
//             final marker = markers[index];
//             return MapMarker(
//               latitude: marker.latitude,
//               longitude: marker.longitude,
//               child: Center(
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.red),
//                 ),
//               ),
//             );
//           },
//           // If using a custom builder, `initialMarkersCount` might not be necessary
//           initialMarkersCount: markers.length,
//         ),
//       ],
//     );
//   }
// }

// Dummy MaxContainer widget (replace with your actual implementation)
class MaxContainer extends StatelessWidget {
  final Widget child;

  const MaxContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}

// Dummy LabelWithDescription widget (replace with your actual implementation)
class LabelWithDescription extends StatelessWidget {
  final String title;
  final String subtitle;

  const LabelWithDescription({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.displayMediumBold),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: AppTextStyles.bodyMediumSemiBold,
        ),
      ],
    );
  }
}

// Dummy AppTextStyles class (replace with your actual implementation)
class AppTextStyles {
  static const displayMediumBold =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const bodyMediumSemiBold =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
}
