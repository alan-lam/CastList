import 'package:flutter/material.dart';

class EpisodePill extends StatelessWidget {
  EpisodePill(
      {this.imageURL,
      this.episodeTitle,
      this.description,
      this.duration,
      this.datePublished,
      this.episodeId,
      this.onPressed});

  final String imageURL;
  final String episodeTitle;
  final String description;
  final String duration;
  final String datePublished;
  final String episodeId;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Image.network(
                imageURL,
                width: 100.0,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episodeTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                datePublished,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '$duration mins',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.lightBlueAccent,
                                  size: 40.0,
                                ),
                                onPressed: () {
                                  onPressed(episodeId, episodeTitle);
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.lightBlueAccent,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    print('hi');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 5.0,
    );
  }
}
