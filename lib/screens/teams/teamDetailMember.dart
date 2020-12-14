import 'package:dscnsec_app/screens/teams/teams_data/Team_Data_Holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamMember extends StatefulWidget {
  TeamMemberDetail detail;
  TeamMember({this.detail});

  @override
  _TeamMemberState createState() => _TeamMemberState(detail);
}

class _TeamMemberState extends State<TeamMember> {
  TeamMemberDetail detail;
  _TeamMemberState(this.detail);

  @override
  void initState() {
    super.initState();
  }

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
                  color: detail.color, // team Color
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

  twoSkillinRow(String one, String two) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_skillset(one), _skillset(two)],
    );
  }

  threeSkillinRow(String one, String two, String three) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_skillset(one), _skillset(two), _skillset(three)],
    );
  }


  _skills() {
    List skillList = detail.skills.split(",");

    if (skillList.length == 1) return _skillset(skillList[0]);
    if (skillList.length == 2)
      return twoSkillinRow(
        skillList[0],
        skillList[1],
      );

    if (skillList.length == 3)
      return threeSkillinRow(skillList[0], skillList[1], skillList[2]);
    if (skillList.length == 4)
    return Column(
        children: [
          threeSkillinRow(skillList[0], skillList[1], skillList[2]),
          _skillset(skillList[3])
        ],
      );

    if (skillList.length == 5)
      return Column(
        children: [
          threeSkillinRow(skillList[0], skillList[1], skillList[2]),
          twoSkillinRow(skillList[3], skillList[4])
        ],
      );

    if (skillList.length == 6) 
     return Column(
        children: [
          threeSkillinRow(skillList[0], skillList[1], skillList[2]),
          threeSkillinRow(skillList[3], skillList[4] , skillList[5]),
        ],
      );

          if (skillList.length == 7) 
     return Column(
        children: [
          threeSkillinRow(skillList[0], skillList[1] , skillList[2]),
           threeSkillinRow(skillList[3], skillList[4] , skillList[5]),
            _skillset(skillList[6])        
        ],
      );

          if (skillList.length == 8) 
     return Column(
        children: [
                threeSkillinRow(skillList[0], skillList[1], skillList[2]),
          twoSkillinRow(skillList[3], skillList[4]),
             threeSkillinRow(skillList[5], skillList[6] , skillList[7]),
        ],
      );


          if (skillList.length == 9) 
     return Column(
        children: [
          threeSkillinRow(skillList[0], skillList[1], skillList[2]),
          threeSkillinRow(skillList[3], skillList[4] , skillList[5]),
        threeSkillinRow(skillList[6], skillList[7] , skillList[8]),
        ],
      );
 
  }

  _skillset(String skill) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(8),
            right: ScreenUtil.instance.setWidth(8)),
            width: ScreenUtil.instance.setWidth(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: detail.color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Text(skill,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500))),
          )),
    );
  }

  textBox(String text, double size, FontWeight fontWeight) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(12)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'productSans',
          fontWeight: fontWeight,
          fontSize: size,
          color: Colors.black,
        ),
      ),
    );
  }

  _screen() {
    return Stack(children: [
      Container(
        width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
        color: detail.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        textBox(detail.name, 26, FontWeight.w600),
                        textBox(detail.designation, 22, FontWeight.w500),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              if (detail.linkedin != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.linkedin);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(FontAwesomeIcons.linkedin),
                                  ),
                                ),
                              if (detail.github != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.github);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(FontAwesomeIcons.github),
                                  ),
                                ),
                              if (detail.twitter != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.twitter);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(FontAwesomeIcons.twitter),
                                  ),
                                ),
                              if (detail.facebook != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.facebook);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(FontAwesomeIcons.facebook),
                                  ),
                                ),
                              if (detail.instagram != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.instagram);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(FontAwesomeIcons.instagram),
                                  ),
                                ),
                              if (detail.website != "")
                                GestureDetector(
                                  onTap: () {
                                    _launchAnyURL(detail.website);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
                                    child: Icon(Icons.language),
                                  ),
                                ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Center(
                            child: textBox(detail.desc, 18, FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16),
                          child: Center(
                              child: (detail.skills != "")
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: 
                                  [_skills()])
                                  : Container()),
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
                image: detail.dp,
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
