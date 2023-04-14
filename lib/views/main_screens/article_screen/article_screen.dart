import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/model/api/article/article_model.dart';
import 'package:foundr_project/services/article_services/article_services.dart';
import 'package:foundr_project/views/main_screens/article_screen/article_content/article_content_screen.dart';
import 'package:foundr_project/views/widgets/shimmer_effect.dart';
import 'package:intl/intl.dart';

import 'widgets/article_card_widget.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kYellow,
        title: const TextStyleWidget(
          title: 'Articles',
          thick: FontWeight.bold,
          textcolor: Colors.white,
          fontsize: 32,
        ),
        actions: [
          notificationBtnIcon(context),
        ],
      ),
      backgroundColor: kCream,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextStyleWidget(
                    title: 'Gain some ideas!',
                    thick: FontWeight.bold,
                    textcolor: kBrown,
                    fontsize: 24,
                  ),
                  TextStyleWidget(
                    title:
                        "Read Articles and gain ideas about different sections of startups.",
                    thick: FontWeight.w500,
                    textcolor: kGreen,
                    fontsize: 12,
                  ),
                ],
              ),
              kHeight20,
              SizedBox(
                child: FutureBuilder<List<Article>?>(
                    future: ArticleService().getArticleService(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleContentScreen(
                                      content: snapshot.data![index].content!,
                                      name: snapshot.data![index].title!,
                                      date: dateChange(
                                        snapshot.data![index].createdAt
                                            .toString(),
                                      ),
                                      image: snapshot.data![index].coverImage!),
                                ),
                              );
                            },
                            child: ArticleCardWidget(
                              avatar: snapshot.data![index].coverImage!,
                              title: snapshot.data![index].title!,
                              dateTime: dateChange(
                                  snapshot.data![index].createdAt.toString()),
                              size: size,
                            ),
                          ),
                          itemCount: snapshot.data!.length,
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: ShimmerLoadingEffect(),
                        );
                      } else {
                        return const Center(
                            child: TextStyleWidget(
                                title: 'Network lost',
                                thick: FontWeight.bold,
                                textcolor: kRose,
                                fontsize: 26));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatteddate = DateFormat('dd-MM-yyyy', 'en_US').format(dateTime);
    formatteddate = formatteddate.toLowerCase();
    String formattedDate = formatteddate.replaceFirst(
        formatteddate.substring(3, 4),
        formatteddate.substring(3, 4).toUpperCase());
    return formattedDate;
  }
}
