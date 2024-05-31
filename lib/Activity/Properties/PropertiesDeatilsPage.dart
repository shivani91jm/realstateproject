import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/Properties/AdminChatDialog.dart';
import 'package:realstateproject/Activity/Properties/PropertiesDetailsWidget.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';


import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';

import 'package:realstateproject/Utils/StyleClass.dart';

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
      physics: BouncingScrollPhysics(),
      children: [
        Propertiesdetailswidget(propertyDetailsModelClass: homepagedata.propertyDetailsModelClass!,cameraPosition: cameraPosition, googleMapController: _googleMapController,),
        //-------------chat admin details-----------------
           Container(
              child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(15)),
               ),
             child: GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyFormDialog(slug: widget.slug,);
                  },
                );
              },
              child: Container(
                color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.only(left: 10,),
                          child: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(Urls.main_url+homepagedata.propertyDetailsModelClass!.property!.admin!.image.toString()),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(homepagedata.propertyDetailsModelClass!.property!.admin!.name.toString(),style: StyleClass.text17),
                              Row(
                                children: [
                                  Icon(Icons.location_on,  color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),size: 15,),
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child: Text(homepagedata.propertyDetailsModelClass!.property!.admin!.address.toString(),style: StyleClass.textformstyle),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.chat),
                    ),
                  ],
                ),
              ),
            ),
          )
        )
      ]);
  }
}
