import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';

class TopRatedItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  const TopRatedItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 50,
                height: 50,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: bdLifelessGroteskBold,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      description,
                      maxLines: 2,
                      style: const TextStyle(
                        color: greyColor,
                        fontSize: 12,
                        fontFamily: bdLifelessGroteskRegular,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 14,
                  fontFamily: bdLifelessGroteskBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
