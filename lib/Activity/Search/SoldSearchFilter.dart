import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class SoldSearchFilter extends StatefulWidget {
  const SoldSearchFilter({super.key});

  @override
  State<SoldSearchFilter> createState() => _SoldSearchFilterState();
}

class _SoldSearchFilterState extends State<SoldSearchFilter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MenuProvider>(context, listen: false).getFilterPropertiesType(context);
  }
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<MenuProvider>(context);
    final homepagedata = Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              //-------------------property type
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child:  postMdl.loading2?Center(
                  child: CircularProgressIndicator(),)
                    :  GridView.builder(
                      shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Display two columns
                    crossAxisSpacing: 2.0, // Horizontal spacing between grid items
                    mainAxisSpacing: 2.0, // Vertical spacing between grid items
                    childAspectRatio: 2, // Aspect ratio of each grid item
                  ),
                  itemCount: postMdl.getPropertiesType!.length,
                  itemBuilder: (context, i) {
                    final propertyType = postMdl.getPropertiesType[i];
                    return Container(
                      child: CheckboxListTile(
                        title: Text(propertyType.type.toString()),
                        value: propertyType.flag,
                        onChanged: ( newValue) {
                          setState(() {
                            postMdl.getPropertiesType[i].flag = newValue!;
                            print("hsfhdsfdhf"+postMdl.getPropertiesType[i].flag.toString());
                            var id=propertyType.id;
                            var type=propertyType.type;
                            print("hsfhdsfdhf"+id.toString()+type.toString());
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              ///--------------------price range
              Container(child: Text("Price Range : ",style: StyleClass.Red20style,)),
            ],
          ),
        ) ,
      ),
    );
  }



}
