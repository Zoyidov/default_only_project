import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/add_contact/about_contact.dart';
import 'package:login_screen_homework/ui/add_contact/add_contact_screen.dart';
import 'package:login_screen_homework/ui/widgets/global_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../local/db/local_database.dart';
import '../../utils/images.dart';
import '../widgets/search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContactDatabase db = ContactDatabase();
  List<Contact> contacts = [];
  bool _isSearching = false;

  _loadContacts() async {
    List<Contact> newContacts = await db.getContacts();
    setState(() {
      contacts = newContacts;
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  void _switchToCalling(String phoneNumber) async {
    String uri = 'Tel:+998 $phoneNumber';
    await launchUrl(Uri.parse(uri));
  }

  @override
  void initState() {
    _loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _isSearching
            ? SearchTextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                prefixIcon: CupertinoIcons.search,
              )
            : Text(
                "Contacts:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  // color: Colors.black,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(CupertinoIcons.search),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Select'),
                ),
                PopupMenuItem(
                  child: Text('Select all'),
                ),
                PopupMenuItem(
                  child: Text(
                    'Delete all',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Future.delayed(
                      Duration(seconds: 0),
                      () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete all contact!'),
                          content: Text(
                              'Are you sure you want to remove everything?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                db.deleteContacts();
                                Navigator.pop(context);
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black,
                                    content:
                                        Text('Contacts Successfully Deleted!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ];
            },
            onSelected: (value) {
              print('Selected item: $value');
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder(
        future: db.getContacts(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            if (data.length == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AppImages.empty),
                      const Text(
                        "You have no contacts yet",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  onLongPress: (){
                    showDialog(context: context, builder: (context) =>AlertDialog(
                      title: Text('Delete Contact'),
                      content: Text('Are you sure you want to delete ${contacts[index].name} ${contacts[index].surname}?'),
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
                            await db.deleteContact(contacts[index].id!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                content: Text('[ ${contacts[index].name} ${contacts[index].surname}] Successfully deleted!',style: TextStyle(color: Colors.red),),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomeScreen();}));
                            setState(() {});
                          },
                        ),
                      ],
                    ));

                  },
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutContact(
                        contact: data[index],
                      );
                    }));
                  },
                  leading: ClipOval(
                    child: Image.asset(
                      contacts[index].image,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  trailing: ZoomTapAnimation(
                    onTap: () async {
                     (_switchToCalling(data[index].phoneNumber));
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      child: Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  title: Text(data[index].name + " " + data[index].surname),
                  subtitle: Text("+998 " + data[index].phoneNumber),
                ),
              );
            }
          }
          return Center(
            child: Text(
              'Error',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return AddContact();
            }),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
    );
  }
}
