import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/Search/AddressSearch.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
class SearchAppWidget extends StatelessWidget {
  late TextEditingController controller;
   SearchAppWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      margin: EdgeInsets.fromLTRB(20,10,20,6),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: GradientHelper.getColorFromHex(ColorClass.lightEditText),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.red),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              showCursor: false,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search House,Apartment..etc',
                hintStyle: TextStyle(
                    color: GradientHelper.getColorFromHex(ColorClass.label_COLOR)
                ),
                border: InputBorder.none,
              ),
              onTap: () async {
                showSearch(
                  context: context,
                  delegate: AddressSearch(),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
