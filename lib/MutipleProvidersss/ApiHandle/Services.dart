import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:realstateproject/Models/FilterModel/CityFilterModel.dart';
import 'package:realstateproject/Models/FilterModel/FilterModelClass.dart';
import 'package:realstateproject/Models/PropertyModelDetails/PropertyDetailsModelClass.dart';
import 'package:realstateproject/Models/Search/SearchAminity.dart';
import 'package:realstateproject/Models/Search/SearchFilter.dart';
import 'package:realstateproject/Models/homemenu/HomeMenu.dart';
import 'package:realstateproject/Models/homepage/HomepageModelClass.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';

class Services {
  Future<MenuModelClass> ShowMenuList(context) async {
    late MenuModelClass data;
    try {
        var url= Urls.home_menu;
        print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = MenuModelClass.fromJson(item);
        print("dshdhsdhhsd"+item.toString());
        print('Error Occurredgg'+data.toString());
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv11'+e.toString());
    }
    return data;
  }
  Future<HomePageModel>ShowHomePageData(context) async {
    late HomePageModel data;
    try {
      var url= Urls.home_api;
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = HomePageModel.fromJson(item);
        print("dshdhsdhhsd"+item.toString());
        print('Error Occurredgg'+data.toString());
      }
      else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv12'+e.toString());
    }
    return data;
  }
  Future<FilterModelClass>SearchPageData(context,properties) async {
    late FilterModelClass data;
    try {
      var url= Urls.filter_api+"page_type=list_view&search=&price_range=&number_of_room=&purpose_type=${properties}&sorting_id=3";
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print("dshdhsdhhsdfdfdf"+item.toString());
        data = FilterModelClass.fromJson(item);

      //  print('Error Occurredgg'+data.toString());
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv13'+e.toString());
    }
    return data;
  }
  Future<SearchFilter>getFilterPropertiesType(context) async
  {
    late SearchFilter data;
    try {
      var url= Urls.BaseURL;
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print("dshdhsdhhsdfdfdf"+item.toString());
        data = SearchFilter.fromJson(item);

        //  print('Error Occurredgg'+data.toString());
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv14'+e.toString());
    }
    return data;
  }
  Future<AminitiesModel>getFilterPropertiesTypeGroupValue(context) async
  {
    late AminitiesModel data;
    try {
      var url= Urls.group_api;
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print("dshdhsdhhsdfdfdf"+item.toString());
        data = AminitiesModel.fromJson(item);

        //  print('Error Occurredgg'+data.toString());
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv15'+e.toString());
    }
    return data;
  }
//-----------------------------filter all ---------------------
  Future<FilterModelClass>AllFilterSearchPageData(context,price_range,number_of_room,purpose_type,city_id,properties_type,aminity) async {
    late FilterModelClass data;
    try {
      var url= Urls.filter_api+"page_type=list_view&search=&price_range=${price_range}&number_of_room=${number_of_room}&purpose_type=${purpose_type}&city_id=${city_id}&property_type=${properties_type}&aminity=${aminity}";
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print("dshdhsdhhsdfdfdf"+item.toString());
        data = FilterModelClass.fromJson(item);

        //  print('Error Occurredgg'+data.toString());
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurredcvccv16'+e.toString());
    }
    return data;
  }
  //---------------------get city name---------------
  Future<List<CityFilterModel>> getFilterCityName(context,keyword) async
  {
    List<CityFilterModel>? data;
    try {
      var url= Urls.filterCity_api+keyword;
      print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        data= parseLocations(response.body);
      } else {
        throw Exception('Failed to load locations');
      }
    } catch (e) {
      print('Error Occurredcvccv17'+e.toString());
    }
    return data!;

  }
  List<CityFilterModel> parseLocations(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CityFilterModel>((json) => CityFilterModel.fromJson(json)).toList();
  }
  Future<PropertyDetailsModelClass?> PropertiesDetailsData(context,slug) async {
    late  PropertyDetailsModelClass data;
    try {
      var url= Urls.propperty_details_api+slug;
       print("res body"+url.toString());
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print("dshdhsdhhsdfdfdf"+item.toString());
        data = PropertyDetailsModelClass.fromJson(item);

        //  print('Error Occurredgg'+data.toString());
      } else {
           print('Error Occurred');
      }
    } catch (e) {
        print('Error Occurredcvccv'+e.toString());
    }
    return data;
  }



}