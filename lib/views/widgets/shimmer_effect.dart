import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 1000),
      baseColor: Colors.blueGrey,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.grey[300],
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.grey[300],
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.grey[300],
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingMatchFound extends StatelessWidget {
  const ShimmerLoadingMatchFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 1000),
      baseColor: Colors.blueGrey,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                color: Colors.grey[300],
                margin: const EdgeInsets.only(bottom: 8.0),
              ),
              kWidth10,
              Container(
                width: 180,
                color: Colors.grey[300],
                margin: const EdgeInsets.only(bottom: 8.0),
              ),
              kWidth10,
              Container(
                width: 180,
                color: Colors.grey[300],
                margin: const EdgeInsets.only(bottom: 8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
