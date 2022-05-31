import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/model/review_model.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/rating_star_widget.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewModel;

  const ReviewWidget({Key? key, required this.reviewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reviewModel.senderName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: screenSize.width / 4,
                    child: FittedBox(
                      child: RatingStarWidget(
                        rating: reviewModel.rating,
                      ),
                    ),
                  ),
                ),
                Text(
                  keysOfRating[reviewModel.rating - 1],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            reviewModel.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
