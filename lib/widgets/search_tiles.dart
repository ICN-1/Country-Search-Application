import 'package:country_search/utils/constants/app_colours.dart';
import 'package:country_search/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class SearchTiles extends StatelessWidget {
  const SearchTiles({
    super.key,
    required this.image,
    required this.countryName,
    required this.countryCapital,
    this.onSelect,
  });

  final String image, countryName, countryCapital;
  final void Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            image != "" ? image : AppText.mockImage,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                AppText.mockImage,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  countryName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
                Text(
                  countryCapital,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColours.dark2,
                  ),
                  softWrap: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
