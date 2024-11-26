import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TRatingAndShare extends StatelessWidget {
  final String rating;
  final String? totalRating;
  const TRatingAndShare({
    super.key, required this.rating, this.totalRating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            SizedBox(width: 8,),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: rating ),
                      TextSpan(text: totalRating),
                    ]
                )
            )
          ],
        ),
        // IconButton(
        //     onPressed: (){},
        //     icon: const Icon(Icons.share,size: 24,)),
      ],
    );
  }
}