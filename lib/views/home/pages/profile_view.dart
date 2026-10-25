import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../sherd/cash_helper.dart';
import '../../../sherd/dio_helper.dart';
import '../../../sherd/show_toast.dart';
import '../../login/view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? json;
  bool isLoggingOut = false;

  getData() async {
    final resp = await DioHelper.getData(path: '/api/Auth/profile');
    json = ProfileModel.fromJson(resp.data??{});
    setState((){});
  }

  Future<void> logout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xffCD0F0F),
              fixedSize: const Size(100, 45),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() {
      isLoggingOut = true;
    });

    final resp = await DioHelper.sendData(path: '/api/Auth/logout');

    await CacheHelper.clearUserData();
    token = null;

    setState(() {
      isLoggingOut = false;
    });

    showMassage(
      resp.message ?? 'Logged out successfully',
      isError: !resp.isSuccess,
    );

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 152,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xffECA4C5),
                      Color(0xff434C6D).withValues(alpha: .50),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(top: 115),
                child: Column(
                  children: [
                     Center(
                       child: CircleAvatar(
                         maxRadius: 40,
                         backgroundImage: NetworkImage(json?.profilePhotoUrl??""),
                       ),
                     ),
                    SizedBox(height: 16),
                    Text(
                      json?.username??"",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _Item(text: 'Edit Info', image: 'edit_info', onTap: () {}),
                  _Item(
                    text: 'Order History',
                    image: 'order_history',
                    onTap: () {},
                  ),
                  _Item(text: 'Wallet', image: 'wallet', onTap: () {}),
                  _Item(text: 'Settings', image: 'setting', onTap: () {}),
                  _Item(text: 'Voucher ', image: 'voucher', onTap: () {}),
                  _Item(
                    isLogOut: true,
                    text: isLoggingOut ? 'Logging out...' : 'Logout',
                    image: 'logout',
                    onTap: isLoggingOut ? null : logout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text, image;
  final bool isLogOut;
  final VoidCallback? onTap;

  const _Item({
    required this.text,
    required this.image,
    this.isLogOut = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset('assets/icons/$image.svg'),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isLogOut? Color(0xffCD0F0F) : null,
        ),
      ),
      trailing: isLogOut? null : SvgPicture.asset('assets/icons/forward2.svg'),
    );
  }
}

class ProfileModel {
  late final int id;
  late final String username;
  late final String email;
  late final String role;
  late final String phoneNumber;
  late final String countryCode;
  late final String profilePhotoUrl;
  late final String otpCode;
  late final String otpExpiration;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    role = json['role'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    countryCode = json['countryCode'] ?? '';
    profilePhotoUrl = json['profilePhotoUrl'] ?? '';
    otpCode = json['otpCode'] ?? '';
    otpExpiration = json['otpExpiration'] ?? '';
  }
}
