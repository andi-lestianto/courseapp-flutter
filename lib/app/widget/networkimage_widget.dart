import 'package:cached_network_image/cached_network_image.dart';
import 'package:courseapp/app/helper/randomimgurl_helper.dart';
import 'package:courseapp/app/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: RandomImage().getImageUrl(),
        progressIndicatorBuilder: (context, url, progress) => Container(
          decoration: BoxDecoration(
            color: ColorTheme.white,
          ),
          child: Center(
            child: SpinKitDoubleBounce(
              color: ColorTheme.mainBlue,
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            SvgPicture.asset('assets/icon/ic-profile.svg'),
      ),
    );
  }
}
