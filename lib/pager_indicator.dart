import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/pages.dart';

class PageIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PageIndicator({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // new Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: new Container(
            //     width: 20.0,
            //     height: 20.0,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle, color: const Color(0x88FFFFFF)),
            //   ),
            // ),
            new PageBubble(
              viewModel: new PagerBubbleViewModel(
                  'assets/wallet.png', Colors.blue, false, 0.0),
            ),
            new PageBubble(
              viewModel: new PagerBubbleViewModel(
                  'assets/wallet.png', Colors.blue, false, 1.0),
            ),
            new PageBubble(
              viewModel: new PagerBubbleViewModel(
                  'assets/wallet.png', Colors.blue, true, 0.0),
            ),
            // new Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: new Container(
            //     width: 20.0,
            //     height: 20.0,
            //     decoration: new BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: new Border.all(
            //             width: 3.0, color: const Color(0x88FFFFFF))),
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidePercent);
}

class PageBubble extends StatelessWidget {
  final PagerBubbleViewModel viewModel;

  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new Container(
        width: lerpDouble(20.0, 45.0, viewModel.activePercent),
        height: lerpDouble(20.0, 45.0, viewModel.activePercent),
        decoration: new BoxDecoration(
            shape: BoxShape.circle, 
            color: viewModel.isHollow ? Colors.transparent : const Color(0x88FFFFFF),
            border: new Border.all(
              color: viewModel.isHollow ? const Color(0x88FFFFFF) : Colors.transparent,
              width: 3.0
            )),

        child: new Opacity(
          opacity: viewModel.activePercent,
          child: new Image.asset(
            viewModel.iconAssetPath,
            color: viewModel.color,
          ),
        ),
      ),
    );
  }
}

class PagerBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel(
      this.iconAssetPath, this.color, this.isHollow, this.activePercent);
}
