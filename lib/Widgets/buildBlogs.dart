import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class buildBlogs extends StatelessWidget {
  var blogimg;
   var propertiesTitle; var prodes;
   buildBlogs({super.key,required this.blogimg,required this.propertiesTitle,required this.prodes});

  @override
  Widget build(BuildContext context) {
    return



      Container(
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
          child: Column(
            children: [
              Container(
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
                    imageUrl: Urls.main_url+blogimg,fit:BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: Container(height: 20, width: 20,child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(CommonUtilsClass.removeHtmlTags(propertiesTitle),style: StyleClass.bluestyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( CommonUtilsClass.removeHtmlTags(prodes),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
