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
  List<Widget> _skills() {
    List skillList = detail.skills.split(",");
    List<Widget> skill = List<Widget>();
    for (int i = 0; i < skillList.length; i++) {
      skill.add(_skillset(skillList[i]));
    }
    return skill;
  }
  _skillset(String skill) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(12),
      right: ScreenUtil.instance.setHeight(8),),
          width: ScreenUtil.instance.setWidth( (skill.length.toDouble()<7)? 100:(skill.length.toDouble()>25)?skill.length.toDouble() * 10:skill.length.toDouble() * 13 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: detail.color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
              child: Text(skill,
                  style: TextStyle(
                      fontFamily: 'productSans',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500))),
        ));
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
          body: Stack(
            
                    children:[ Column(
              children: [
                _appbar(),
                Expanded(child:Container( color:detail.color , child: Column(
                      children: [
                            
                            Container(
                              color: detail.color,
                              height: ScreenUtil.instance.setHeight(100), 
                            ),

                          Container(
        width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
        height:MediaQuery.of(context).size.height * .75,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight:
          Radius.circular(ScreenUtil.instance.setHeight(40)),
          topLeft:
          Radius.circular(ScreenUtil.instance.setHeight(40))),
        boxShadow: [
        BoxShadow(
        color: detail.color.withOpacity(.1),
        blurRadius: 2,
        offset: Offset(0, 0))
        ],
        ),

          child: SingleChildScrollView(
            child: Column(
              children: [

                   SizedBox(
          height: ScreenUtil.instance.setHeight(80),
          ),
            textBox(detail.name, 26, FontWeight.w600),
            textBox(detail.designation, 22, FontWeight.w500),
                 SizedBox(
          height: ScreenUtil.instance.setHeight(8),
          ),

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
          child: Icon(FontAwesomeIcons.linkedin , size: 30,),
          ),
      ),
              if (detail.github != "")
      GestureDetector(
          onTap: () {
          _launchAnyURL(detail.github);
          },
          child: Container(
          padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
          child: Icon(FontAwesomeIcons.github  , size: 30,),
          ),
      ),
              if (detail.twitter != "")
      GestureDetector(
          onTap: () {
          _launchAnyURL(detail.twitter );
          },
          child: Container(
          padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
          child: Icon(FontAwesomeIcons.twitter  , size: 30,),
          ),
      ),
              if (detail.facebook != "")
      GestureDetector(
          onTap: () {
          _launchAnyURL(detail.facebook);
          },
          child: Container(
          padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
          child: Icon(FontAwesomeIcons.facebook  , size: 30,),
          ),
      ),
              if (detail.instagram != "")
      GestureDetector(
          onTap: () {
          _launchAnyURL(detail.instagram);
          },
          child: Container(
          padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
          child: Icon(FontAwesomeIcons.instagram  , size: 30,),
          ),
      ),
              if (detail.website != "")
      GestureDetector(
          onTap: () {
          _launchAnyURL(detail.website);
          },
          child: Container(
          padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
          child: Icon(Icons.language  , size: 30,),
          ),
      ),
      ]),
          
          SizedBox(
          height: ScreenUtil.instance.setHeight(16),
          ),

          Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Center(
      child: Container(
          margin: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(12)),
          child: Text(
          detail.desc,
          textAlign: TextAlign.justify,
          style: TextStyle(
          fontFamily: 'productSans',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
          ),
          ),
    )
              ),
            ),
                      SizedBox(
          height: ScreenUtil.instance.setHeight(8),
          ),

     
            Container(
               padding: const EdgeInsets.symmetric(horizontal:16),
              child: (detail.skills != "")
          ? Wrap(
      alignment: WrapAlignment.center,
          children: _skills())
          : Container(),
            ),
                   SizedBox(
          height: ScreenUtil.instance.setHeight(8),
          ),
              ],
            ),
          ),

                          )

                      ],
                ),
                )
                ),
              ],
            ),
            
                 Positioned(
          top: ScreenUtil.instance.setHeight(120),
          left: ScreenUtil.instance.setWidth(130),
          child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [   BoxShadow(
              color: detail.color.withOpacity(.1),
              blurRadius: 2,
              offset: Offset(0, 0))
            ],),
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
        ),          

            
            ],
            
                    ),
    ));
  }
}
