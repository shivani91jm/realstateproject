import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/FilterModel/CityFilterModel.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';

class AddressSearch extends SearchDelegate<CityFilterModel> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () async {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () async {
        query = '';
        //close(context, snapshot.data![index]);
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    
    return  Consumer<MenuProvider>(builder: (context,provider,child){
      return FutureBuilder<List<CityFilterModel>>(
        future: provider.getHomePageFilterCity(context, query),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<CityFilterModel?>? suggestions = snapshot.data!;
            return  ListView.separated(
              itemBuilder: (context, index) => ListTile(
                onTap: () async{
                  var cityid=suggestions[index]!.id.toString();
                  provider.getHomePageFilterMenu(context,"","","",cityid,"","");
                },
                title: Container(
                  child: Row(
                      children: [
                      Icon(Icons.location_on,color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width*.7,
                        child: Text(suggestions[index]!.name.toString(),
                        style: TextStyle(
                            color: GradientHelper.getColorFromHex(ColorClass.blue),
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),)),
                )
                ],
              ),
            )),
          itemCount: suggestions!.length,
          separatorBuilder: (BuildContext context, int index) {
          return Divider(
          height: 1,
          color: Colors.grey[300],
          );
          },
          ) ;
        }
        },
      );
    });
      
      
      
      
      
      
      
      
      
     
  }

}
