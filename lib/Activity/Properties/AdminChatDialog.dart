import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/ContactEquiryProvider.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
class MyFormDialog extends StatefulWidget {
   String? slug;
   MyFormDialog({super.key,required this.slug});
  @override
  _MyFormDialogState createState() => _MyFormDialogState();
}

class _MyFormDialogState extends State<MyFormDialog> {

  List<String> _selectedItems = [];
  final List<String> _items = [
    'Available date',
    'Inspection',
    'Length of lease',
    'Rental application',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Consumer<Contactequiryprovider>(
        builder: (context, loadingState, child) {
          return  AlertDialog(
              title: Column(
                children: [
                  Center(child: Text('Enquiry Form ',style: StyleClass.redstyle,)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            content: Form(
                key: loadingState.formKey,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("What's your enquiry about?",style: StyleClass.Black20style,),
                          ),
                          Container(
                              child: showList()
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                              borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                  
                                  return null;
                                },
                                controller: loadingState.nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: ContentText.fullname,
                                  hintStyle: StyleClass.textformstyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person),
                                  // Removes the default underline border
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                              borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  else if(!value.contains("@"))
                                  {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                                controller: loadingState.emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: ContentText.email,
                                  hintStyle: StyleClass.textformstyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email),
                                  // Removes the default underline border
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                              borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  else if(value.length>10)
                                  {
                                    return 'Please enter 10 digit';
                                  }
                                  return null;
                                },
                                controller: loadingState.phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: ContentText.mobile,
                                  hintStyle: StyleClass.textformstyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone_android),
                                  // Removes the default underline border
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                              borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Message';
                                  }
                  
                                  return null;
                                },
                                controller: loadingState.msgController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: ContentText.msg,
                                  hintStyle: StyleClass.textformstyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email),
                                  // Removes the default underline border
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                               Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  if (loadingState.loading)
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator()
                                    ),
                                  ElevatedButton(
                                    onPressed: loadingState.loading ? null
                                        : () {

                                      loadingState.sendEquiry(context,widget.slug.toString());
                                    },
                                    child: Text('Start Loading'),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                            ],
                          )
                  
                        ]
                    ),
                  ),
                ),
              ),
          );
        });
  }

  Widget showList(){
    return SizedBox(

      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
            shrinkWrap: true,
          itemCount: _items.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: CheckboxListTile(
                title: Text(_items[index]),
                value: _selectedItems.contains(_items[index]),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      _selectedItems.add(_items[index]);
                    } else {
                      _selectedItems.remove(_items[index]);
                    }
                  });
                },
              ),
            );
          }),
    );
  }
}