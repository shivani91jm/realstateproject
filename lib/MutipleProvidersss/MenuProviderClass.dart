import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/Search/FilterSearchDetailsPage.dart';
import 'package:realstateproject/Models/FilterModel/CityFilterModel.dart';

import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Models/FilterModel/FilterModelClass.dart';
import 'package:realstateproject/Models/FilterModel/PropertyType.dart';
import 'package:realstateproject/Models/Search/AninitiesData.dart';
import 'package:realstateproject/Models/Search/GetPropertiesType.dart';
import 'package:realstateproject/Models/Search/SearchAminity.dart';
import 'package:realstateproject/Models/Search/SearchFilter.dart';
import 'package:realstateproject/Models/homemenu/Data.dart';
import 'package:realstateproject/Models/homemenu/HomeMenu.dart';
import 'package:realstateproject/MutipleProvidersss/ApiHandle/Services.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';

class MenuProvider extends ChangeNotifier {
   late MenuModelClass data;
   late SearchFilter searchProperties;
   late AminitiesModel aminitiesModel;
   bool loading = false;
   bool loading2 = false;
   bool loading3 = false;
   Services _services = Services();
   List<GetPropertiesType> getPropertiesType=[];
   bool get dloading => loading;
   final List<String> priceListMin = ['\$20', '\$149', '\$277'];
   final List<String> priceListMax = ['\$30', '\$300', '\$405'];
   final List<String> bedroomListMin = ['1', '2', '3','4','5','up to 6'];
   final List<String> bedroomListMax = ['1', '2', '3','4','5','up to 6'];
   final List<String> BathroomsListMin = ['1', '2', '3','4','5','up to 6'];
   final List<String> BathroomsListMax = ['1', '2', '3','4','5','up to 6'];
    List<AminityData> groupList = [];
   String? priceselectedMinValue;
   String? priceselectedMaxValue;
   String? bedroomMinValue;
   String? bedroomMaxValue;
   String? BathroomsMinValue;
   String? BathroomsMaxValue;
   String? selectedGroup;
   String? selectedIndexGroup;
   String? establishedpropertyValue;
   FilterModelClass? datadd;
   Services services = Services();
   CityFilterModel? searchListCity;
   List<Datasss> menuLayoutData = [];
   getMenuData(context) async {
    loading = true;
    data = await services.ShowMenuList(context);
    loading = false;
    notifyListeners();
  }
   void  getFilterPropertiesType(context) async {
   loading2 = true;
   searchProperties = await services.getFilterPropertiesType(context);
   loading2 = false;
   List<PropertyType>? propertyType=searchProperties.propertyTypes;
   if(propertyType!=null) {
     getPropertiesType.clear();
     for (int i = 0; i < propertyType!.length; i++) {
       var id = propertyType[i].id;
       var types = propertyType[i].type;
       GetPropertiesType getPropertiesTypeddd = GetPropertiesType(
           id: id.toString(), type: types, flag: false);
       getPropertiesType.add(getPropertiesTypeddd);
     }
   }
   notifyListeners();
 }
 void  getFilterPropertiesTypeByGroup(context) async {
   loading3 = true;
   aminitiesModel = await services.getFilterPropertiesTypeGroupValue(context);
   loading3 = false;
   groupList =aminitiesModel.data!;
   notifyListeners();
 }
   //---------------------filter data-------------------
   Future<void> getHomePageFilterMenu(BuildContext context,String price_range,String no_room,String propose_type,city_id,properties_type,aminityId) async {
     loading =true;
     datadd= await _services.AllFilterSearchPageData(context,price_range,no_room,propose_type,city_id,properties_type,aminityId);
     loading= false;
     if(datadd!.properties!.data!.isNotEmpty)
     {
       for(int i=0;i<datadd!.properties!.data!.length;i++)
       {
         menuLayoutData = datadd!.properties!.data!;

       }
       if(menuLayoutData.length>0)
         {
           Data datas= Data(id: 1, name: price_range.toString(), type: null);
           List<Data> dd=[];
           dd.add(datas);
           Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => FilterSearchDetailsPage(data: menuLayoutData, dss: dd,), // Navigate to your main screen
             ),
           );
         }
     }
     else
       {
         print("no data found");
       }
     notifyListeners();
   }

//-----------city wise filter-------------------------------


  Future<void> getHomePageFilterCity(context,keyword) async{
    loading =true;
    searchListCity= await _services.getFilterCityName(context, keyword);
    loading= false;
    if(datadd!.properties!.data!.isNotEmpty)
    {
      for(int i=0;i<datadd!.properties!.data!.length;i++)
      {
        menuLayoutData = datadd!.properties!.data!;

      }
      // if(menuLayoutData.length>0)
      // {
      //   Data datas= Data(id: 1, name: price_range.toString(), type: null);
      //   List<Data> dd=[];
      //   dd.add(datas);
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => FilterSearchDetailsPage(data: menuLayoutData, dss: dd,), // Navigate to your main screen
      //     ),
      //   );
      // }
    }
    else
    {
      print("no data found");
    }
    notifyListeners();
  }
}
