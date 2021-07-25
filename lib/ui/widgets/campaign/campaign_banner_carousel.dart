import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

import 'banner_image.dart';

class CampaignBanner extends StatefulWidget {
  final bool showIndicator;
  const CampaignBanner({
    Key? key,
    this.showIndicator = false,
  }) : super(key: key);

  @override
  _CampaignBannerState createState() => _CampaignBannerState();
}

class _CampaignBannerState extends State<CampaignBanner> {
  final List<String> banners = [
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-campaign-banner.png?alt=media&token=a410ebe1-593a-4f02-8470-f0fd738f98e5',
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-store-campaign-banner.png?alt=media&token=37d56fb8-e08f-42a1-be1f-92a719777cf1',
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-simple-campaign-banner.png?alt=media&token=c5c45a3e-edd6-4493-9df8-6652fe26fca1',
  ];

  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: BannerImage(imageUrl: banners[itemIndex]),
            ),
            options: CarouselOptions(
              height: 160,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        if (widget.showIndicator) SizedBox(height: 8),
        if (widget.showIndicator)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: banners.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? ColorPallete.blueishGray
                              : ColorPallete.darkGray)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
      ],
    );
  }
}
