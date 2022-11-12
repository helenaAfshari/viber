import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';
import 'package:viber_getx/controller/emoji_controller.dart';
import 'package:viber_getx/view/chat_screen.dart';
// ignore: must_be_immutable
class EmojiPickerScreen extends StatelessWidget{
  EmojiPickerControllerr controllerr = Get.put(EmojiPickerControllerr());

  EmojiPickerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // click back not exit app 
     body: WillPopScope(
          onWillPop: () { 
         if(controllerr.isEmojiVisible.value){
          controllerr.isEmojiVisible.value=false;
         }else{
          Navigator.pop(context);
         }
         return Future.value(false);
        },
        
       child: Stack(
        children: [
          Column(
          children: [
            ////
          Expanded(child:  Container(
                        color: Colors.red,
                        child:  ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: Messages.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                           return Text("data");
                              
                          },
                          
                        ),
                        
                      
                      ),
                      ),
          ////
            Container(
              height: 70,
              child: Row(
                   children: [
                 Emoji(controllerr: controllerr),
                     Expanded(
                      child:Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                        child: TextField(
                          focusNode: controllerr.focusNode,
                          controller: controllerr.textEditingController,
                          decoration: InputDecoration(
                         hintText: "message",
                        focusedBorder: const OutlineInputBorder(
                       borderSide: BorderSide.none,
                    ),
                      enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(25),
                     borderSide:  BorderSide.none,
                 ),
                
            
            )),
                        ),
                     ),
                   ],
              ),
              
            ),

            Obx(
              ()=> Offstage(
                offstage: !controllerr.isEmojiVisible.value,
                child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                     //when select emoji in show text in textEditing
                      controllerr.textEditingController.text=controllerr.textEditingController.text+emoji.emoji;
                    },
                    onBackspacePressed: () {
                      
                    },
                    config:  const Config(
                      columns: 7,
                      verticalSpacing: 0,
                      horizontalSpacing: 2,
                      initCategory: Category.SMILEYS,
                      emojiSizeMax: 26,
                      bgColor: Color.fromARGB(255, 190, 218, 235),
                      indicatorColor: Color.fromARGB(255, 4, 30, 53),
                      iconColor: Colors.grey,
                      iconColorSelected: Color.fromARGB(255, 4, 62, 109),
                      showRecentsTab: true,
                      recentsLimit: 5,
                       gridPadding: EdgeInsets.only(left: 10,right: 10),
                    enableSkinTones: true,
                      categoryIcons: CategoryIcons(),
                      buttonMode: ButtonMode.CUPERTINO,
            
                    ),
                  ),
                ),
              ),
            )
          ],
         ),
        ],
         
       ),
    
     ),
    );
  }

}

class Emoji extends StatelessWidget {
   final EmojiPickerControllerr controllerr;
  const Emoji({
    Key? key,
    required this.controllerr,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      controllerr.isEmojiVisible.value=!controllerr.isEmojiVisible.value;
      controllerr.focusNode.unfocus();
      controllerr.focusNode.canRequestFocus=true;
     
    }, icon: const Icon(Icons.emoji_emotions_outlined));
  }
}
