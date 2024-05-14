import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class MenuLayout extends StatelessWidget {
   Datasss ddddd;
   MenuLayout({super.key,required this.ddddd});
   @override
   Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(bottom: 20,right: 5,left: 4),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child:  Container(
          color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3,1.0],
                          colors: [Colors.transparent, GradientHelper.getColorFromHex(ColorClass.blue)]
                      )
                  ),
                  child: Stack(
                    children:[
                      Container(
                        height: 180,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: Urls.main_url+ddddd.bannerImage.toString(),fit:BoxFit.cover,
                            placeholder: (context, url) => Center(
                                child: Container(height: 20, width: 20,child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // gradient: LinearGradient(
                                //     begin: Alignment.topCenter,
                                //     end: Alignment.bottomCenter,
                                //     stops: [0.3,1.0],
                                //     colors: [Colors.transparent, GradientHelper.getColorFromHex(ColorClass.blue)]
                                // )
                                color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 10.0,bottom: 8.0,top: 8.0),
                              child: Text(ddddd.propertyPurpose!.purpose.toString(),style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),))
                    ] ,
                  ),
                ),
                Container(
                  color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(CommonUtilsClass.removeHtmlTags(ddddd.title.toString()),style: StyleClass.Black20style),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child:   Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.add_location_sharp,color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),),
                            Expanded(
                              child: Text(ddddd.address.toString(),
                                style: StyleClass.textformstyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text(" Price : "),
                            Text(" \$"+ddddd.price.toString(),
                              maxLines: 4,
                              style: StyleClass.text17,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text(" Capet area."),
                            Text(ddddd.price.toString()+"Sqft",
                              maxLines: 4,
                              style: StyleClass.text17,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ] ),
        ),
      ),
    );
  }
}
