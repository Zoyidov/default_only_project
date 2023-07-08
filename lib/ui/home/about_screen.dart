import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/currency_model.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, required this.currency});

  final CurrencyModel currency;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Datails",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.currency.thumbnail,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20,width: 10,),
                  Flexible(
                    child: Text(
                      widget.currency.title,
                      
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Company: ',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.currency.shortDescription,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                text: 'Genre: ',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.currency.genre,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                text: 'Support platforms: ',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.currency.platform,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                text: 'Release date: ',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.currency.releaseDate,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                text: 'Description: ',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.currency.shortDescription,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Center(
                  child: const Text(
                    'Link to downlod: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextButton(
                      onPressed: () async {
                      final Uri url = Uri.parse(widget.currency.gameUrl);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Text(
                      widget.currency.gameUrl,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
