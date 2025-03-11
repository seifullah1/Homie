import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class ApartementWidget extends StatelessWidget {
  const ApartementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 435,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/apartament.png',
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 22,
                        width: 77,
                        decoration: BoxDecoration(
                          color: Color(0xFF085055),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'Проверено',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: LikeButton(
                          size: 36,
                          circleColor: const CircleColor(
                            start: Colors.redAccent,
                            end: Colors.red,
                          ),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.redAccent,
                            dotSecondaryColor: Colors.red,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.white,
                              size: 24,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ЖК 4you',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFC107),
                            size: 24,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),

                          Text(
                            '(12)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA5AFB5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'г. Алматы, Алтынсарина 68',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2-х комнатная > 2 спальни > 4 кровати',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF617078),
                    ),
                  ),
                  SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Color(0xFFA5AFB5)),
                      SizedBox(width: 8),
                      Text(
                        '20 янв. - 25 янв.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF617078),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  Divider(height: 1, color: AppColor.greyLight),
                  SizedBox(height: 12),

                  Row(
                    children: [
                      Text(
                        '25 000 ₸',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Color(0xFF617078),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '/ 1 ночь',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF617078),
                        ),
                      ),
                      SizedBox(width: 50),
                      AppButton(
                        text: 'Забронировать',
                        onPressed: () {},
                        backgroundColor: AppColor.primaryColor,
                        width: 138,
                        height: 36,
                        isFontSize: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
