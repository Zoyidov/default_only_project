import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter',
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
                child: Text('Translate'),
              ),
              SizedBox(height: 20),
              if (isLoading)
                Center(child: CupertinoActivityIndicator())
              else
                Center(
                  child: Text(
                    '$_translatedText',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
