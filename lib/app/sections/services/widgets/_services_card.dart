part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const _ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final len = widget.service.tool.length;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        width: Responsive.isTablet(context) ? 400 : 300,
        // height: AppDimensions.normalize(100),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: isHover ? pinkPurpleGradient : theme.serviceCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.service.icon,
              height: 60,
            ),
            Space.y(3.w)!,
            Text(widget.service.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHover ? whiteColor : theme.textColor,
                )),
            Space.y(1.w)!,
            Text(
              widget.service.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isHover ? whiteColor.withOpacity(0.8) : theme.textColor,
                fontWeight: FontWeight.w200,
                fontSize: 13,
              ),
            ),
            Space.y(2.w)!,
            if (Responsive.isDesktop(context))
              if (len > 4)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: List.generate((len/2).ceil(), (index) {
                        final e = widget.service.tool[index];
                        return Row(
                          children: [
                            const Text('🛠   '),
                            Text(
                              e,
                              style: TextStyle(
                                color: isHover ? whiteColor : theme.textColor,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: List.generate((len - len/2).ceil(), (index) {
                        final e = widget.service.tool[(len/2).ceil()+index];
                        return Row(
                          children: [
                            const Text('🛠   '),
                            Text(
                              e,
                              style: TextStyle(
                                color: isHover ? whiteColor : theme.textColor,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ]
              )else
                ...widget.service.tool.map((e) => Row(
                  children: [
                    const Text('🛠   '),
                    Text(
                      e,
                      style: TextStyle(
                        color: isHover ? whiteColor : theme.textColor,
                      ),
                    ),
                  ],
                )),

            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: widget.service.tool
                        .map((e) => Row(
                              children: [
                                const Text('🛠   '),
                                Text(e,
                                    style: TextStyle(
                                      color: isHover
                                          ? whiteColor
                                          : theme.textColor,
                                    )),
                              ],
                            ))
                        .toList()),
              )
          ],
        ),
      ),
    );
  }
}
