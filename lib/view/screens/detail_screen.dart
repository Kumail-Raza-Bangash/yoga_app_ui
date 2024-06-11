import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/screens/ready_screen.dart';
import 'package:yoga_app_ui/view/widgets/custom_button_widget.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class DetailScreen extends StatefulWidget {
  final String text1;
  final String text2;
  final String imgPath;

  const DetailScreen({
    super.key,
    required this.text1,
    required this.text2,
    required this.imgPath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sliver Appbar
          _sliverAppbar(context),
          // Sliver Appbar Body
          _sliverAppbarBody(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _sliverAppbarBody() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(Dimensions.width20),
        color: AppColor.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                GradientTextWidget(
                  text: "16 Mins || 26 Workouts",
                  fontSize: Dimensions.font20,
                  gradientColor: AppColor.textGradientColor,
                ),
              ],
            ),
            const Divider(thickness: 2),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(thickness: 2),
              itemBuilder: (context, index) => ListTile(
                leading: Container(
                  height: 200,
                  margin: EdgeInsets.only(right: Dimensions.width20),
                  child: Image.network(
                    "https://i.pinimg.com/originals/02/28/74/0228749d03812fc95700955e1a05d42e.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                title: GradientTextWidget(
                  text: "Yoga $index",
                  fontSize: Dimensions.font20,
                  gradientColor: AppColor.textGradientColor,
                ),
                subtitle: GradientTextWidget(
                  text: (index % 2 == 0) ? "00:20" : "x20",
                  fontSize: Dimensions.font15,
                  gradientColor: AppColor.textGradientBlackColor,
                ),
                trailing: CustomButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReadyScreen(),
                      ),
                    );
                  },
                  text: 'Start',
                  fontSize: Dimensions.font15,
                  height: 30,
                  width: 80,
                ),
              ),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _sliverAppbar(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: Dimensions.height10 * 5,
      expandedHeight: Dimensions.height30 * 10,
      backgroundColor: AppColor.primaryColor,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: AppColor.whiteColor,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: GradientTextWidget(
          fontSize: Dimensions.font20,
          text: widget.text1,
          gradientColor: AppColor.textGradientWhiteColor,
        ),
        background: Stack(
          children: [
            Image.network(
              widget.imgPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 2,
              left: 80,
              child: GradientTextWidget(
                fontSize: Dimensions.font15 - 3,
                text: widget.text2,
                gradientColor: AppColor.textGradientWhiteColor,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.thumb_up_alt_rounded,
            color: AppColor.whiteColor,
          ),
        ),
      ],
    );
  }
}
