import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/widgets/custom_appbar_widget.dart';
import 'package:yoga_app_ui/view/widgets/custom_drawer_widget.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';
import 'package:yoga_app_ui/view/widgets/text_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(
      begin: AppColor.transparentColor,
      end: AppColor.primaryColor,
    ).animate(_animationController);
    _iconTween = ColorTween(
      begin: AppColor.whiteColor,
      end: AppColor.secondaryColor,
    ).animate(_animationController);
    _drawerTween = ColorTween(
      begin: AppColor.whiteColor,
      end: AppColor.blackColor,
    ).animate(_animationController);
    _homeTween = ColorTween(
      begin: AppColor.whiteColor,
      end: AppColor.secondaryColor,
    ).animate(_animationController);
    _yogaTween = ColorTween(
      begin: AppColor.whiteColor,
      end: AppColor.blackColor,
    ).animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    super.initState();
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      key: scaffoldKey,
      drawer: const CustomDrawerWidget(),

      //body
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            _newHomePageTopContainer(),
                            _yogaForAll(context),
                            _chooseYoga(context),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBarWidget(
                    animationController: _animationController,
                    colorsTween: _colorTween,
                    drawerTween: _drawerTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    yogaTween: _yogaTween,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Container CHOOSE YOGA
  Container _chooseYoga(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.width20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: Dimensions.width10),
            width: MediaQuery.of(context).size.width,
            child: GradientTextWidget(
              text: 'Choose Your Type',
              fontSize: Dimensions.font20,
              gradientColor: AppColor.textGradientColor,
            ),
          ),
          const TextCardWidget(
            text1: 'Power Yoga',
            text2: 'Last TIme: 29 Jan',
            imgPath:
                'https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          ),
          SizedBox(height: Dimensions.height20),
          const TextCardWidget(
            text1: 'Breathing Yoga',
            text2: 'Last TIme: 29 Jan',
            imgPath:
                'https://media.istockphoto.com/photos/young-woman-in-yoga-pose-using-laptop-at-home-picture-id1334071264?b=1&k=20&m=1334071264&s=170667a&w=0&h=0wnQzJJJIA5NMo6dOmVepS6mXC0eqLjI26ADDlIK4Lg=',
          ),
          SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
  // end Container CHOOSE YOGA

  // Container YOGA FOR ALL
  Container _yogaForAll(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.width20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: Dimensions.width10),
            width: MediaQuery.of(context).size.width,
            child: GradientTextWidget(
              text: 'Yoga For All',
              fontSize: Dimensions.font20,
              gradientColor: AppColor.textGradientColor,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          const TextCardWidget(
            text1: 'Weight Loss Yoga',
            text2: 'Last Time : 22 Jan',
            imgPath:
                'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=1520&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          SizedBox(height: Dimensions.height20),
          const TextCardWidget(
            text1: 'Weight Loss Yoga',
            text2: 'Last Time : 22 Jan',
            imgPath:
                'https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          ),
          SizedBox(height: Dimensions.height20),
          const TextCardWidget(
            text1: 'Suryanamaskar',
            text2: 'Last Time : Yesterday',
            imgPath:
                'https://images.unsplash.com/photo-1573590330099-d6c7355ec595?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          ),
          SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
  // end Container YOGA FOR ALL

  // Top Container of HOME PAGE
  Container _newHomePageTopContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Dimensions.width30,
        Dimensions.width30 * 5,
        Dimensions.width30,
        Dimensions.width30 * 2,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(Dimensions.radius20),
          bottomLeft: Radius.circular(Dimensions.radius20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "1",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font25,
                ),
              ),
              Text(
                "Streak",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font15,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "120",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font25,
                ),
              ),
              Text(
                "kCal",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font15,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "26",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font25,
                ),
              ),
              Text(
                "Minutes",
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: Dimensions.font15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  // end Top Container of HOME PAGE
}
