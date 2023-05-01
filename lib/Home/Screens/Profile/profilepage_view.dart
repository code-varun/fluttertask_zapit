import 'package:crypto_app/Components/custom_elevated_stadiumbutton.dart';
import 'package:crypto_app/GlobalModels/user_model.dart';
import 'package:crypto_app/GlobalModels/user_model_bloc/user_model_bloc.dart';
import 'package:crypto_app/OtherScreens/Settings/Settingspage/view/settingpage_view.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProfilePage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  final Function onScreenHideButtonPressed;
  const ProfilePage(
      {Key? key,
      required this.menuScreenContext,
      required this.hideStatus,
      required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              color: ColorCustom.brilliantAzura,
              height: 250,
              child: Stack(children: [
                Positioned(
                  right: 100,
                  bottom: 50,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: ColorCustom.maastrichtBlue.withAlpha(50),
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
                Positioned(
                  left: 250,
                  top: 100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
              ]),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Profile",
                      style: FontsCustom.dmSans(
                        fontSize: 28,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  pushNewScreen(context,
                                      screen: SettingsPage());
                                },
                                icon: const Icon(
                                  Icons.settings,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<UserModelBloc, UserModelState>(
                              builder: (context, state) {
                            return Text(
                              "${(state.props.first as UserModel).name}",
                              style: FontsCustom.dmSans(
                                fontSize: 21,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<UserModelBloc, UserModelState>(
                              builder: (context, state) {
                            return Text(
                              "${(state.props.first as UserModel).email}",
                              style: FontsCustom.dmSans(
                                fontSize: 12,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const ListTile(
                            leading: Icon(Icons.payment),
                            title: Text("Payments"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                          const ListTile(
                            leading: Icon(Icons.star_rounded),
                            title: Text("Achivements"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.share,
                            ),
                            title: Text("Share With Friends"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                          const ListTile(
                            leading: Icon(Icons.reviews),
                            title: Text("Review"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(200)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomElevatedStadiumButton(
            func: null,
            buttonText: "Sign Out",
          ),
        ),
      ],
    );
  }
}
