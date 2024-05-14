

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Models/homemenu/Data.dart';
import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/MenuLayoutWidget.dart';
import 'package:realstateproject/Widgets/SearchAppWidget.dart';
class FilterSearchDetailsPage extends StatefulWidget {
List<Datasss> data;
List<Data> dss;
   FilterSearchDetailsPage({super.key,required this.data,required this.dss});
  @override
  State<FilterSearchDetailsPage> createState() => _FilterSearchDetailsPageState();
}
class _FilterSearchDetailsPageState extends State<FilterSearchDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SearchAppWidget(),
          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount:widget.dss.length,
                itemBuilder: (context, i) {
                  return builderFilter(widget.dss[i],context);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child:   ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.data.length,
              itemBuilder: (context, i) {
                return MenuLayout(ddddd: widget.data[i],);
              },
            ),
          ),
        ],
      )
    );
  }
  Widget builderFilter(Data filtername,BuildContext context) {
    return GestureDetector(
      onTap: (){
        var id= filtername.id;
        Provider.of<HomePageProvider>(context,listen: false).getHomePageFilterMenu(context,id.toString());
        Provider.of<HomePageProvider>(context,listen: false).setMenuLayout(true);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            child: Text(filtername.name.toString(),style: StyleClass.textformstyle,),
          ),
        ),
      ),
    );
  }
}
