import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/Properties/PropertiesDetailsWidget.dart';
import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
class PropertiesDetails extends StatefulWidget {
  var slug;
   PropertiesDetails({super.key,required this.slug});

  @override
  State<PropertiesDetails> createState() => _PropertiesDetailsState();
}

class _PropertiesDetailsState extends State<PropertiesDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false).getPropertiesetails(context,widget.slug);

  }
  @override
  Widget build(BuildContext context) {
    final homepagedata= Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: homepagedata.loading2?  Center(child: Container(child: CircularProgressIndicator(),),):Propertiesdetailswidget(propertyDetailsModelClass: homepagedata.propertyDetailsModelClass!,),
        ),
      ),
    );
  }
}
