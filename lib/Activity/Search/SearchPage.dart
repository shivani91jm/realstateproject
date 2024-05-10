import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/Search/BuySearchFilter.dart';
import 'package:realstateproject/Activity/Search/RentSearchFilter.dart';
import 'package:realstateproject/Activity/Search/SoldSearchFilter.dart';
import 'package:realstateproject/MutipleProvidersss/HomePageProvider.dart';
import 'package:realstateproject/MutipleProvidersss/MenuProviderClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class SearcheringPage extends StatefulWidget {
  const SearcheringPage({super.key});

  @override
  State<SearcheringPage> createState() => _SearcheringPageState();
}

class _SearcheringPageState extends State<SearcheringPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
        length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
        title: Text('Search Or Filter',style: StyleClass.Black20style,),
        bottom: TabBar(
          labelStyle: StyleClass.Red20style,
         tabs: [
          Tab(text: 'Buy',),
          Tab(text: 'Rent'),
          Tab(text: 'Sold'),
        ],
       ),
    ),
          body: Container(
            child: TabBarView(
              children: [
                BuySearchFilter(),
                RentSearchFilter(),
                SoldSearchFilter(),
              ],
            ),
          ),
        ),
    );
  }
}