import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/data/models/robotman_provider.dart';

import '../../data/network/provider/provider.dart';

class SelectButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your select buttons UI goes here
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiProvider apiProvider = ApiProvider();
  bool isLoading=false;

  Welcome? robots;

  _init()async{
    setState(() {
      isLoading=true;
    });
    robots = await apiProvider.fetchData();
    setState(() {
      print(robots);
      isLoading=false;
    });
    print(robots.toString());
  }

  @override
  void initState() {

    _init();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robot Man"),
      ),
      body: Column(
        children: [
          SelectButtons(),
          Expanded(
            child: isLoading
                ? CupertinoActivityIndicator()
                : GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.60,
              ),
              itemCount: robots?.data.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(int.parse(
                            robots!.data[index]
                                .backgroundGradientColors[0],
                            radix: 16)),
                        Color(int.parse(
                            robots!.data[index]
                                .backgroundGradientColors[1],
                            radix: 16)),
                        Color(int.parse(
                            robots!.data[index]
                                .backgroundGradientColors[2],
                            radix: 16)),
                        Color(int.parse(
                            robots!.data[index]
                                .backgroundGradientColors[3],
                            radix: 16)),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        robots?.data[index].displayIcon ?? '',
                      ),
                      SizedBox(height: 10),
                      Text("Name: ${robots?.data[index].displayName ?? ''}"),
                      SizedBox(height: 10),
                      Text("Developer: ${robots?.data[index].developerName ?? ''}"),
                      SizedBox(height: 10),
                      Text("Slot: ${robots?.data[index].developerName ?? ''}"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
