import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/local/db/local_database.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/ui/widgets/add_contact_textfield.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/images.dart';
import 'contact_profile.dart';

class EditContact extends StatefulWidget {
  const EditContact({super.key, required this.contact});

  final Contact contact;

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  var images = [
    AppImages.user,
    AppImages.me,
    AppImages.farrux,
    AppImages.islomjon,
    AppImages.jamshid,
    AppImages.yusa,
    AppImages.xayotbahrom,
    AppImages.sharif,
  ];

  void saveContact() {}
  ContactDatabase db = ContactDatabase();
  List<Contact> contacts = [];

  int selected = 0;

  @override
  void initState() {
    controller1.text = widget.contact.name;
    controller2.text = widget.contact.surname;
    controller3.text = widget.contact.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ZoomTapAnimation(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              // color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Add",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () async {
                db.updateContact(Contact(
                  id: widget.contact.id,
                    name: controller1.text,
                    surname: controller2.text,
                    phoneNumber: controller3.text,
                  image: images[selected]
                ));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      '[ ${controller1.text}${controller2.text}] Successfully Edited!',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }, child: Text("Done",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      ContactTextField(
                        hintText: "Enter name",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Name",
                        controller: controller1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ContactTextField(
                        hintText: "Enter surname",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Surname",
                        controller: controller2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ContactTextField(
                        hintText: "_ _  _ _ _  _ _  _ _",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        caption: "Phone number",
                        icon: '+998',
                        controller: controller3,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '(##) ### ## ##',
                            filter: {"#": RegExp(r'[0-9]')},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ContactProfile(
                          image: images[index],
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          selected: (selected == index) ? true : false,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 0,
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
