import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
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
