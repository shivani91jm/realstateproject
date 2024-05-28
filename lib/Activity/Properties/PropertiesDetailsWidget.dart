import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realstateproject/Activity/Properties/ImageDialog.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/PropertyModelDetails/PropertyImages.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';

import '../../Models/PropertyModelDetails/PropertyDetailsModelClass.dart';
class Propertiesdetailswidget extends StatelessWidget {
  final PropertyDetailsModelClass propertyDetailsModelClass;
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? cameraPosition;
   Propertiesdetailswidget({super.key,required this. propertyDetailsModelClass,required this.googleMapController,required this.cameraPosition});

  //var loadingPercentage = 0;
  var _isLoading=true;
  @override
  Widget build(BuildContext context) {
    List<PropertyImages>? propertiesimages=   propertyDetailsModelClass!.property!.propertyImages;
    return Container(
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ImageDialog(
                        images: propertiesimages!,
                      );
                    },
                  );
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3,1.0],
                          colors: [Colors.transparent,
                            GradientHelper.getColorFromHex(ColorClass.blue)]
                      )
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: Urls.main_url+propertyDetailsModelClass.property!.bannerImage.toString(),fit:BoxFit.cover,
                      placeholder: (context, url) => Center(
                          child: Container(height: 20, width: 20,child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(CommonUtilsClass.removeHtmlTags(propertyDetailsModelClass.property!.title.toString()),style: StyleClass.redstyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$"+propertyDetailsModelClass.property!.price.toString(),style: StyleClass.bluestyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( CommonUtilsClass.removeHtmlTags(propertyDetailsModelClass.property!.description.toString()),
                        maxLines: 4,
                        style: StyleClass.textformstyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15,bottom: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('View More', style: StyleClass.text14
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            //----------room and bedroom ------------
              Container(
                padding: EdgeInsets.only(bottom: 10,top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:ColorClass.lightYellowColors
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                                children: [
                                  Icon(Icons.bedroom_parent, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfRoom+" Room", style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                                children: [
                                  Icon(Icons.bathroom_sharp, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfBedroom+" Bedroom", style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),

                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Divider(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ),
                    //-------------kitchen and floor
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10,),
                            child: Row(
                                children: [
                                  Icon(Icons.kitchen_rounded, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfKitchen+" Kitchen",style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Row(
                                children: [
                                  Icon(Icons.room_preferences_sharp, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfBathroom+" Bathrrom",
                                      style: StyleClass.blacktext16,
                                    ),
                                  )
                                ])
                        ),

                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Divider(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10,),
                            child: Row(
                                children: [
                                  Icon(Icons.room_preferences_sharp, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfFloor+" floor",
                                      style: StyleClass.blacktext16,
                                    ),
                                  )
                                ])
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 30,),
                            child: Row(
                                children: [
                                  Icon(Icons.kitchen_rounded, color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.numberOfParking+" Parking",style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),


                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Divider(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10,),
                            child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.transactionType+" Type of Ownership",
                                      style: StyleClass.blacktext16,
                                    ),
                                  )
                                ])
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 30,),
                            child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.ageOfConstruction+" Age of Construction",style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Divider(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10,),
                            child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.furnishedStatus+" Finish Status",
                                      style: StyleClass.blacktext16,
                                    ),
                                  )
                                ])
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 30,),
                            child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(""+propertyDetailsModelClass.property!.area+"Capet Area",style: StyleClass.blacktext16,),
                                  )
                                ])
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 300,
                  child: _getMap(googleMapController!,cameraPosition! )
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _getMap(Completer<GoogleMapController> _googleMapController,CameraPosition cameraPosition ) {
    return Container(
      height: 200,
      child: GoogleMap(
        mapType: MapType.normal,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller){
          if(!_googleMapController.isCompleted){
            _googleMapController.complete(controller);
          }
        },
        onCameraMove: (CameraPosition  cameraPosition){
         // _draggedLatLong = cameraPosition.target;
        },
        onCameraIdle: (){

        },
        initialCameraPosition: cameraPosition!,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }

}
