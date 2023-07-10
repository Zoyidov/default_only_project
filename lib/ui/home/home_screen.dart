import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/product_screen.dart';
import 'package:login_screen_homework/ui/home/widgets/category.dart';
import 'package:login_screen_homework/ui/home/widgets/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../data/network/store_repository.dart';
import '../models/store_model.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final StoreRepository storeRepository = StoreRepository();
  List<StoreModel> storeData = [];
  bool isLoading = false;
  String selectedPopupMenuValue = 'All';
  int limit = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final List<StoreModel> fetchedData =
          await storeRepository.getAllProducts();
      setState(() {
        storeData = fetchedData;
      });

      if (selectedPopupMenuValue == 'Sort') {
        final List<StoreModel> sortedData = await storeRepository.sortProduct();
        setState(() {
          storeData = sortedData;
        });
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to load products.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<StoreModel> getLimitedData() {
    if (selectedPopupMenuValue == 'All' || selectedPopupMenuValue == 'Sort') {
      return storeData;
    } else {
      return storeData.take(limit).toList();
    }
  }

  void _showLimitDialog() {
    showDialog(
      barrierColor: Colors.indigo,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Set Limit'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                limit = int.tryParse(value) ?? 0;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter a limit',
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.indigo),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: Colors.indigo,
        title: const Text('Store'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Sort',
                  child: Text('Sort'),
                ),
                PopupMenuItem<String>(
                  value: 'All',
                  child: Text('All Products'),
                ),
                PopupMenuItem<String>(
                  value: 'Limit',
                  child: Text('Give Limit to Products'),
                ),
              ];
            },
            onSelected: (value) {
              setState(() {
                selectedPopupMenuValue = value;
                if (value == 'Limit') {
                  _showLimitDialog();
                } else if (value == 'Sort') {
                  fetchData();
                }
              });
            },
          ),
        ],
      ),
      body: isLoading
          ? ShimmerScreen()
          : storeData.isEmpty
              ? Center(
                  child: Text(
                    'Data is empty!',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          ...List.generate(categorys.length, (index) => categorys[index])
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: getLimitedData().length,
                      itemBuilder: (context, index) {
                        final item = getLimitedData()[index];
                        return ZoomTapAnimation(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(model: item),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 7),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ClipRRect(
                                      borderRadius:
                                          const BorderRadius.vertical(
                                        top: Radius.circular(12.0),
                                      ),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          imageUrl: item.image,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              CupertinoActivityIndicator(),
                                          errorWidget:
                                              (context, url, error) => Icon(
                                                  Icons.error,
                                                  color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            item.category,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            '\$${item.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      backgroundColor: Colors.indigo,
    );
  }
}

List<Categories> categorys = [
  Categories(text: "All",isSelected: false,),
  Categories(text: "Men",isSelected: false,),
  Categories(text: "Women",isSelected: false,),
  Categories(text: "Electronic",isSelected: false,),
  Categories(text: "Jewelery",isSelected: false,),
];