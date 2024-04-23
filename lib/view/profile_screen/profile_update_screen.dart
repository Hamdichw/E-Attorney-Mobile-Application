import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/profile_update_controller.dart';
import '../../utils/const.dart';
import '../../utils/widgets/text_field.dart';
import '../nav_bar.dart';

class UpdateProfileScreen extends StatelessWidget {
  final UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      updateProfileController.updateProfilePhoto(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: Text("8".tr),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.off(NavBar(
                indx: 4,
              ));
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // ********************************************* IMAGE with ICON *************************************** //
              if (updateProfileController.userDataList != null)
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          updateProfileController.userDataList?[5],
                          height: 65,
                          width: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: const Icon(Icons.edit,
                              color: Colors.white, size: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 50),

              // ****************************************************** Form Fields ************************************ //
              GetBuilder<UpdateProfileController>(
                builder: (controller) => Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: InputField(
                                hintText: "${controller.userDataList![0]}",
                                controller: controller.firstNameController,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InputField(
                                hintText: "${controller.userDataList![1]}",
                                controller: controller.lastNameController,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: InputField(
                          hintText: "${controller.userDataList![3]}".tr,
                          controller: controller.email,
                          // Add validator if needed
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: InputField(
                          hintText: " phone".tr,
                          controller: controller.phone,
                          // Add validator if needed
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),

                      Obx(() => Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            child: InputField(
                              hintText: "12".tr,
                              controller: controller.password,
                              obscure: controller.visible1.value,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.toggleVisibility1();
                                },
                                icon: controller.visible1.value
                                    ? Icon(
                                        Icons.visibility_off,
                                        color:
                                            theme.textTheme.displayLarge!.color,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color:
                                            theme.textTheme.displayLarge!.color,
                                      ),
                              ),
                              // Add validator if needed
                              prefixIcon: Icon(Icons.lock),
                            ),
                          )),
                      const SizedBox(height: 20),
                      // ************************************ Form Submit Button **************************************** //
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.updateProfile();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(btncolor),
                              side: MaterialStatePropertyAll(BorderSide.none),
                              shape: MaterialStatePropertyAll(StadiumBorder())),
                          child: Text("13".tr,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
