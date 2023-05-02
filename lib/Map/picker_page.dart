import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({super.key});

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

// const kGoogleApiKey = '';
final homeScaffolKey = GlobalKey<ScaffoldState>();

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  // static const CameraPosition initialCameraPosition =
  //     CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 14);
  // Set<Marker> markersList = {};
  // final Mode _mode = Mode.overlay;
  late GoogleMapController googleMapController;
  // void onMapCreated(GoogleMapController controller) {
  //   googleMapController = controller;
  // }

  final LatLng center = const LatLng(10.7845214, 106.6625973);

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffolKey,
      appBar: AppBar(
        title: Text('Tìm Kiếm'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: center, zoom: 15.0),
        onMapCreated: onMapCreated,

        // GoogleMap(
        //   // mapType: MapType.normal,
        //   // myLocationEnabled: true,
        //   // myLocationButtonEnabled: false,
        //   // initialCameraPosition: CameraPosition(
        //   //   target: _target,
        //   //   zoom: 15,
        //   // ),
        //   initialCameraPosition: initialCameraPosition,
        //   myLocationEnabled: true,
        //   markers: markersList,
        //   mapType: MapType.normal,
        //   onMapCreated: (GoogleMapController controller) {
        //     googleMapController = controller;
        //   },
        // ),
        //  ElevatedButton(onPressed: _handlePressButton, child: Text("Tim kiem"))
      ),
    );
  }

  // Future<void> _handlePressButton() async {
  //   Prediction? p = await PlacesAutocomplete.show(
  //       context: context,
  //       apiKey: kGoogleApiKey,
  //       // onError: onError,
  //       mode: _mode,
  //       language: 'en',
  //       strictbounds: false,
  //       types: [""],
  //       decoration: InputDecoration(
  //           hintText: 'Tim kiem',
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20),
  //               borderSide: BorderSide(color: Colors.white))),
  //       components: [Component(Component.country, "pk")]);

  //   displayPrediction(p!, homeScaffolKey.currentState);
  // }

  // Future<void> displayPrediction(
  //     Prediction p, ScaffoldState? currentState) async {
  //   GoogleMapsPlaces places = GoogleMapsPlaces(
  //       apiKey: kGoogleApiKey,
  //       apiHeaders: await const GoogleApiHeaders().getHeaders());
  //   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
  //   final lat = detail.result.geometry!.location.lat;
  //   final lng = detail.result.geometry!.location.lng;

  //   markersList.clear();
  //   markersList.add(Marker(
  //       markerId: const MarkerId("0"),
  //       position: LatLng(lat, lng),
  //       infoWindow: InfoWindow(title: detail.result.name)));
  //   setState(() {});
  //   googleMapController
  //       .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  // }
  // void onError(PlacesAutocompleteResponse response) {
  // }
}
