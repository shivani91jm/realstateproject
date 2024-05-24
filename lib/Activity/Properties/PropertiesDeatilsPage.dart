import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/Properties/PropertiesDetailsWidget.dart';

import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';

class PropertiesDetails extends StatefulWidget {
  var slug;
   PropertiesDetails({super.key,required this.slug});

  @override
  State<PropertiesDetails> createState() => _PropertiesDetailsState();
}

class _PropertiesDetailsState extends State<PropertiesDetails> {
  var isLoading=true;
  late GoogleMapController mapController;
  var latitude='';
  var longitude='';
  CameraPosition? cameraPosition;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Completer<GoogleMapController> _googleMapController=Completer();
  late LatLng _defaultLatLong;
  late LatLng _draggedLatLong;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    Provider.of<HomePageProvider>(context, listen: false).getPropertiesetails(context,widget.slug);


  }
  void init() {
    _defaultLatLong=LatLng(26.299265689617403 ,-80.27699558507642);
    _draggedLatLong=_defaultLatLong;
    cameraPosition=CameraPosition(target: _defaultLatLong, zoom: 15.5);
  }

  @override
  Widget build(BuildContext context) {
    final homepagedata= Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children:[
          homepagedata.loading2?  Center(child: Container(child: CircularProgressIndicator(),),):loadData(homepagedata),
        ]
      ),
    );
  }
  Widget loadData(HomePageProvider homepagedata){
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [

        Propertiesdetailswidget(propertyDetailsModelClass: homepagedata.propertyDetailsModelClass!,cameraPosition: cameraPosition, googleMapController: _googleMapController,),


      ],
    );
  }
}
