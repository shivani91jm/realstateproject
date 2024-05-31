import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';
class BuySearchFilter extends StatefulWidget {
  const BuySearchFilter({super.key});
  @override
  State<BuySearchFilter> createState() => _BuySearchFilterState();
}

class _BuySearchFilterState extends State<BuySearchFilter> {
  int? selectedValue;
  var propertyTypeId="";
  var priceMin="",priceMax="";
  var bedrommMin="",bedroomMax="";
  var bathroomMin="",bathroomMax="";
  var aminityId="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MenuProvider>(context, listen: false).getFilterPropertiesType(context);
    Provider.of<MenuProvider>(context, listen: false).getFilterPropertiesTypeByGroup(context);
  }
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          //-------------------property type
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20),
              child: Text("Property Type  ",style: StyleClass.Black20style,)),
          Container(
           margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),

            child:  postMdl.loading2?Center(
              child: CircularProgressIndicator(),)
                :  GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                   physics: BouncingScrollPhysics(),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 2,
              ),
              itemCount: postMdl.getPropertiesType!.length,
              itemBuilder: (context, i) {
                final propertyType = postMdl.getPropertiesType[i];
                return Container(
                  margin: EdgeInsets.only(top: 10,bottom: 0),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                     color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                  ),
                  child: CheckboxListTile(
                    title: Text(propertyType.type.toString(),style: TextStyle(
                      color: Colors.black
                    ),),
                    value: propertyType.flag,
                    onChanged: ( newValue) {
                      setState(() {
                        postMdl.getPropertiesType[i].flag = newValue!;
                        print("hsfhdsfdhf"+postMdl.getPropertiesType[i].flag.toString());
                        propertyTypeId=propertyType.id;
                        var type=propertyType.type;
                        print("hsfhdsfdhf"+propertyTypeId.toString()+type.toString());
                      });
                    },
                  ),
                );
              },
            ),
          ),
          ///--------------------price range-----------------------
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
              child: Text("Price Range : ",style: StyleClass.Red20style,)),
          Container(
              margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)),
           Row(
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10),
                 padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                 ),
                         child: DropdownButton<String>(
                           hint: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Center(child: Text('Minimum Price')),
                           ),
                           value: postMdl.priceselectedMinValue,
                           onChanged: (newValue) {
                             setState(() {
                              postMdl.priceselectedMinValue = newValue;
                              priceMin=postMdl.priceselectedMinValue.toString();
                             });
                           },
                           items: postMdl.priceListMin.map<DropdownMenuItem<String>>((String value) {
                             return DropdownMenuItem<String>(
                                value: value,
                               child: Text(value),
                             );
                           }).toList(),
                         ),
                       ),
               Container(
                 margin: EdgeInsets.only(left: 10),
                 padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                 ),
                 child: DropdownButton<String>(
                   hint: Text('Maximum Price'),
                   value: postMdl.priceselectedMaxValue,
                   onChanged: (newValue) {
                     setState(() {
                       postMdl.priceselectedMaxValue = newValue;
                       priceMax = postMdl.priceselectedMaxValue.toString();
                     });
                   },
                   items: postMdl.priceListMax.map<DropdownMenuItem<String>>((String value) {
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(value),
                       ),
                     );
                   }).toList(),
                 ),
               ),
             ],
           ),
          //----------------------Bedrooms----------------------------------
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
              child: Text("Bedrooms: ",style: StyleClass.Red20style,)),
          Container(
              margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                ),
                child: DropdownButton<String>(
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Minimum Room')),
                  ),
                  value: postMdl.bedroomMinValue,
                  onChanged: (newValue) {
                    setState(() {
                      postMdl.bedroomMinValue = newValue;
                      bedrommMin=postMdl.bedroomMinValue.toString();
                    });
                  },
                  items: postMdl.bedroomListMin.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                ),
                child: DropdownButton<String>(
                  hint: Text('Maximum Room'),
                  value: postMdl.bedroomMaxValue,
                  onChanged: (newValue) {
                    setState(() {
                      postMdl.bedroomMaxValue = newValue;
                      bedroomMax=postMdl.bedroomMaxValue.toString();
                    });
                  },
                  items: postMdl.bedroomListMax.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          //-------------------------------Bathrooms------------------
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
              child: Text("Bathrooms: ",style: StyleClass.Red20style,)),
          Container(
              margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                ),
                child: DropdownButton<String>(
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Min Bathrooms')),
                  ),
                  value: postMdl.BathroomsMinValue,
                  onChanged: (newValue) {
                    setState(() {
                      postMdl.BathroomsMinValue = newValue;

                    });
                  },
                  items: postMdl.BathroomsListMin.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                ),
                child: DropdownButton<String>(
                  hint: Text('Max Bathrooms'),
                  value: postMdl.BathroomsMaxValue,
                  onChanged: (newValue) {
                    setState(() {
                      postMdl.BathroomsMaxValue = newValue;
                    });
                  },
                  items: postMdl.BathroomsListMax.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          //------------------------Land Size-----------
          //-----------------------New or established property-----------
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
              child: Text("New or established property: ",style: StyleClass.Red20style,)),
          Container(
              margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile<String>(
                title: Text('All types'),
                value: '1',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('New'),
                value: '2',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Established'),
                value: '3',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
            ],
          ),
          //----------group vale---------
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),

            child:  postMdl.loading3?Center(
              child: CircularProgressIndicator(),)
                : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: postMdl.groupList.length,
              itemBuilder: (BuildContext context, int index) {
                final valuedata = postMdl.groupList[index];
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
                          child: Text(valuedata.categoryName.toString(),style: StyleClass.Red20style,)),
                      Container(
                          margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
                          child: Divider(height: 1,color: Colors.grey[400],)
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Display two columns
                          crossAxisSpacing: 2.0, // Horizontal spacing between grid items
                          mainAxisSpacing: 2.0, // Vertical spacing between grid items
                          childAspectRatio: 2, // Aspect ratio of each grid item
                        ),
                        itemCount:valuedata.aminities!.length,
                        itemBuilder: (context, i) {
                          final propertyType = valuedata.aminities![i];
                          return Container(
                            margin: EdgeInsets.only(top: 10,bottom: 0),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: GradientHelper.getColorFromHex(ColorClass.lightEditText)
                            ),
                            child: CheckboxListTile(
                              title: Text(propertyType.aminity.toString(),style: TextStyle(
                                  color: Colors.black
                              ),),
                              value: propertyType.flag,
                              onChanged: ( newValue) {
                                setState(() {
                                  propertyType.flag = newValue!;
                                  postMdl.getPropertiesType[i].flag= propertyType.flag;
                                  print("hsfhdsfdhf"+postMdl.getPropertiesType[i].flag.toString());
                                  var id=propertyType.id;
                                  var type=propertyType.aminity;
                                  aminityId=id.toString();
                                  print("hsfhdsfdhf"+id.toString()+type.toString());
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //-----------sale method------------
          Container(margin: EdgeInsets.only(top: 20,left: 10,bottom: 20,right: 10),
              child: Text("Sale Method: ",style: StyleClass.Red20style,)),
          Container(
              margin: EdgeInsets.only(top: 0,left: 10,bottom: 20,right: 10),
              child: Divider(height: 1,color: Colors.grey[400],)
          ),
          Column(
            children: [
              RadioListTile<String>(
                title: Text('All types'),
                value: '1',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Private treate sale '),
                value: '2',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Auction'),
                value: '3',
                groupValue: postMdl.establishedpropertyValue,
                onChanged: (value) {
                  setState(() {
                    postMdl.establishedpropertyValue = value;
                  });
                },
              ),
            ],
          ),
          //------------------------------------submit
          Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(10,30,10,30),
              decoration: BoxDecoration(
                color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                borderRadius: BorderRadius.circular(10), // Adjust the radius to your preference
              ),
              child: CustomButton(
                // onPressed: () async {
                //   var price="",no_room="",purpose_type="";
                //   if(priceMin!="" || bedroomMax!="" || propertyTypeId!="" ||aminityId!="") {
                //     if (priceMin != "" && priceMax != "") {
                //       priceMin = priceMin.replaceAll('\$', '');
                //       print(priceMin);
                //       priceMax = priceMax.replaceAll('\$', '');
                //       print(priceMax);
                //
                //       price = priceMin.toString() + ":" + priceMax.toString();
                //     }
                //     if (bedrommMin != "" && bedroomMax != "") {
                //       no_room = bedrommMin.toString() + ":" + bedroomMax.toString();
                //     }
                //   }
                //   else
                //     {
                //         purpose_type="2";
                //     }
                //
                // Provider.of<MenuProvider>(context,listen: false).getHomePageFilterMenu(context,price,no_room,purpose_type,"",propertyTypeId,aminityId);
                // },
                title: ContentText.submit,
                colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR), size: 15,
              )
          ),
        ],
      ),
    );
  }



}

