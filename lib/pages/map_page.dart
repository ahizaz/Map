import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController>_controller = Completer();
    static final CameraPosition _googlePlex = const CameraPosition(target: LatLng(23.7808875, 90.4043122),zoom: 14.4746);
    List<Marker>_marker = [];
    final List<Marker>_list=const[
      Marker(markerId: MarkerId('1'),
      position: LatLng(23.7808875, 90.4043122),
      infoWindow: InfoWindow(
        title: 'My position'
      )
      ),
      Marker(markerId: MarkerId('2'),
      position: LatLng(23.7937, 90.4066),
      infoWindow:InfoWindow(
        title:'Banani',
      )
      )
    ];
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GoogleMap(initialCameraPosition: _googlePlex,
                 markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
          },
          
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.location_disabled_outlined),onPressed: ()async{
          GoogleMapController controller =await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(35.6762, 139.6503),
          zoom: 14
          )
          ));
          setState(() {
            
          });

        }),
    );
  }
}