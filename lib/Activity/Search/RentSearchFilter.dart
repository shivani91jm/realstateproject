import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class RentSearchFilter extends StatefulWidget {
  const RentSearchFilter({super.key});

  @override
  State<RentSearchFilter> createState() => _RentSearchFilterState();
}

class _RentSearchFilterState extends State<RentSearchFilter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MenuProvider>(context, listen: false).getFilterPropertiesType(context);
  }
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<MenuProvider>(context);
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
                child:  postMdl.loading2?Center(
                  child: CircularProgressIndicator(),)
                    :  GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Display two columns

                    childAspectRatio: 2, // Aspect ratio of each grid item
                  ),
                  itemCount: postMdl.getPropertiesType!.length,
                  itemBuilder: (context, i) {
                    final propertyType = postMdl.getPropertiesType[i];
                    return Container(
                      child: Column(
                        children: [
                          CheckboxListTile(
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

                        ],
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

