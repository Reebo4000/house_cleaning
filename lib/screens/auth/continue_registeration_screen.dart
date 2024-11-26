import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_cleaning/utils/app_styles.dart';
import 'package:house_cleaning/utils/color_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:house_cleaning/utils/loading_manager_widget.dart';
import 'package:house_cleaning/screens/auth/widgets/custom_elevated_button.dart';

class ContinueRegisterationScreen extends StatefulWidget {
  const ContinueRegisterationScreen({super.key});
  static const String continueRegisterationRoute = '/continue_registration';

  @override
  State<ContinueRegisterationScreen> createState() =>
      _ContinueRegisterationScreenState();
}

class _ContinueRegisterationScreenState
    extends State<ContinueRegisterationScreen> {
  // Selected services
  // Services fetched from Firestore
  List<Map<String, dynamic>> services = [];
  late AuthProviderr authProvider;

  @override
  void initState() {
    super.initState();
    fetchServicesFromFirestore();
  }

// fetch services from firestore
  Future<void> fetchServicesFromFirestore() async {
    try {
      // Fetch data from Firestore
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Services').get();

      // Parse the data
      final fetchedServices = snapshot.docs.map((doc) {
        return {
          'title': doc['title'],
          'description': doc['description'],
          'image': doc['image'],
        };
      }).toList();

      setState(() {
        services = fetchedServices;
      });
    } catch (e) {
      log('Error fetching services: $e');
    }
  }

  void toggleService(String serviceTitle) {
    setState(() {
      if (authProvider.selectedServices.contains(serviceTitle)) {
        authProvider.selectedServices.remove(serviceTitle);
      } else {
        authProvider.selectedServices.add(serviceTitle);
      }
    });
  }

  @override
  void didChangeDependencies() {
    authProvider = Provider.of<AuthProviderr>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: ColorManager.primaryColor,
        backgroundColor: ColorManager.primaryColor,
        title: Text(
          'House Cleaning - Register',
          style:
              AppStyles.styleSemiBold20(context).copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: services.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            )
          : LoadingManager(
              isLoading: authProvider.isLoading,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(
                            "Choose Your Services",
                            style: AppStyles.styleBold20(context),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Maximum 2 items per row
                          crossAxisSpacing: 16.0, // Spacing between columns
                          mainAxisSpacing: 16.0, // Spacing between rows
                          childAspectRatio: 0.75, // Adjust for better spacing
                        ),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final service = services[index];
                          final isSelected = authProvider.selectedServices
                              .contains(service['title']);

                          return GestureDetector(
                            onTap: () {
                              toggleService(service['title']);
                            },
                            child: Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Service Image
                                  Expanded(
                                    child: ClipRRect(
                                      clipBehavior: Clip.none,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          FancyShimmerImage(
                                            boxFit: BoxFit.fill,
                                            imageUrl: service['image'],
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return CachedNetworkImage(
                                                imageUrl: service['image'],
                                                fit: BoxFit.fill,
                                                width: double.infinity,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isSelected
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    color: isSelected
                                        ? ColorManager.primaryColor
                                        : Colors.black,
                                    size: 24,
                                  ),
                                  // Service Title
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      service['title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // Service Description
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      service['description'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 150,
                        ),
                        child: CustomElevatedButton(
                          text: "Register",
                          onPressed: () {
                            setState(() {
                              authProvider.isLoading = true;
                            });
                            authProvider.registerWithFirebase(context: context);

                            log('Selected Services: ${authProvider.selectedServices}');
                          },
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
