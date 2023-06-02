import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SvgPicture.asset('assets/icon/ic-profile.svg'),
      // child: CachedNetworkImage(
      //   imageUrl: RandomImage().getImageUrl(),
      //   progressIndicatorBuilder: (context, url, progress) => Container(
      //     decoration: BoxDecoration(
      //       color: ColorTheme.white,
      //     ),
      //     child: Center(
      //       child: SpinKitDoubleBounce(
      //         color: ColorTheme.mainBlue,
      //       ),
      //     ),
      //   ),
      //   errorWidget: (context, url, error) =>
      //       SvgPicture.asset('assets/icon/ic-profile.svg'),
      // ),
    );
  }
}
