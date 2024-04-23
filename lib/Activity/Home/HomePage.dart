import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Models/MenuModels.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomAppBar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuModels> pertories=getMenus();
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280.0),
        child: CustomAppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Expanded(child: Container(
                    height: 34,
                    child: Stack(
                      children: [
                        ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            builderFilter("Buy"),
                            builderFilter("Rent"),
                            builderFilter("Sell"),

                            SizedBox(
                              width: 8,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Padding(padding: EdgeInsets.only(left: 16,right: 24),
                    child: GestureDetector(
                      child: Text("Filter",style: StyleClass.text17,),
                    onTap: (){

                    },
                  ),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 220,
                margin: EdgeInsets.only(top: 30),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: getPro(),
                ),
              ),
            ),
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
            Expanded(
              child: Container(
                height: 200,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: getProTube(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget builderFilter(String filtername){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: GradientHelper.getColorFromHex(ColorClass.blue),
          width: 1
        ),

      ),
      child: Center(
        child: Text(
          filtername,

        ),
      ),

    );
  }
  List<Widget> getPro() {
    List<Widget> list=[];
   for(var i=0;i<pertories.length;i++)
   {
     list.add(Hero(tag: pertories[i].menuname.toString() ,child: buildProperty(pertories[i],i),));
   }
   return list;
  }
  List<Widget> getProTube() {
    List<Widget> list=[];
   for(var i=0;i<pertories.length;i++)
   {
     list.add(Hero(tag: pertories[i].menuname.toString() ,child: buildPropertyYoutUbe(pertories[i],i),));
   }
   return list;
  }

  Widget buildProperty(MenuModels property, int index){
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
                  height: 280,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/m3.png",),

                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0,1.0],
                          colors: [
                            Colors.transparent,
                            GradientHelper.getColorFromHex(ColorClass.blue)
                          ]
                      )
                  ),

                ),
                Container(

                  child: Column(
                    children: [
                      Text("Price Rs..333.333"),
                      Text("Kanpur utter pradesh")
                    ],
                  ),
                )
              ],
            ),
          ),
    
        );
    }



    Widget buildPropertyYoutUbe(MenuModels property, int index){
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
                    onReady: () {

                    },
                  ),
                )
              ],
            ),
          ),

        );
    }
}
