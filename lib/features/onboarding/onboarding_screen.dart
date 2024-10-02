import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pegadaian_digital/features/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Selamat Datang di Pegadaian Digital!",
          body:
              "Solusi investasi, pendanaan, dan pembayaran tagihan dengan mudah tanpa harus keluar rumah.",
          image: SvgPicture.asset('assets/images/svg/KCA-1.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Investasi Tanpa Cemas",
          body:
              "Beli dan jual emas dengan fasilitas titipan yang aman karena Pegadaian telah terdaftar dan diawasi oleh OJK. Mulai Rp 50.000, sudah bisa punya emas!",
          image: SvgPicture.asset('assets/images/svg/KCA-2.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kredit Cepat & Aman",
          body:
              "Perlu dana tunai yang cepat, aman, dan murah? Jangan jual barang kesayangan kamu. Gadaikan saja di Pegadaian!",
          image: SvgPicture.asset('assets/images/svg/KCA-3.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kembangkan Bisnismu",
          body:
              "Ciptakan peluang bisnis baru dengan mengajukan pembiayaan yang tepat melalui Pegadaian.",
          image: SvgPicture.asset('assets/images/svg/KCA-4.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Multi Pembayaran Online",
          body:
              "Bayar telepon, listrik, air, dan tagihan lainnya melalui aplikasi Pegadaian Digital.",
          image: SvgPicture.asset('assets/images/svg/KCA-5.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}