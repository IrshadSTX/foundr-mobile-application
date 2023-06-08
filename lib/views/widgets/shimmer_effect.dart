import 'package:flutter/material.dart';

import 'package:foundr_project/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: Colors.blueGrey,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 8.0),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
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
      period: const Duration(milliseconds: 1000),
      baseColor: Colors.blueGrey,
      highlightColor: const Color.fromARGB(137, 87, 73, 73),
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

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 51, 51, 51),
      highlightColor: const Color.fromARGB(255, 125, 125, 125),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color.fromARGB(255, 94, 94, 94))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Card(
                  child: SizedBox(
                    width: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.grey,
                      child: const SizedBox(
                        height: 100,
                        width: 39,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200.0,
                            height: 20.0,
                          ),
                        ),
                      ),
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200.0,
                            height: 17.0,
                          ),
                        ),
                      ),
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200.0,
                            height: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
