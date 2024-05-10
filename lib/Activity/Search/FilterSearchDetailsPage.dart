import 'package:flutter/material.dart';
class FilterSearchDetailsPage extends StatefulWidget {
  const FilterSearchDetailsPage({super.key});
  @override
  State<FilterSearchDetailsPage> createState() => _FilterSearchDetailsPageState();
}
class _FilterSearchDetailsPageState extends State<FilterSearchDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [

        ],
      )
    );
  }
}
