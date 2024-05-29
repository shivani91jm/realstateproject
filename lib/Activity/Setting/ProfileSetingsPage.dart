import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/LoginPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Images/AppImage.dart';
import 'package:realstateproject/MutipleProvidersss/UpdateProfileProvider.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/SessionClass.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String name = "",
      email = "",
      address = "",
      userid = "",
      phone = "",
      userimg = "",
      token = "";
  bool islogin = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStoreValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Profile", style: StyleClass.Red20style,),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                _showAlertDialog(context);
              },
              child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.logout,
                    color: GradientHelper.getColorFromHex(
                        ColorClass.RED_COLOR),
                  )),
            ),
          ]),
      body: Consumer<Updateprofileprovider>(
          builder: (context, loginProvider, child) {
            return Form(
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      child: Text("" + name, style: StyleClass.text17,),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text("" + email, style: StyleClass.blue14,),
                    ),
                  ),
                  Stack(children: [
                    Center(
                      child: Container(
                        height: 220,
                        width: 180,
                        margin: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              "https://avatar.iran.liara.run/public/boy?username=Ash"),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 155, top: 60),
                        color: GradientHelper.getColorFromHex(
                            ColorClass.lightEditText),
                        child: Image.asset(
                          AppImages.edit_url, fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: GradientHelper.getColorFromHex(
                                    ColorClass.lightEditText)
                            ),
                            width: 100,
                            height: 70,

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("0", style: StyleClass.red14,),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 70,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: GradientHelper.getColorFromHex(
                                    ColorClass.lightEditText)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("0", style: StyleClass.red14,),
                                ),
                                Text("Review", style: StyleClass.blue14,),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 70,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: GradientHelper.getColorFromHex(
                                    ColorClass.lightEditText)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("0", style: StyleClass.red14,),
                                ),
                                Text("Sold", style: StyleClass.blue14,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10,),
                      decoration: BoxDecoration(
                        color: GradientHelper.getColorFromHex(
                            ColorClass.lightEditText), // Light gray color
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: adds rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 7),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: ContentText.fullname,
                            hintStyle: StyleClass.labelcolor14,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: GradientHelper
                                .getColorFromHex(
                              ColorClass.blue,), size: 20,),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                      )),
                  //--------------email------------
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10,),
                    decoration: BoxDecoration(
                      color: GradientHelper.getColorFromHex(
                          ColorClass.lightEditText), // Light gray color
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: adds rounded corners
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                      child: TextFormField(
                        enabled: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: ContentText.email,
                          hintStyle: StyleClass.labelcolor14,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email, color: GradientHelper
                              .getColorFromHex(
                            ColorClass.blue,), size: 20,),
                          // Removes the default underline border
                        ),
                      ),
                    ),
                  ),
                  //------------address-----------------
                  Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: GradientHelper.getColorFromHex(
                            ColorClass.lightEditText), // Light gray color
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: adds rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 7),
                        child: TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: ContentText.add,
                            hintStyle: StyleClass.labelcolor14,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.location_on,
                              color: GradientHelper.getColorFromHex(
                                ColorClass.blue,), size: 20,),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            }
                            return null;
                          },
                        ),
                      )),
                  //------------city name ------------

                  //-------------------update profile button --------------
                  Container(
                      height: 50,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 30, top: 10),
                      decoration: BoxDecoration(
                        color: GradientHelper.getColorFromHex(
                            ColorClass.RED_COLOR),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomButton(
                          title: loginProvider.loading ? "" : "Update Profile",
                          colors: GradientHelper.getColorFromHex(
                              ColorClass.RED_COLOR))),
                ],
              ),
            );
          }),
    );
  }

  void getStoreValue() async {
    // Retrieve user session
    islogin = await SessionManager.isLoggedIn() ?? false;
    userid = await SessionManager.getUserId() ?? "";
    print("userid" + userid.toString());
    token = await SessionManager.getToken() ?? "";
    print("token" + token.toString());
    name = await SessionManager.getName() ?? "";
    address = await SessionManager.getAddress() ?? "";
    email = await SessionManager.getEmail() ?? "";
    userimg = await SessionManager.getImage() ?? "";
    nameController.text = name;
    addressController.text = address;
    emailController.text = email;
  }


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure logout this app.'),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                SessionManager.clearSession();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) =>
                      LoginPages(), // Navigate to your main screen
                ),
                );
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}