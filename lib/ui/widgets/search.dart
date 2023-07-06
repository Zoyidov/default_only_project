import 'package:flutter/material.dart';
import 'package:login_screen_homework/local/db/local_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../add_contact/about_contact.dart';


class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() {
    _loadContacts();
  }

  _loadContacts() async {
    contacts = await ContactDatabase.internal().getContacts();
  }

  List<Contact> contacts = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear,color: Colors.black,),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in contacts) {
      if ((fruit.name + " " + fruit.surname)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(fruit.name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Contact> matchQuery = [];
    for (var fruit in contacts) {
      if ((fruit.name + " " + fruit.surname)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: ClipOval(
            child: Image.asset(
              contacts[index].image,
              width: 50,
              height: 50,
            ),
          ),
          title: Text(result.name + ' ' + result.surname),
          trailing: ZoomTapAnimation(
            onTap: () async {
              await launchUrl(Uri.parse("Tel:+998 ${contacts[index].phoneNumber}"));
            },
            child: Container(
              height: 30,
              width: 60,
              child: Icon(
                Icons.call,
                size: 30,
                color: Colors.green,
              ),
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AboutContact(contact: result);
                },
              ),
            );
          },
        );
      },
    );
  }
}
