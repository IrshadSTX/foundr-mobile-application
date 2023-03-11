import 'package:flutter/material.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class MatchingFoundLists extends StatelessWidget {
  const MatchingFoundLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
                width: 160,
                child: Column(
                  children: [
                    Expanded(child: Image.asset('assets/images/user.png')),
                    const TextStyleWidget(
                      title: 'User',
                      thick: FontWeight.w500,
                      textcolor: Colors.black,
                      fontsize: 14,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.blueAccent,
                            )),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextStyleWidget(
                            title: 'Connect',
                            thick: FontWeight.w600,
                            textcolor: Colors.blueAccent,
                            fontsize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
