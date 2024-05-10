import 'package:flutter/material.dart';
import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Models/FilterModel/FilterModelClass.dart';
import 'package:realstateproject/Models/homemenu/Data.dart';
import 'package:realstateproject/Models/homepage/Blogs.dart';
import 'package:realstateproject/Models/homepage/BlogsData.dart';
import 'package:realstateproject/Models/homepage/Data.dart';
import 'package:realstateproject/Models/homepage/ExploreAllThings.dart';
import 'package:realstateproject/Models/homepage/HomepageModelClass.dart';
import 'package:realstateproject/MutipleProvidersss/ApiHandle/Services.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageModel? data;
  FilterModelClass? datadd;
  bool loading= false;
  Services _services=Services();
  HomePageModel? get dddd => data;
  bool get loadingdata=> loading;
  List<ExploreAllThings> explorethingList =[];
  List<BlogsData>? blogs=[];
  bool menuLayout= false;
  bool get menuLayoutsggg => menuLayout;
  List<Datasss> menuLayoutData = [];
  Future<void> getHomePageDatass(BuildContext context) async {
      loading =true;
      data= await _services.ShowHomePageData(context);
      loading= false;
      if(data!.data!.isNotEmpty)
      {
        for(int i=0;i<data!.data!.length;i++)
        {
          explorethingList  = data!.data![i].exploreAllThings!;
          blogs =data!.data![i].blogs!.blogs;
        }
      }
      notifyListeners();
  }
  //---------------------filter data-------------------

  Future<void> getHomePageFilterMenu(BuildContext context,String property_type) async {
    loading =true;
    datadd= await _services.SearchPageData(context,property_type);
    loading= false;
    if(datadd!.properties!.data!.isNotEmpty)
    {
      for(int i=0;i<datadd!.properties!.data!.length;i++)
      {
        menuLayoutData = datadd!.properties!.data!;
      }
    }
    notifyListeners();
  }
  void setMenuLayout(bool value) {
    menuLayout = value;
    notifyListeners();
  }

}

