import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:realstateproject/Utils/StyleClass.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile",style: StyleClass.blackstyle,),
        actions:[
          Container(width: 30,height: 30,margin: EdgeInsets.all(5),
              child: Icon(Icons.logout,color: Colors.red,)),
        ]
      ),
      body: ListView(
        children: [
           Center(
            child: Container(
              child: Text("User Name"),
            ),
          ),
            Center(
            child: Container(
              child: Text("User@gmail.com"),
            ),
          ),
            Stack(
              children:[
                Center(
                 child: Container(
            height: 220,
            width: 180,
            margin: EdgeInsets.only(left: 5),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider("https://avatar.iran.liara.run/public/boy?username=Ash"),),
            ),
              ),
                Positioned(
                  top: 10,
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.edit))
            ]
         ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Text("5.0"),
                      Icon(Icons.star,color: Colors.amber,)
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Text("245.0"),
                      Text("Review"),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Text("112.0"),
                      Text("Sold"),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
            height: 1,
            color: Colors.grey,
          )
        ] ,
      ),
    );
  }
}
