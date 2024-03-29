import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class SocialConnectDesktop extends StatelessWidget {
  const SocialConnectDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.125).copyWith(bottom: size.height*0.04),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height*0.05),
            decoration: BoxDecoration(
              gradient: theme.contactCard,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [blackColorShadow],
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      socialLinkHeading,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Space.y(1.w)!,
                    Text(
                      socialLinkSubHeading,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Space.y(2.w)!,
                    // SizedBox(height: AppDimensions.space(3)),
                  ],
                ),
                Container(color: Colors.white.withOpacity(0.2), height: 1),
                Space.y(2.w)!,
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
              ],
            ),
          // Space.y!,
    );
  }
}
