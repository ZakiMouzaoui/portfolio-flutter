import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class SocialConnectMobileTab extends StatelessWidget {
  const SocialConnectMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Space.y(10.w)!,
        CustomSectionHeading(text: socialLinkHeading),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: socialLinkSubHeading),
        ),
        Space.y(10.w)!,
        Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 50,
            children: contactUtils
                .asMap()
                .entries
                .map((e) => IconButton(
                      icon: Image.network(
                        e.value.icon,
                        color: theme.textColor,
                      ),
                      onPressed: () => openURL(e.value.url),
                      highlightColor: Colors.white54,
                      iconSize: 21,
                    ))
                .toList()),
        Space.y(5.w)!,
        Container(color: Colors.white.withOpacity(0.2), height: 1),
      ],
    );
  }
}
