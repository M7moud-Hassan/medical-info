import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_teby/controller/MyController.dart';
class Favorite extends GetView<MyController> {
   Favorite({Key? key, this.id_de,this.title, }) : super(key: key){
     controller.readFav(id_de,title);

  }
  final id_de;
   final title;
   int index_fav=0;

  @override
  Widget build(BuildContext context){
    return GetBuilder<MyController>(builder: (_)=>
        Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              centerTitle: true,
              title:Text(controller.title),
          actions: [
            IconButton(onPressed: (){
              AwesomeDialog(
                btnOkText: 'نعم',
                btnCancelText: "لا",
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.warning,
                body: Center(child: Text(
                  "هل تريد فعلا حزف محتوي المفضلة لهذا الجزء",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),),
                title: 'حزف المحتوي',
                desc:   'This is also Ignored',
                btnOkOnPress: () {
                  if(controller.id_dep==1)
                    controller.deleteAll();
                  else
                  controller.deleteDep(controller.id_dep);
                },
                btnCancelOnPress: (){},
              )..show();
            }, icon: Icon(Icons.delete_forever,color: Colors.white,)),
          ],
        ),
          body: ListView.builder(
              itemCount: controller.favDep.length,
              itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: double.infinity,child: Text(controller.favDep[index]["qte"],textAlign: TextAlign.center,style: TextStyle(fontSize: controller.value_Sli,fontFamily: controller.dropdownValue=="غير مزغرف"?null:"format",color: Colors.white),),),
                    if(controller.id_dep==1)
                      Container(margin: EdgeInsets.only(left: 20),child: InkWell(
                        onTap: (){
                          controller.readFav(controller.favDep[index]["id"], controller.favDep[index]["name"]);
                           },
                          child: Text(controller.favDep[index]["name"],style: TextStyle(color: Colors.amberAccent,fontSize: 20,decoration: TextDecoration.underline),textAlign: TextAlign.left)))
                        ,Divider(
                          thickness: 2,
                          indent: 30,
                          endIndent: 30,
                          height: 10,
                          color: Colors.amberAccent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed:(){
                             controller.share("تطبيق 300 معلومة طبية",controller.favDep[index]["qte"],"");
                            }, icon: Icon(Icons.share,color: Colors.amberAccent,)),
                            IconButton(onPressed:(){
                              AwesomeDialog(
                                btnOkText: 'نعم',
                                btnCancelText: "لا",
                                context: context,
                                animType: AnimType.SCALE,
                                dialogType: DialogType.warning,
                                body: Center(child: Text(
                                  "هل تريد فعلا حزف هذه المفضلة لهذا الجزء",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),),
                                title: 'حزف المحتوي',
                                desc:   'This is also Ignored',
                                btnOkOnPress: () {
                                  controller.deleteFav(controller.favDep[index]["_id"],controller.id_dep);
                                },
                                btnCancelOnPress: (){},
                              )..show();
                            }, icon: Icon(Icons.delete_forever,color: Colors.red,)),
                            IconButton(onPressed:(){
                              index_fav=index;
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  context: context,
                                  useRootNavigator: true,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.8,
                                      child: DraggableScrollableSheet(
                                        initialChildSize: 0.5,
                                        maxChildSize: 1,
                                        minChildSize: 0.25,
                                        builder:
                                            (BuildContext context, ScrollController scrollController) {
                                          return Scaffold(
                                            backgroundColor: Colors.transparent,
                                            appBar: AppBar(
                                              backgroundColor: Colors.blueGrey,
                                              title: Text("اختر المفضلة"),
                                              centerTitle: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                                              ),
                                            ),
                                            body: Container(
                                              color: Colors.white,
                                              child: ListView.builder(
                                                controller: scrollController,
                                                itemCount: controller.list_dep.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return controller.list_dep[index]["id"]==controller.favDep[index_fav]["id"]?Container():Container(
                                                    width: double.infinity,
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.arrow_back_rounded),
                                                        Expanded(child: InkWell(onTap: (){
                                                         controller.update_fav_part(controller.list_dep[index]["id"],controller.favDep[index_fav]["_id"],controller.favDep[index_fav]["id"],controller.id_dep);
                                                          Navigator.of(context).pop();
                                                        },child: Text(controller.list_dep[index]["name"],style: TextStyle(color: Colors.indigo),textAlign: TextAlign.right,))),
                                                        Icon(Icons.folder_open,color: Colors.brown,size: 50,)
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
                            }, icon: Icon(Icons.double_arrow_outlined,color: Colors.amberAccent,)),
                          ],
                        )
                      ],
                    ),
                  );
              }),
        )
    );
  }
}
