import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late final List<Marker> _markers;

  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    _markers = [
      LatLng(-6.4503364, 107.0048695),
    ]
        .map(
          (markerPosition) => Marker(
            point: markerPosition,
            width: 40,
            height: 40,
            builder: (_) => const Icon(
              Icons.location_on,
              size: 40,
              color: Colors.black,
            ),
            anchorPos: AnchorPos.align(
              AnchorAlign.top,
            ),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(-6.4503364, 107.0048695),
              zoom: 13,
              maxZoom: 18,
              onTap: (_, __) => _popupLayerController.hideAllPopups(),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.app',
              ),
              PopupMarkerLayerWidget(
                options: PopupMarkerLayerOptions(
                  initiallySelectedMarkers: [
                    _markers.first,
                  ],
                  popupAnimation: const PopupAnimation.fade(
                      duration: Duration(milliseconds: 500)),
                  selectedMarkerBuilder: (context, marker) {
                    return const Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                    );
                  },
                  popupController: _popupLayerController,
                  markers: _markers,
                  markerRotateAlignment:
                      PopupMarkerLayerOptions.rotationAlignmentFor(
                          AnchorAlign.top),
                  popupBuilder: (BuildContext context, Marker marker) {
                    return ExamplePopup(marker);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExamplePopup extends StatefulWidget {
  final Marker marker;

  const ExamplePopup(this.marker, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplePopupState();
}

class _ExamplePopupState extends State<ExamplePopup> {
  final List<IconData> _icons = [
    Icons.star_border,
    Icons.star_half,
    Icons.star
  ];
  int _currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => setState(() {
          _currentIcon = (_currentIcon + 1) % _icons.length;
        }),
        child: _cardDescription(context),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Rumah Pak Maryana',
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                fontFamily: GoogleFonts.openSans().fontFamily,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              '${widget.marker.point.latitude}, ${widget.marker.point.longitude}',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: GoogleFonts.openSans().fontFamily,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              'Klapanunggal, Bojong, Klapanunggal, Bogor Regency, West Java 16710',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: GoogleFonts.openSans().fontFamily,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
            ),
            ElevatedButton(
              // open in google maps
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                  widget.marker.point.latitude,
                  widget.marker.point.longitude,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.map_outlined),
                  Text(
                    'Buka di Google Maps',
                    style: TextStyle(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
