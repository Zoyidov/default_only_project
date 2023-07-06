import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/local/db/local_database.dart';
import 'package:login_screen_homework/ui/add_contact/edit_contact.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class AboutContact extends StatefulWidget {
  AboutContact({Key? key, required this.contact});

  final Contact contact;

  @override
  State<AboutContact> createState() => _AboutContactState();
}

class _AboutContactState extends State<AboutContact> {
  void saveContact() {}

  ContactDatabase db = ContactDatabase();
  List<Contact> contacts = [];


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
              if (Navigator.canPop(context)){
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }),
                );
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }),
              );
            },
            child: Container(
              color: Colors.black,
              child: const Icon(
                Icons.arrow_back_ios,
                // color: Colors.black,
              ),
            ),
          ),
        ),
        title: const Text(
          "Contact",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            // color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                            ),
                          ),
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                widget.contact.image,
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ZoomTapAnimation(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Contact'),
                                  content: Text('Are you sure you want to delete ${widget.contact.name} ${widget.contact.surname}?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancel', style: TextStyle(color: Colors.black)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Delete', style: TextStyle(color: Colors.red)),
                                      onPressed: () async {
                                        await db.deleteContact(widget.contact.id!);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.black,
                                            content: Text('[ ${widget.contact.name} ${widget.contact.surname}] Successfully deleted!',style: TextStyle(color: Colors.red),),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomeScreen();}));
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 15),
                        ZoomTapAnimation(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditContact(contact: widget.contact,);
                                },
                              ),
                            );
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 36),
              child: Column(
                children: [
                  Text(
                    widget.contact.name + " " + widget.contact.surname,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("+998 " +
                          widget.contact.phoneNumber,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          ZoomTapAnimation(
                            onTap: () async {

                              await launchUrl(Uri.parse("Tel:+998 ${widget.contact.phoneNumber }"));


                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return CallContact(contact: widget.contact);
                              //     },
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF08AE2D),
                              ),
                              child: Icon(
                                Icons.call,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          ZoomTapAnimation(
                            onTap: () async{

                                String phoneNumber = widget.contact.phoneNumber;
                                String uri = 'sms:$phoneNumber';

                                await launchUrl(Uri.parse(uri));

                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return MessageContact(contact: widget.contact);
                              //     },
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFFE9AD13),
                              ),
                              child: Icon(
                                Icons.message,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
