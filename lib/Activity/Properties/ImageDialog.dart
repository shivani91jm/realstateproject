import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:realstateproject/Models/PropertyModelDetails/PropertyImages.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
class ImageDialog extends StatelessWidget {
  final List<PropertyImages> images;
  final int initialIndex;
  ImageDialog({required this.images, this.initialIndex = 0});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        title:  Align(alignment: Alignment.topRight,
          child: IconButton(icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        content: Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor.withOpacity(0.20)),
                 child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Carousel(
                      images: images?.map((url) => NetworkImage(Urls.main_url+url.image.toString())).toList(),
                    )
                 ),
              ),

            ],
          ),
        ));
  }
}