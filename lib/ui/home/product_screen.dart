import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/store_model.dart';

class ProductScreen extends StatefulWidget {
   ProductScreen({Key? key, required this.model}) : super(key: key);


StoreModel model;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<StoreModel> storeData = [];



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40,),
          Container(
            height: 300,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: CachedNetworkImage(
              imageUrl: widget.model.image,
              fit: BoxFit.scaleDown,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView(
                      children:[ Column(
                        children: [
                          Text(
                            widget.model.description,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 100,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$${widget.model.price}',
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: widget.model.rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                onRatingUpdate: (rating) {

                                },
                              ),
                              Text(
                                widget.model.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
