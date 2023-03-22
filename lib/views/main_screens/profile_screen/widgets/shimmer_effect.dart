import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foundr_project/views/widgets/snackbar_widget.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 8.0),
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 8.0),
          ),
          Container(
            width: double.infinity,
            height: 30.0,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 8.0),
            child: Center(
                child: Text(
              "Network Error  !😥",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            )),
          ),
        ],
      ),
    );
  }
}
