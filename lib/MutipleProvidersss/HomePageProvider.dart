import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/Properties/PropertiesDeatilsPage.dart';
import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Models/FilterModel/FilterModelClass.dart';
import 'package:realstateproject/Models/PropertyModelDetails/PropertyDetailsModelClass.dart';

import 'package:realstateproject/Models/homepage/BlogsData.dart';

import 'package:realstateproject/Models/homepage/ExploreAllThings.dart';
import 'package:realstateproject/Models/homepage/HomepageModelClass.dart';
import 'package:realstateproject/MutipleProvidersss/ApiHandle/Services.dart';

import '../Models/PropertyModelDetails/Property.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageModel? data;
  FilterModelClass? datadd;
  PropertyDetailsModelClass? propertyDetailsModelClass;
  bool loading= false;
  bool loading2= false;
  Services _services=Services();
  HomePageModel? get dddd => data;
  bool get loadingdata=> loading;
  List<ExploreAllThings> explorethingList =[];
  List<BlogsData>? blogs=[];
  bool menuLayout= false;
  bool get menuLayoutsggg => menuLayout;
  List<Datasss> menuLayoutData = [];
  Property? property;


  Future<void> getHomePageDatass(BuildContext context) async {
    explorethingList.clear();
      loading =true;
      data= await _services.ShowHomePageData(context);
      loading= false;
      if(data!.data!.isNotEmpty)
      {
        if(data!.data!.length>0) {
          for (int i = 0; i < data!.data!.length; i++) {
            explorethingList = data!.data![i].exploreAllThings!;
            blogs = data!.data![i].blogs!.blogs;
          }
        }
        else
          {
            print("no data found00");
          }
      }
      else
        {
          print("no data found00");
        }
      notifyListeners();
  }
  //---------------------filter data-------------------

  Future<void> getHomePageFilterMenu(BuildContext context,String property_type) async {
    loading =true;
    datadd= await _services.SearchPageData(context,property_type);
    menuLayoutData.clear();
    loading= false;
    if(datadd!.properties!.data!.isNotEmpty)
    {
      for(int i=0;i<datadd!.properties!.data!.length;i++)
      {
        menuLayoutData = datadd!.properties!.data!;
      }
    }
    else
      {
        print("no data found");
      }
    notifyListeners();
  }
  void setMenuLayout(bool value) {
    menuLayout = value;
    notifyListeners();
  }
   Future<void> getPropertiesetails(BuildContext con,String slug) async {
     loading2 =true;
      propertyDetailsModelClass= await _services.PropertiesDetailsData(con,slug);
      property= propertyDetailsModelClass!.property;
      loading2= false;
      notifyListeners();

    }

}

