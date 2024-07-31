import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/JModels.dart';

class NewsContentCard extends StatelessWidget {
  final VoidCallback onTap;
  List<News> newsData;
  NewsContentCard({
    super.key,
    required this.onTap,
    required this.newsData
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData.length,
      itemBuilder: (BuildContext context, int index) {
        final news = newsData[index];
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: news.image.toString(),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: const Center(child: CircularProgressIndicator(color: Colors.orange,)),
                          ),
                          errorWidget: (context, url, error) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.2,
                              color: Colors.grey,
                              child: const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 40.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    news.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    news.date.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              news.description.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              news.description.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}