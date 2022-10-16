import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:info_teby/Db/Data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyController extends GetxController with SingleGetTickerProviderMixin {
  RxInt count = 0.obs;
  List? query;
  List listFav = [];
  Widget appBarTitle = Text(
    "300 معلومة طبية",
    style: new TextStyle(color: Colors.white),
  );
  RxBool IsSearching = false.obs;
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final TextEditingController searchQuery = new TextEditingController();
  List<String> icons = [
    "assets/images/img_10_31.png",
    "assets/images/tghb.png",
    "assets/images/social_2.png",
    "assets/images/ddf.png",
    "assets/images/app1.png",
    "assets/images/app2.png",
    "assets/images/app3.png",
    "assets/images/app4.png",
    "assets/images/app5.png"
  ];
  List<String> titles = [
    "تقيم التطبيق",
    "حول التطبيق",
    "مشاركة التطبيق",
    "اليريد الالكتروني",
    "حمل تطبيق الأربعين النووية",
    "حمل تطبيق ادعية الشيخ الشعراوى",
    "حمل تطبيق وصايا الرسول ﷺ",
    "حمل تطبيق حكم وامثال ",
    "حمل تطبيق احكام القرآن للشافعي"
  ];

  Future<void> share(title, text, link) async {
    await FlutterShare.share(
        title: title,
        text: text,
        linkUrl: link,
        chooserTitle: 'Example Chooser Title');
  }

  readAllFav() async {
    listFav = await db!.getAllFav();
    idFav = [];
    listFav.forEach((element) {
      idFav.add(int.parse(element["id"].toString()));
    });
    update();
  }

  List favDep = [];
  String title = "";
  int id_dep = 1;
  readFav(id_dep, title) async {
    this.title = title;
    this.id_dep = id_dep;
    favDep = await db!.readFav(id_dep);
    update();
  }

  update_fav_part(id_part, id, id_exit, idid) async {
    await db!.update_fav_part(id_part, id, id_exit);
    await readFav(idid, title);
  }

  deleteFav(id, id_dep) async {
    await db!.deleteFav(id, id_dep);
    await readFav(id_dep, title);
    readAllFav();
  }

  deleteAll() async {
    await db!.deleteAll();
    await readFAvDep();
    await readAllFav();
    await readFav(1, title);
  }

  ItemScrollController scrollController = ItemScrollController();
  List list = [];
  readList() async {
    list = await db!.readData();
    update();
  }

  Animation<double>? manimation;
  AnimationController? mcontroller;
  double scale = 0.0;
  Data? db;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    db = Data();
    await db!.inti();
    await readList();
    query = list;
    await getReumeToCon();
    await readFAvDep();

    final quick = const Duration(milliseconds: 500);
    final scaleTween = Tween(begin: 0.0, end: 1.0);
    mcontroller = AnimationController(duration: quick, vsync: this);
    manimation = scaleTween.animate(
      CurvedAnimation(
        parent: mcontroller!,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    )..addListener(() {
        scale = manimation!.value;
        update();
      });
    readAllFav();
  }

  int favs_index = -1;
  @override
  void dispose() {
    mcontroller!.dispose();
    super.dispose();
  }

  void animate(f) async {
    favs_index = f;
    manimation!
      ..addStatusListener((AnimationStatus status) {
        if (scale == 1.0) {
          mcontroller!.reverse();
        }
      });
    mcontroller!.forward();
  }

  void increase() {
    count++;
  }

  RxString searchText = "".obs;
  SearchListState() {
    searchQuery.addListener(() {
      if (searchQuery.text.isEmpty) {
        searchText = "".obs;
        IsSearching.value = false;
      } else {
        searchText = searchQuery.text.obs;
        IsSearching.value = true;
      }
    });
  }

  seekTo() async {
    List l = await db!.getResume();
    int id = l[0]["id"];
    int m = 0;
    for (Map mm in list) {
      if (mm["_id"] == id) break;
      m++;
    }
    print(m.toString());
    scrollController.scrollTo(index: m, duration: Duration(seconds: 1));
  }

  queryM(q) async {
    List filter = [];
    query!.forEach((element) {
      if (element["qte"].toString().contains(q)) filter.add(element);
    });
    list = filter;
    update();
  }

  add_fav(id_dep, id) async {
    print(id);
    print(id_dep);
    await db!.add_fav(id, id_dep);
    readAllFav();
  }

  void updateResume(id) async {
    await db!.updateResume(id);
    await getReumeToCon();
  }

  int seek = 0;
  Future<void> getReumeToCon() async {
    List l = await db!.getResume();
    seek = l[0]["id"];
    update();
  }

  void handleSearchStart() {
    IsSearching.value = true;
    update();
  }

  String dropdownValue = 'غير مزغرف';
  bool home = true;
  changePag(h) {
    if (home != h) home = h;
    update();
  }

  List list_dep = [];
  List<int> idFav = [];
  readFAvDep() async {
    list_dep = await db!.getAll_dep();
    update();
  }

  updateDep(id) async {
    await db!.updateDep(id, text);
    await readFAvDep();
  }

  int length = 0;
  changeLength(String text) {
    this.text = text;
    length = text.length;
    update();
  }

  String text = "";

  add_fav_dep() async {
    await db!.add_fav_dep(text);
    readFAvDep();
  }

  deleteDep(id_dep) async {
    await db!.deleteDep(id_dep);
    await readFAvDep();
    await readAllFav();
    await readFav(id_dep, title);
  }

  void handleSearchEnd() {
    actionIcon = new Icon(
      Icons.search,
      color: Colors.white,
    );
    this.appBarTitle = new Text(
      "300 معلومة طبية",
      style: new TextStyle(color: Colors.white),
    );
    searchQuery.clear();
    list = query!;
    IsSearching.value = false;
    update();
  }

  double value_Sli = 25;
  changeSlider(value) {
    value_Sli = value;
    update();
  }

  spinnerChange(data) {
    dropdownValue = data;
    update();
  }

  List<String> spinnerItems = ['غير مزغرف', 'مزغرف'];
}
