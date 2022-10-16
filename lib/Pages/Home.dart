import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:info_teby/Pages/Favorite.dart';
import 'package:info_teby/controller/MyController.dart';
import 'package:launch_review/launch_review.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends GetView<MyController> {
  void sendd() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'abosamour99@gmail.com',
      query:
          'subject=App Feedback&body=App Version 1', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int fav_index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<MyController>(
        builder: (_) => Scaffold(
              drawer: Drawer(
                backgroundColor: Colors.blueGrey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset("assets/images/bg_drawer.png"),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            controller.changePag(true);
                            Navigator.of(context).pop();
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              )),
                          title: Text(
                            "الصفحة الرئسية",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            controller.changePag(false);
                            Navigator.of(context).pop();
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )),
                          title: Text(
                            "المفضلة",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            LaunchReview.launch(
                                androidAppId: "com.soonfu.info_teby");
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[0])),
                          title: Text(
                            controller.titles[0],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.INFO,
                              body: Center(
                                child: Text(
                                  "تطبيق 300 معلومة طبية قيمة  يضم 300 معلومة طبية\n"
                                  "طور بواسطة محمود حسن احمد",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              title: 'This is Ignored',
                              desc: 'This is also Ignored',
                              btnOkOnPress: () {},
                            )..show();
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[1])),
                          title: Text(
                            controller.titles[1],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            controller.share(
                                "تطبيق 300 معلومة طبية",
                                "مشاركة التطبيق ",
                                "https://play.google.com/store/apps/details?id=com.soonfu.info_teby");
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[2])),
                          title: Text(
                            controller.titles[2],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            sendd();
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[3])),
                          title: Text(
                            controller.titles[3],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            LaunchReview.launch(
                                androidAppId: "apps.soonfu.nawawiforty");
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[4])),
                          title: Text(
                            controller.titles[4],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            LaunchReview.launch(
                                androidAppId: "apps.soonfu.doaa");
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[5])),
                          title: Text(
                            controller.titles[5],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.indigoAccent,
                        child: ListTile(
                          onTap: () {
                            LaunchReview.launch(
                                androidAppId: "apps.soonfu.shaphiai");
                          },
                          leading: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(controller.icons[7])),
                          title: Text(
                            controller.titles[7],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              appBar: controller.home
                  ? AppBar(
                      centerTitle: true,
                      backgroundColor: Colors.blueGrey,
                      title: controller.appBarTitle,
                      actions: [
                        IconButton(
                          icon: controller.actionIcon,
                          onPressed: () {
                            if (controller.actionIcon.icon == Icons.search) {
                              controller.actionIcon = Icon(
                                Icons.close,
                                color: Colors.white,
                              );
                              controller.appBarTitle = TextField(
                                onChanged: (text) {
                                  controller.queryM(text);
                                },
                                controller: controller.searchQuery,
                                style: new TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: new InputDecoration(
                                  prefixIcon: new Icon(Icons.search,
                                      color: Colors.white),
                                  hintText: "بحث...",
                                  hintStyle: new TextStyle(color: Colors.white),
                                ),
                              );
                              controller.handleSearchStart();
                            } else {
                              controller.handleSearchEnd();
                            }
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              controller.seekTo();
                            },
                            icon: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            )),
                      ],
                    )
                  : AppBar(
                      backgroundColor: Colors.blueGrey,
                      title: Text(
                        "المفضلة",
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              AwesomeDialog(
                                btnOkText: 'نعم',
                                btnCancelText: "لا",
                                context: context,
                                animType: AnimType.SCALE,
                                dialogType: DialogType.warning,
                                body: Center(
                                  child: Text(
                                    "هل تريد فعلا جذف محتوي المفضلة",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                title: 'حزف المحتوي',
                                desc: 'This is also Ignored',
                                btnOkOnPress: () {
                                  controller.deleteAll();
                                },
                                btnCancelOnPress: () {},
                              )..show();
                            },
                            icon: Icon(Icons.delete_forever)),
                      ],
                    ),
              body: controller.list.length == 0
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                    )
                  : controller.home
                      ? ScrollablePositionedList.builder(
                          itemScrollController: controller.scrollController,
                          itemBuilder: (context, inde) {
                            return Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.updateResume(controller
                                              .list[(inde - (inde / 8).toInt())]
                                          ["_id"]);
                                      // controller.updateResume(controller.list[(index-(index/8).toInt())].id);
                                    },
                                    icon: Icon(Icons.bookmark,
                                        size: 30,
                                        color: controller.seek ==
                                                controller.list[(inde -
                                                    (inde / 8).toInt())]["_id"]
                                            ? Colors.red
                                            : Colors.lightBlue),
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.zero,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text(
                                          controller.list[(inde -
                                              (inde / 8).toInt())]["qte"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: controller.value_Sli,
                                              fontFamily:
                                                  controller.dropdownValue ==
                                                          'غير مزغرف'
                                                      ? null
                                                      : "format"),
                                        ),
                                        alignment: Alignment
                                            .center /*Text(controller.list[(index-(index/8).toInt())].text,textAlign: TextAlign.center,style: TextStyle(fontSize: controller.value_Sli,fontFamily: controller.dropdownValue=="غير مزغرف"?null:"format",color: Colors.white)*/,
                                      ),
                                      if (controller.favs_index ==
                                          ((inde - (inde / 8).toInt())))
                                        Container(
                                          child: Transform.scale(
                                            scale: controller.scale,
                                            child: Icon(Icons.favorite,
                                                size: 160.0, color: Colors.red),
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    indent: 30,
                                    endIndent: 30,
                                    height: 10,
                                    color: Colors.amberAccent,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            fav_index =
                                                (inde - (inde / 8).toInt());
                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                ),
                                                context: context,
                                                useRootNavigator: true,
                                                isDismissible: true,
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder: (context) {
                                                  return FractionallySizedBox(
                                                    heightFactor: 0.8,
                                                    child:
                                                        DraggableScrollableSheet(
                                                      initialChildSize: 0.5,
                                                      maxChildSize: 1,
                                                      minChildSize: 0.25,
                                                      builder: (BuildContext
                                                              context,
                                                          ScrollController
                                                              scrollController) {
                                                        return Scaffold(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          appBar: AppBar(
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                            title: Text(
                                                                "اختر المفضلة"),
                                                            centerTitle: true,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30)),
                                                            ),
                                                          ),
                                                          floatingActionButton:
                                                              FloatingActionButton(
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                context:
                                                                    context,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20)),
                                                                ),
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child: GetBuilder<
                                                                        MyController>(
                                                                      builder:
                                                                          (_) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.blueGrey,
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Expanded(
                                                                                    child: Text(
                                                                                  "اسم الملف",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )),
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      controller.add_fav_dep();
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.add,
                                                                                      color: Colors.red,
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.folder,
                                                                            color:
                                                                                Colors.brown,
                                                                            size:
                                                                                80,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                CupertinoTextField(
                                                                              onChanged: (text) {
                                                                                controller.changeLength(text);
                                                                              },
                                                                              autofocus: true,
                                                                              maxLength: 25,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                              "${controller.length}/25"),
                                                                          Row(
                                                                            children: [
                                                                              IconButton(
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  icon: Icon(Icons.cancel)),
                                                                              Expanded(child: Text(""))
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).whenComplete(
                                                                  () {
                                                                controller
                                                                    .length = 0;
                                                              });
                                                            },
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                            child:
                                                                Icon(Icons.add),
                                                          ),
                                                          body: Container(
                                                            color: Colors.white,
                                                            child: ListView
                                                                .builder(
                                                              controller:
                                                                  scrollController,
                                                              itemCount: controller
                                                                  .list_dep
                                                                  .length, //firstController.fav_part.length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Row(
                                                                    children: [
                                                                      if (index !=
                                                                          0)
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                                                ),
                                                                                builder: (context) {
                                                                                  TextEditingController myController = TextEditingController()..text = controller.list_dep[index]["name"];
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: GetBuilder<MyController>(
                                                                                      builder: (_) => Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.blueGrey,
                                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                                                            ),
                                                                                            child: Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                    child: Text(
                                                                                                  "اسم الملف",
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: TextStyle(color: Colors.white),
                                                                                                )),
                                                                                                IconButton(
                                                                                                    onPressed: () {
                                                                                                      controller.updateDep(controller.list_dep[index]["id"]);
                                                                                                      //  firstController.updateFav_part(firstController.fav_part[index+1]["id"]);
                                                                                                      Navigator.of(context).pop();
                                                                                                    },
                                                                                                    icon: Icon(
                                                                                                      Icons.add,
                                                                                                      color: Colors.red,
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.folder,
                                                                                            color: Colors.brown,
                                                                                            size: 80,
                                                                                          ),
                                                                                          Container(
                                                                                            width: 200,
                                                                                            child: CupertinoTextField(
                                                                                              controller: myController,
                                                                                              onChanged: (text) {
                                                                                                controller.changeLength(text);
                                                                                              },
                                                                                              autofocus: true,
                                                                                              maxLength: 25,
                                                                                            ),
                                                                                          ),
                                                                                          Text("${controller.length}/25"),
                                                                                          Row(
                                                                                            children: [
                                                                                              IconButton(
                                                                                                  onPressed: () {
                                                                                                    Navigator.of(context).pop();
                                                                                                  },
                                                                                                  icon: Icon(Icons.cancel)),
                                                                                              Expanded(child: Text(""))
                                                                                            ],
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).whenComplete(() {
                                                                                controller.length = 0;
                                                                              });
                                                                            },
                                                                            icon:
                                                                                Icon(
                                                                              Icons.edit,
                                                                              color: Colors.green,
                                                                            )),
                                                                      Expanded(
                                                                          child: InkWell(
                                                                              onTap: () {
                                                                                controller.add_fav(controller.list_dep[index]["id"], controller.list[fav_index]["_id"]);
                                                                                Navigator.of(context).pop();
                                                                                controller.animate(fav_index);
                                                                              },
                                                                              child: Text(
                                                                                controller.list_dep[index]["name"],
                                                                                style: TextStyle(color: Colors.indigo),
                                                                                textAlign: TextAlign.right,
                                                                              ))),
                                                                      Icon(
                                                                        Icons
                                                                            .folder_open,
                                                                        color: Colors
                                                                            .brown,
                                                                        size:
                                                                            50,
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: controller.idFav.contains(
                                                    controller.list[(inde -
                                                            (inde / 8).toInt())]
                                                        ["_id"])
                                                ? Colors.red
                                                : Colors.white,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            controller.share(
                                                "تطبيق 300 معلومة طيية",
                                                controller.list[(inde -
                                                    (inde / 8).toInt())]["qte"],
                                                "");
                                            // share(controller.list[index].author,controller.list[(index-(index/8).toInt())].text);
                                          },
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.amberAccent,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.list.length,
                        )
                      : Container(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return index == 0
                                  ? Container(
                                      width: double.infinity,
                                      height: 100,
                                      margin: EdgeInsets.all(5),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(Favorite(
                                                id_de: 1, title: "كل المفضلة"));
                                          },
                                          child: Text(
                                            controller.list_dep[index]["name"],
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateColor.resolveWith(
                                                      (states) =>
                                                          Colors.blueGrey),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.blueGrey))))),
                                    )
                                  : index == controller.list_dep.length
                                      ? Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: GetBuilder<
                                                        MyController>(
                                                      builder: (_) => Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20)),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                    child: Text(
                                                                  "اسم الملف",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .add_fav_dep();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.folder,
                                                            color: Colors.brown,
                                                            size: 80,
                                                          ),
                                                          Container(
                                                            width: 200,
                                                            child:
                                                                CupertinoTextField(
                                                              onChanged:
                                                                  (text) {
                                                                controller
                                                                    .changeLength(
                                                                        text);
                                                              },
                                                              autofocus: true,
                                                              maxLength: 25,
                                                            ),
                                                          ),
                                                          Text(
                                                              "${controller.length}/25"),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .cancel)),
                                                              Expanded(
                                                                  child:
                                                                      Text(""))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).whenComplete(() {
                                                controller.length = 0;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                              size: 50,
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100,
                                              margin: EdgeInsets.all(5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(Favorite(
                                                        id_de: controller
                                                                .list_dep[index]
                                                            ["id"],
                                                        title: controller
                                                                .list_dep[index]
                                                            ["name"]));
                                                    //Get.to(Favorite(controller.fav_part[index+1]["id"],controller.fav_part[index+1]["name"]));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      //controller.fav_part[index+1]["name"];
                                                      Text(
                                                        controller
                                                                .list_dep[index]
                                                            ["name"],
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  context:
                                                                      context,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20),
                                                                        topRight:
                                                                            Radius.circular(20)),
                                                                  ),
                                                                  builder:
                                                                      (context) {
                                                                    TextEditingController
                                                                        myController =
                                                                        TextEditingController()
                                                                          ..text =
                                                                              controller.list_dep[index]["name"];
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child: GetBuilder<
                                                                          MyController>(
                                                                        builder:
                                                                            (_) =>
                                                                                Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.blueGrey,
                                                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                                              ),
                                                                              child: Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                      child: Text(
                                                                                    "اسم الملف",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  )),
                                                                                  IconButton(
                                                                                      onPressed: () {
                                                                                        controller.updateDep(controller.list_dep[index]["id"]);
                                                                                        //controller.updateFav_part(controller.fav_part[index+1]["id"]);
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      icon: Icon(
                                                                                        Icons.add,
                                                                                        color: Colors.red,
                                                                                      )),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.folder,
                                                                              color: Colors.brown,
                                                                              size: 80,
                                                                            ),
                                                                            Container(
                                                                              width: 200,
                                                                              child: CupertinoTextField(
                                                                                controller: myController,
                                                                                onChanged: (text) {
                                                                                  controller.changeLength(text);
                                                                                },
                                                                                autofocus: true,
                                                                                maxLength: 25,
                                                                              ),
                                                                            ),
                                                                            Text("${controller.length}/25"),
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                    icon: Icon(Icons.cancel)),
                                                                                Expanded(child: Text(""))
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).whenComplete(
                                                                    () {
                                                                  controller
                                                                      .length = 0;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                          IconButton(
                                                              onPressed: () {
                                                                AwesomeDialog(
                                                                  btnOkText:
                                                                      'نعم',
                                                                  btnCancelText:
                                                                      "لا",
                                                                  context:
                                                                      context,
                                                                  animType:
                                                                      AnimType
                                                                          .SCALE,
                                                                  dialogType:
                                                                      DialogType
                                                                          .warning,
                                                                  body: Center(
                                                                    child: Text(
                                                                      "هل تريد فعلا جذف محتوي المفضلة لهذا الجزء",
                                                                      style: TextStyle(
                                                                          fontStyle:
                                                                              FontStyle.italic),
                                                                    ),
                                                                  ),
                                                                  title:
                                                                      'حزف المحتوي',
                                                                  desc:
                                                                      'This is also Ignored',
                                                                  btnOkOnPress:
                                                                      () {
                                                                    controller.deleteDep(
                                                                        controller.list_dep[index]
                                                                            [
                                                                            "id"]);
                                                                  },
                                                                  btnCancelOnPress:
                                                                      () {},
                                                                )..show();
                                                              },
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                              ))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                            },
                            itemCount: controller.list_dep.length + 1,
                          ),
                        ),
              floatingActionButton: controller.home
                  ? FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      onPressed: () {
                        Get.defaultDialog(
                          title: "الخط",
                          titleStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          backgroundColor: Colors.blueGrey,
                          content: GetBuilder<MyController>(
                              builder: (_) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 25,
                                          ),
                                          DropdownButton<String>(
                                            value: controller.dropdownValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.white,
                                            ),
                                            onChanged: (data) {
                                              controller.spinnerChange(data);
                                            },
                                            items: controller.spinnerItems
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          Expanded(
                                              child: Text(
                                            "شكل الخط",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Slider(
                                                thumbColor: Colors.white,
                                                activeColor: Colors.white,
                                                inactiveColor: Colors.grey,
                                                min: 10,
                                                max: 50,
                                                value: controller.value_Sli,
                                                onChanged: (value) {
                                                  controller
                                                      .changeSlider(value);
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Text(
                                            "حجم الخط",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))
                                        ],
                                      )
                                    ],
                                  )),
                        );
                      },
                      child: Icon(Icons.format_size),
                    )
                  : null,
            ));
  }
}
