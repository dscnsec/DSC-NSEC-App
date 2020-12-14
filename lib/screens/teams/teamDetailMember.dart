import 'package:dscnsec_app/screens/teams/teams_data/Team_Data_Holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamMember extends StatefulWidget {
  TeamMemberDetail detail;
  TeamMember({
    this.detail
  });

  @override
  _TeamMemberState createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  _appbar() {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 5),
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black, // team Color
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: Text(
              "DSC NSEC",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'productSans',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0, top: 5.0, bottom: 5),
            child: CircleAvatar(
              radius: 29.0,
              child: dsclogo(),
            ),
          ),
        ],
      ),
    );
  }

  Widget dsclogo() {
    var assetImage = AssetImage("assets/images/dsclogo.png");
    var image = Image(
      image: assetImage,
      height: 100,
      width: 100,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }

  textBox(String text, double size, FontWeight fontWeight) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'productSans',
        fontWeight: fontWeight,
        fontSize: size,
        color: Colors.black,
      ),
    );
  }

  _screen() {
    return Stack(children: [
      Container(
        width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil.instance.setHeight(100),
            ),
            Container(
              width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight:
                        Radius.circular(ScreenUtil.instance.setHeight(40)),
                    topLeft:
                        Radius.circular(ScreenUtil.instance.setHeight(40))),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 3,
                      offset: Offset(0, 5))
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(100),
                  ),
                  Container(
                    height: ScreenUtil.instance.setHeight(570),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        textBox("name", 22, FontWeight.w600),
                        textBox("designation", 22, FontWeight.w600),
                        textBox("about", 22, FontWeight.w600),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Center(
                            child: textBox(
                                "sdf n jsdfnkdsfnlksdflksdfmdlskff dsflkndslifjldsfdsfd sfiodsfidsfnisdfsd dfdsiofhsdfdsjfsdoifds  dsifdsifjsdofjdsoofsdpf sdfpojdsfpkdfpdsfkdspf fodsfjodsfmdslf dsfsndsflksdfldsf  ",
                                18,
                                FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(16),
                        ),
                        _skillset(),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(16),
                        ),
                        _skillset(),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(16),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: ScreenUtil.instance.setHeight(25),
        left: ScreenUtil.instance.setHeight(155),
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 55,
              child: ClipOval(
                  child: FadeInImage.assetNetwork(
                fadeInCurve: Curves.bounceIn,
                fadeInDuration: const Duration(seconds: 1),
                placeholder: 'assets/images/loading.gif',
                image:
                    'https://i.pinimg.com/564x/24/37/bd/2437bd9758a684862c11aa9e8f20341a.jpg',
                fit: BoxFit.fill,
              )),
            )),
      )
    ]);
  }

  _launchAnyURL(var getUrl) async {
    var url = getUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _skillset() {
    return Container(
        height: ScreenUtil.instance.setHeight(32),
        width: ScreenUtil.instance.setWidth(64),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
              child: Text("skills ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w400))),
        ));
  }

  double defaultHeight = 896;
  double defaultWidth = 414;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        height: defaultHeight, width: defaultWidth, allowFontScaling: false)
      ..init(context);

    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Container(child: Column(children: [_appbar(), _screen()])),
      )),
    );
  }
}
