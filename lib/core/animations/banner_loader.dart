import 'package:blood_bank/core/widgets/loader.dart';
import 'package:blood_bank/features/onboard/model/onboard_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BannerLoader extends StatelessWidget {
  const BannerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Skeletonizer(
      child: Column(
        children: [
          CarouselSlider(
            items: onboardData.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: e.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: Loader()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fadeInCurve: Curves.easeInOut,
                      fadeInDuration: const Duration(milliseconds: 500),
                      fadeOutCurve: Curves.easeInOut,
                      fadeOutDuration: const Duration(milliseconds: 500),
                    ),
                  ),
                  const Text(
                    "Place holder",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Place holder",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const Text(
                    "Place holder",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }).toList(),
            options: CarouselOptions(
              height: size.height * 0.40,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
