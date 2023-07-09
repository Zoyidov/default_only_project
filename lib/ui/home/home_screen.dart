import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/product_screen.dart';
import 'package:login_screen_homework/ui/home/widgets/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/network/store_repository.dart';
import '../models/store_model.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final StoreRepository storeRepository = StoreRepository();
  List<StoreModel> storeData = [];
  bool isLoading = false;
  String selectedPopupMenuValue = 'All';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final List<StoreModel> fetchedData = await storeRepository.getAllProduct();
      setState(() {
        storeData = fetchedData;
      });
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
    if (selectedPopupMenuValue == 'All') {
      return storeData;
    } else {
      final int limit = int.parse(selectedPopupMenuValue);
      return storeData.take(limit).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Store'),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                PopupMenuItem(
                  value: '1',
                  child: Text('1'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('2'),
                ),
                PopupMenuItem(
                  value: '3',
                  child: Text('3'),
                ),
                PopupMenuItem(
                  value: '4',
                  child: Text('4'),
                ),
                PopupMenuItem(
                  value: '5',
                  child: Text('5'),
                ),
              ];
            },
            onSelected: (value) {
              setState(() {
                selectedPopupMenuValue = value;
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
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  builder: (context) => ProductScreen(model: item),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: item.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
      backgroundColor: Colors.indigo,
    );
  }
}
