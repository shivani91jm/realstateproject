import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';
import 'package:realstateproject/Utils/StyleClass.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  Size get preferredSize => Size.fromHeight(200.0);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
       child:  AppBar(
        flexibleSpace:  Column(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight:Radius.circular(250),
                    ),
                    child: Container(
                      width: 280.0,
                      height: 300,
                      color: GradientHelper.getColorFromHex(ColorClass.lightGrey_COLOR),
                      child:  Text(''),
                    ),
                  ),
                  Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                                              Container(
                          margin: EdgeInsets.only(right: 70,top: 50),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200), // Adjust the radius to your preference
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(AppImages.ic1_url,height: 20,width: 20, // Provide path to your image asset
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Real Estate", style: TextStyle(
                                    color:GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                                    fontFamily: FontFamilyClass.fontfamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),),
                              ),
                            ],
                          ),),
                            Container(
                              margin: EdgeInsets.only(right: 0,top: 50),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green, // Border color
                                        width: 2, // Border width
                                      ), // Adjust the radius to your preference
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(Icons.notifications_none,color: Colors.red,),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.menu,size: 35,  color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),),
                                    onPressed: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                  ),

                                ],
                              ),
                            ),
                          ],),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: EdgeInsets.only(left:40 ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Hey, ",style: StyleClass.blackstyle,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Text("User",style: StyleClass.redstyle,),
                                    )
                                  ],
                                ),
                                Text("Let's start exploring ",style: StyleClass.blackstyle,)
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
