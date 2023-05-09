// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages, unused_local_variable

import 'dart:io';

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/controller/auth_controller.dart';
import 'package:doctor/modules/authentication/controller/profession_controller.dart';
import 'package:doctor/modules/authentication/models/profession.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/pages/signin_page.dart';
import 'package:doctor/modules/initialization/controller/initialization_controller.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/google.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationPage2 extends StatefulWidget {
  RegistrationPage2({super.key});

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController proffesionController = TextEditingController();
  TextEditingController licenceController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  InitializationController initializationController =
      Get.put(InitializationController());
  User user = User();
  final _formKey = GlobalKey<FormState>();
  void onError(PlacesAutocompleteResponse response) {}

  File? profilePic;
  @override
  void initState() {
    ProfessionController().getProfessions();
    super.initState();
  }

  double? longitude;
  double? latitude;
  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 3;
    double bottomHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height / 3;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: BrandColor.main_color,
                ),
                width: double.infinity,
                height: headerHeight,
                child: Center(
                    child: customHeading("Create an account", 25, null,
                        BrandColor.in_background, FontWeight.w500)),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: bottomHeight - 55,
                      color: BrandColor.in_background,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                familyForm("Name", "Enter your name",
                                    textEditingController: nameController),
                                familyForm(
                                    "Email address", "Enter email address",
                                    textEditingController: emailController,
                                    textInputType: TextInputType.emailAddress),
                                familyForm("Phone number", "Enter phone number",
                                    textEditingController: phoneController,
                                    validatePhoneNumber: true,
                                    textInputType: TextInputType.phone),
                                customHeading("Proffesion", 16),
                                ValueListenableBuilder(
                                    valueListenable:
                                        Hive.box<Profession>('professions')
                                            .listenable(),
                                    builder: (context, box, widget) {
                                      List<Profession>? professions =
                                          box.values.toList();
                                      return DropdownButtonFormField(
                                        dropdownColor: Colors.white,
                                        onChanged: ((value) {
                                          proffesionController.text =
                                              value!.uuid;
                                          // find?.changeUserType(value);
                                          // find?.changeDropdownItemTextColor(
                                          //     BrandColor.in_background);
                                        }),
                                        enableFeedback: true,
                                        autofocus: true,
                                        onTap: () {},
                                        hint: customHint(
                                            "Select your proffesion",
                                            null,
                                            null,
                                            14),
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.white),
                                        decoration: InputDecoration(
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      BrandColor.main_color)),
                                          contentPadding:
                                              const EdgeInsets.only(bottom: 10),
                                        ),
                                        items: professions
                                            .map((item) => DropdownMenuItem(
                                                  // ignore: sort_child_properties_last
                                                  child: customText(item.title,
                                                      Colors.black, 13),
                                                  value: item,
                                                ))
                                            .toList(),
                                      );
                                    }),
                                familyForm("Licence no", "Enter your licence",
                                    textEditingController: licenceController),
                                familyForm(
                                    "Hospital", "Enter your hospital name",
                                    textEditingController: hospitalController),
                                familyForm("Age", "Enter your age",
                                    textEditingController: ageController),
                                customHeading("Gender", 16),
                                DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  onChanged: ((value) {
                                    // find?.changeUserType(value);
                                    // find?.changeDropdownItemTextColor(
                                    //     BrandColor.in_background);
                                  }),
                                  enableFeedback: true,
                                  autofocus: true,
                                  onTap: () {},
                                  hint: customHint(
                                      "Select gender", null, null, 14),
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.white),
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: BrandColor.main_color)),
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                  ),
                                  items: ['Male', 'Female', 'Any gender']
                                      .map((item) => DropdownMenuItem(
                                            // ignore: sort_child_properties_last
                                            child: customText(
                                                item, Colors.black, 13),
                                            value: item,
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                familyForm("Location", "Enter your location",
                                    textEditingController: locationController,
                                    textInputType: TextInputType.none,
                                    onTap: () async {
                                  var place = await PlacesAutocomplete.show(
                                      context: context,
                                      apiKey: MAP_API_KEY,
                                      mode: Mode.overlay,
                                      types: [],
                                      // ignconst ore: prefer_const_constructors
                                      logo: const Text(""),
                                      strictbounds: false,
                                      components: [
                                        // Component(Component.country,
                                        //     countryCode)
                                      ],
                                      //google_map_webservice package
                                      onError: (err) {});
                                  if (place != null) {
                                    setState(() {
                                      locationController.text =
                                          place.description.toString();
                                    });

                                    final plist = GoogleMapsPlaces(
                                      apiKey: MAP_API_KEY,
                                      apiHeaders: await const GoogleApiHeaders()
                                          .getHeaders(),
                                      //from google_api_headers package
                                    );
                                    String placeid = place.placeId ?? "0";
                                    final detail = await plist
                                        .getDetailsByPlaceId(placeid);
                                    final geometry = detail.result.geometry;

                                    latitude = geometry!.location.lat;
                                    longitude = geometry.location.lng;
                                  }
                                }),
                                familyForm("Password", "Enter password",
                                    textEditingController: passwordController,
                                    hideText: true,
                                    textInputType:
                                        TextInputType.visiblePassword),
                                familyForm(
                                    "Confirm password", "Repeat password",
                                    textEditingController:
                                        repeatPasswordController,
                                    hideText: true,
                                    password: passwordController.text,
                                    comparePassword: true,
                                    textInputType:
                                        TextInputType.visiblePassword),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: bottomHeight - 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          user.pickProfileImage().then((value) {
                            setState(() {
                              profilePic = value;
                            });
                          });
                        },
                        child: profilePic == null
                            ? iconBackground(Icons.add_a_photo,
                                iconColor: BrandColor.main_color,
                                background: Colors.grey[200])
                            : ClipOval(
                                child: SizedBox(
                                    height: 85,
                                    width: 85,
                                    child: Image.file(
                                      profilePic!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 20,
                  left: 60,
                  right: 60,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (profilePic != null) {
                                // print("Registration");
                                user.type = initializationController.as.value;
                                user.name = nameController.text;
                                user.hospital = hospitalController.text;
                                user.licence = licenceController.text;
                                user.profession.uuid =
                                    proffesionController.text;
                                user.age = int.parse(ageController.text);
                                user.gender = genderController.text;
                                user.latitude = latitude;
                                user.longitude = longitude;
                                user.email = emailController.text;
                                user.phone = phoneController.text;
                                user.password = passwordController.text;
                                user.registerUser();
                              } else {
                                errorToast("Upload profile picture");
                              }
                            }
                          },
                          child: customButton("Register")),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customHeading("Already registered ?", 14, null, null,
                              FontWeight.w500),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignInPage());
                            },
                            child: customHeading("Login", 14, null,
                                BrandColor.main_color, FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
