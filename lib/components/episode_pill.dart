import 'package:flutter/material.dart';

class EpisodePill extends StatelessWidget {
  EpisodePill(
      {this.imageURL, this.episodeTitle, this.description, this.duration});

  final String imageURL;
  final String episodeTitle;
  final String description;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              imageURL,
              width: 100.0,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$duration mins'),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 40.0,
                            ),
                            MaterialButton(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print('hi');
                              },
                              shape: CircleBorder(),
                              color: Colors.lightBlueAccent,
                            ),
                          ],
                        ),
                      ],
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
