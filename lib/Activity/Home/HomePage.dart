import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/FilterModel/Datassss.dart';
import 'package:realstateproject/Models/MenuModels.dart';
import 'package:realstateproject/Models/homemenu/Data.dart';
import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomAppBar.dart';
import 'package:realstateproject/Widgets/MenuLayoutWidget.dart';
import 'package:realstateproject/Widgets/buildBlogs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuModels> pertories=getMenus();
  bool _isExpanded = false;
  int _maxLines=0;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
TextEditingController controller=TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<MenuProvider>(context, listen: false).getMenuData(context);
    Provider.of<HomePageProvider>(context,listen: false).getHomePageDatass(context);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
     Widget build(BuildContext context) {
    final postMdl = Provider.of<MenuProvider>(context);
    final homepagedata= Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280.0),
        child: CustomAppBar(controller: controller,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              //-----------------menu ----------------------
              Padding(
                padding:  EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 50,
                      child: Stack(
                        children: [
                          postMdl.loading? Center(child: CircularProgressIndicator(),):
                          ListView.builder(
                              physics: BouncingScrollPhysics(),
                               scrollDirection: Axis.horizontal,
                            itemCount: postMdl.data!.data!.length,
                            itemBuilder: (context, i) {
                              return builderFilter(postMdl.data!.data![i],context);
                            },
                          )
                        ],
                      ),
                    )),

                  ],
                ),
              ),
              if(homepagedata.menuLayout==true)...{
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:  homepagedata.loading?Center(
                    child: CircularProgressIndicator(),)
                      :homepagedata.menuLayoutData!= null &&
                      homepagedata.menuLayoutData!.isNotEmpty? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: homepagedata.menuLayoutData!.length,
                    itemBuilder: (context, i) {
                      return MenuLayout(ddddd: homepagedata.menuLayoutData[i],);
                    },
                  ): Center(child: Container(margin:EdgeInsets.all(20),child: Text("No data found",style: StyleClass.Black20style,)),),),
              }
              else ...
                {
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 30,left: 10,right: 5),
                    child:  homepagedata.loading?Center(
                      child: CircularProgressIndicator(),)
                        :  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: homepagedata.explorethingList.length,
                      itemBuilder: (context, i) {
                        return buildProperty(homepagedata.explorethingList[i].img.toString(),homepagedata.explorethingList[i].title.toString(),homepagedata.explorethingList[i].desc.toString());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lasted Properties : ",style: StyleClass.Red20style,),
                        Container(
                          margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 5),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("View All",style: StyleClass.text14,)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:  homepagedata.loading?Center(
                      child: CircularProgressIndicator(),)
                        :  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: homepagedata.blogs!.length,
                      itemBuilder: (context, i) {
                        return buildBlogs(blogimg: homepagedata.blogs![i]!.image.toString(),propertiesTitle: homepagedata.blogs![i]!.title.toString(), prodes: homepagedata.blogs![i]!.description.toString(),);
                      },
                    ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your Real Estate Guide ",style: StyleClass.text17,),
                        Text("View All ",style: StyleClass.text17,),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: getProTube(),
                    ),
                  ),
                },
            ],
          ),
        ),
      ),
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
    List<Widget> getProTube() {
    List<Widget> list=[];
       for(var i=0;i<pertories.length;i++)
       {
         list.add(Hero(tag: pertories[i].menuname.toString() ,child: buildPropertyYoutUbe(pertories[i],i),));
       }
     return list;
    }
    Widget buildProperty(String property, String propertiesTitle, String prodes) {
       return Card(
       elevation: 3,
       margin: EdgeInsets.only(bottom: 20,right: 5,left: 4),
       clipBehavior: Clip.antiAlias,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(15)),
       ),
       child: Container(
         color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               height: 220,
               width: 180,
               margin: EdgeInsets.only(left: 5),

               child: CircleAvatar(
                 backgroundImage: CachedNetworkImageProvider(property.toString()),),
             ),
             Container(
               width: 200,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(propertiesTitle,style: StyleClass.text17,),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 10.0),
                    child: Text(prodes,style: StyleClass.textformstyle,),
                )
                 ],
               ),
             )
           ],
         ),
       ),
     );
    }

    Widget buildPropertyYoutUbe(MenuModels property, int index) {
      return Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: 20,right: 5,left: 4),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Container(
            color: GradientHelper.getColorFromHex(ColorClass.lightGrey_COLOR),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 240,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {},
                  ),
                )
              ],
            ),
          ),
      );
    }

}



