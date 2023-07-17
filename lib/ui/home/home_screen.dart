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

  void _fetchTranslation(String query) async {
    try {
      _translatedText = await _translationProvider.getTranslation(query);
   setState(() {});
    } catch (e) {
      setState(() {});
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
            Center(child: Text('Translated Text: $_translatedText')),
          ],
        ),
      ),
    );
  }
}
