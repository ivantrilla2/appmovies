import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/actor.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/widgets/index_number.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({
    Key? key,
    required this.actor,
    required this.index,
  }) : super(key: key);

  final Actor actor;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.to(
            DetailsScreen(actor: actor),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                Api.imageBaseUrl + actor.profilePath,
                fit: BoxFit.cover,
                height: 250,
                width: 180,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image,
                  size: 180,
                ),
                loadingBuilder: (_, __, ___) {
                  if (___ == null) return __;
                  return const FadeShimmer(
                    width: 180,
                    height: 250,
                    highlightColor: Color.fromARGB(255, 0, 0, 0),
                    baseColor: Color.fromARGB(255, 0, 0, 0),
                  );
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: IndexNumber(number: index),
        )
      ],
    );
  }
}
