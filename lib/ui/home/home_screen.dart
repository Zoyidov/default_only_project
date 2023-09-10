import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/images.dart';
import '../../data/network/translate_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TranslationProvider _translationProvider = TranslationProvider();
  String _translatedText = '';
  TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;

  void _fetchTranslation(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final translation = await _translationProvider.getTranslation(query);
      setState(() {
        _translatedText = translation;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        _translatedText = 'Translation failed: $e';
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.clock),
        Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Translator',style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white,fontSize: 30),
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter',
                    labelStyle: TextStyle(color: Colors.white,fontSize: 25),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white30,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final query = _textEditingController.text.trim();
                    if (query.isNotEmpty) {
                      _fetchTranslation(query);
                    }
                  },
                  child: Text('Translate',style: TextStyle(color: Colors.black),),
                ),
                SizedBox(height: 50),
                if (isLoading)
                  Center(child: CupertinoActivityIndicator(color: Colors.white,radius: 15,))
                else
                  Center(
                    child: Text(
                      '$_translatedText',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ]
    );
  }
}
