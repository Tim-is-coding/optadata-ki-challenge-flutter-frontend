// ignore_for_file: deprecated_member_use

import 'package:buzz/Widgets/comunpopup.dart';
import 'package:buzz/Widgets/comuntitle.dart';
import 'package:buzz/charts/chart1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../comuntile1.dart';
import '../comunwidget2.dart';
import '../comunwidget3.dart';
import '../comunwidget4.dart';
import '../provider/proviercolors.dart';


class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: notifire!.getbgcolor,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                // Mobile layout
                return SizedBox(
                  height: 900,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,

                    child: Column(
                      children: [
                        const ComunTitle(title: 'General',path: "Widgets"),
                        _buildbitconui(
                            maincolor: const Color(0xffffab07),
                            title: 'Bitcoin',
                            image: 'assets/eth-graph.svg',
                            price: '\$19,50',
                            pr: '+30%',
                            bgcolor: const Color(0xffffab07).withOpacity(0.1),
                            logo: 'assets/Group 48081.svg'),
                        _buildbitconui(
                            maincolor: const Color(0xff7265ff),
                            title: 'Ethereum',
                            image: 'assets/eth-graph.svg',
                            price: '\$9,765',
                            pr: '+50%',
                            bgcolor: const Color(0xff7265ff).withOpacity(0.1),
                            logo: 'assets/Group 1000000838.svg'),
                        _buildbitconui(
                            maincolor: const Color(0xff54ba4a),
                            title: 'Doge Coin',
                            image: 'assets/eth-graph.svg',
                            price: '\$5,673',
                            pr: '+40%',
                            bgcolor: const Color(0xff54ba4a).withOpacity(0.1),
                            logo: 'assets/Group 1000000836.svg'),
                        _buildAverageSalesPerDay(
                            maincolor: const Color(0xff7265ff),
                            title: 'Today sele',
                            price: '67,467',
                            pr: '+10.7%',
                            percentage: 70),
                        _buildAverageSalesPerDay(
                            maincolor: const Color(0xfffc4438),
                            title: 'Today Profit ',
                            price: '99.7%',
                            pr: '5.9%',
                            percentage: 60),
                         const ComunTile1(
                            price:  'Purchase',
                            name: '60,000',
                            trailing: '+80%',
                            color: Colors.red,
                            icon: 'assets/shopping-cart.svg'),
                        const ComunTile1(
                            price: 'Sales',
                            name: '3,500',
                            trailing: '+30%',
                            color: Colors.deepPurple,
                            icon: 'assets/box-search.svg'),
                        const ComunTile1(
                            price: 'Sales return',
                            name: '1,000',
                            trailing: '-50%',
                            color: Colors.yellow,
                            icon: 'assets/badge-discount.svg'),
                        const ComunTile1(
                            price: 'Purchase rate',
                            name: '3,400',
                            trailing: '+50%',
                            color: Colors.green,
                            icon: 'assets/clipboard-search.svg'),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildCompletedCourses(
                              maincolor: const Color(0xffff4471),
                              title: '200+',
                              subtitle: 'Completed Courses',
                              icon: 'assets/book-open-reader.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildCompletedCourses(
                              maincolor: const Color(0xffffa131),
                              title: '80+',
                              subtitle: 'In Progress Courses',
                              icon: 'assets/clipboard-check.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildTotalUsers(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildFollowersGrowth(),
                        ),
                        _buidVisiter(),
                        _buildSnapchat(
                            logo: 'brand/005-snapchat.png',
                            title: 'Snapchat',
                            pr: '+55.7%',
                            price: '18,658',
                            percentage: 78,
                            maincolor: const Color(0xff2a82f4)),
                        _buildSnapchat(
                            logo: 'brand/006-tumblr.png',
                            title: 'Tumblr',
                            pr: '+19.86%',
                            price: '14,356',
                            percentage: 50,
                            maincolor: const Color(0xff20a2f2)),
                        _buildSnapchat(
                            logo: 'brand/001-Tumblr.png',
                            title: 'Twitter',
                            pr: '+76.5%',
                            price: '124,580',
                            percentage: 80,
                            maincolor: const Color(0xffffa941)),
                        _buildSnapchat(
                            logo: 'brand/008-Snapchat.png',
                            title: 'Facebook',
                            pr: '+90.9%',
                            price: '568,954',
                            percentage: 90,
                            maincolor: const Color(0xffff0505)),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildNewOrderstilecomun(
                              title: 'New Orders',
                              price: '50,495',
                              pr: '+66%',
                              main: const Color(0xff7366ff),
                              bgcolor: const Color(0xff7366ff).withOpacity(0.1),
                              icon: 'assets/box-check.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildNewOrderstilecomun(
                              title: 'New Customers',
                              price: '256,308',
                              pr: '+60%',
                              main: const Color(0xffffbc38),
                              bgcolor: const Color(0xffffbc38).withOpacity(0.1),
                              icon: 'assets/users.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildNewOrderstilecomun(
                              title: 'Average Sale',
                              price: '\$189k',
                              pr: '-20%',
                              main: const Color(0xfff85a83),
                              bgcolor: const Color(0xfff85a83).withOpacity(0.1),
                              icon: 'assets/badge-discount.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildNewOrderstilecomun(
                              title: 'Gross Profit',
                              price: '\$33,908',
                              pr: '+83%',
                              main: const Color(0xff54ba4a),
                              bgcolor: const Color(0xff54ba4a).withOpacity(0.1),
                              icon: 'assets/dollar-circle.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildorderpro(
                              name: 'Orders',
                              price: '6,66k',
                              trailing: SizedBox(
                                height: 60,
                                width: 130,
                                child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff7366ff)),
                              ),
                              color: Colors.deepPurple),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(padding),
                          child: _buildorderpro(
                              name: 'Profit',
                              price: '9,98k',
                              trailing: SizedBox(
                                height: 60,
                                width: 130,
                                child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff37cdfa)),
                              ),
                              color: const Color(0xff37cdfa)),
                        ),
                        _buildyourBalance(),
                        buildclender(),
                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );
              } else if (constraints.maxWidth < 1200) {
                if (constraints.minWidth < 1000) {
                  return SizedBox(
                    height: 1000,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ComunTitle(title: 'General',path: "Widgets"),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xffffab07),
                                      title: 'Bitcoin',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$25,63',
                                      pr: '+59%',
                                      bgcolor: const Color(0xfffff6e6),
                                      logo: 'assets/Group 48081.svg')),
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xff7265ff),
                                      title: 'Ethereum',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$9,443',
                                      pr: '+70%',
                                      bgcolor: const Color(0xfff1efff),
                                      logo: 'assets/Group 1000000836.svg')),
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xff54ba4a),
                                      title: 'Doge Coin',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$26,789',
                                      pr: '+30%',
                                      bgcolor: const Color(0xffeef8ed),
                                      logo: 'assets/Group 1000000838.svg')),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildAverageSalesPerDay(
                                      maincolor: const Color(0xff7265ff),
                                      title: 'Today Sales',
                                      price: '65,780',
                                      pr: '+6.9%',
                                      percentage: 70)),
                              Expanded(
                                  child: _buildAverageSalesPerDay(
                                      maincolor: const Color(0xfffc4438),
                                      title: 'Today Profit',
                                      price: '84.6%',
                                      pr: '2.5%',
                                      percentage: 60)),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ComunTile1(
                                    price: 'Purchase',
                                    name: '15,000',
                                    trailing: '+60%',
                                    color: Colors.red,
                                    icon: 'assets/shopping-cart.svg'),
                              ),
                              Expanded(
                                child: ComunTile1(
                                    price: 'Sales',
                                    name: '7,200',
                                    trailing: '+81%',
                                    color: Colors.deepPurple,
                                    icon: 'assets/box-search.svg'),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ComunTile1(
                                    price: 'Sales return',
                                    name: '5,000',
                                    trailing: '-32%',
                                    color: Colors.yellow,
                                    icon: 'assets/badge-discount.svg'),
                              ),
                              Expanded(
                                child: ComunTile1(
                                    price: 'Purchase rate',
                                    name: '6,450',
                                    trailing: '+30%',
                                    color: Colors.green,
                                    icon: 'assets/clipboard-search.svg'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: SizedBox(
                                    height: 355,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: _buildCompletedCourses(
                                                    maincolor:
                                                    const Color(0xffff4471),
                                                    title: '120+',
                                                    subtitle: 'Completed Courses',
                                                    icon: 'assets/book-open-reader.svg')),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                                flex: 4, child: _buildTotalUsers()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: _buildCompletedCourses(
                                                    maincolor:
                                                    const Color(0xffffa131),
                                                    title: '30+',
                                                    subtitle: 'In Progress Courses',
                                                    icon:
                                                    'assets/clipboard-check.svg')),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                                flex: 4,
                                                child: _buildFollowersGrowth()),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buidVisiter()),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/005-snapchat.png',
                                      title: 'Snapchat',
                                      pr: '+28.9%',
                                      price: '14,948',
                                      percentage: 78,
                                      maincolor: const Color(0xff2a82f4))),
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/006-tumblr.png',
                                      title: 'Tumblr',
                                      pr: '+16.49%',
                                      price: '16,666',
                                      percentage: 50,
                                      maincolor: const Color(0xff20a2f2))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/001-Tumblr.png',
                                      title: 'Twitter',
                                      pr: '+13.6%',
                                      price: '5,780',
                                      percentage: 70,
                                      maincolor: const Color(0xffffa941))),
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/008-Snapchat.png',
                                      title: 'Facebook',
                                      pr: '+72.6%',
                                      price: '98,954',
                                      percentage: 80,
                                      maincolor: const Color(0xffff0505))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buildTotalBalance()),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 3, child: _buildyourBalance()),
                              Expanded(flex: 4, child: buildclender()),
                            ],
                          ),
                          const SizeBoxx(),
                          const ComunBottomBar(),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 1000,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ComunTitle(title: 'General',path: "Widgets"),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xffffab07),
                                      title: 'Bitcoin',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$67,43',
                                      pr: '+58%',
                                      bgcolor: const Color(0xfffff6e6),
                                      logo: 'assets/Group 48081.svg')),
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xff7265ff),
                                      title: 'Ethereum',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$4,368',
                                      pr: '+38%',
                                      bgcolor: const Color(0xfff1efff),
                                      logo: 'assets/Group 1000000838.svg')),
                              Expanded(
                                  child: _buildbitconui(
                                      maincolor: const Color(0xff54ba4a),
                                      title: 'Doge Coin',
                                      image: 'assets/eth-graph.svg',
                                      price: '\$54,563',
                                      pr: '+40%',
                                      bgcolor: const Color(0xffeef8ed),
                                      logo: 'assets/Group 1000000836.svg')),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildAverageSalesPerDay(
                                      maincolor: const Color(0xff7265ff),
                                      title: 'Today sele',
                                      price: '49,908',
                                      pr: '+6.7%',
                                      percentage: 70)),
                              Expanded(
                                  child: _buildAverageSalesPerDay(
                                      maincolor: const Color(0xfffc4438),
                                      title: 'Today Profit',
                                      price: '91.6%',
                                      pr: '2.9%',
                                      percentage: 60)),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ComunTile1(
                                    price: 'Purchase',
                                    name: '60,000',
                                    trailing: '+70%',
                                    color: Colors.red,
                                    icon: 'assets/shopping-cart.svg'),
                              ),
                              Expanded(
                                child: ComunTile1(
                                    price: 'Sales',
                                    name: '43,800',
                                    trailing: '+78%',
                                    color: Colors.deepPurple,
                                    icon: 'assets/box-search.svg'),
                              ),
                              Expanded(
                                child: ComunTile1(
                                    price: 'Sales return',
                                    name: '4,600',
                                    trailing: '-30%',
                                    color: Colors.yellow,
                                    icon: 'assets/badge-discount.svg'),
                              ),
                              Expanded(
                                child: ComunTile1(
                                    price: 'Purchase rate',
                                    name: '6,430',
                                    trailing: '+80%',
                                    color: Colors.green,
                                    icon: 'assets/clipboard-search.svg'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: SizedBox(
                                    height: 380,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: _buildCompletedCourses(
                                                    maincolor:
                                                    const Color(0xffff4471),
                                                    title: '300+',
                                                    subtitle: 'Completed Courses',
                                                    icon:
                                                    'assets/book-open-reader.svg')),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                                flex: 4, child: _buildTotalUsers()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(

                                                child: _buildCompletedCourses(
                                                    maincolor:
                                                    const Color(0xffffa131),
                                                    title: '40+',
                                                    subtitle: 'In Progress Courses',
                                                    icon:
                                                    'assets/clipboard-check.svg')),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                                child: _buildFollowersGrowth()),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(flex: 2, child: _buidVisiter()),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/005-snapchat.png',
                                      title: 'Snapchat',
                                      pr: '+99.9%',
                                      price: '99,999',
                                      percentage: 78,
                                      maincolor: const Color(0xff2a82f4))),
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/006-tumblr.png',
                                      title: 'Tumblr',
                                      pr: '+64.89%',
                                      price: '14,556',
                                      percentage: 50,
                                      maincolor: const Color(0xff20a2f2))),
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'brand/001-Tumblr.png',
                                      title: 'Twitter',
                                      pr: '+67.5%',
                                      price: '64,420',
                                      percentage: 70,
                                      maincolor: const Color(0xffffa941))),
                              Expanded(
                                  child: _buildSnapchat(
                                      logo:
                                      'assets/brand/008-facebook.png',
                                      title: 'Facebook',
                                      pr: '+62.9%',
                                      price: '48,954',
                                      percentage: 80,
                                      maincolor: const Color(0xffff0505))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 4, child: _buildTotalBalance()),
                              Expanded(flex: 3, child: _buildyourBalance()),
                            ],
                          ),
                          const SizeBoxx(),
                          const ComunBottomBar(),
                        ],
                      ),
                    ),
                  );
                }
                // Tablet layout
              } else {
                // Website layout
                return SizedBox(
                  height: 1000,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ComunTitle(title: 'General',path: "Widgets"),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: _buildbitconui(
                                    maincolor: const Color(0xffffab07),
                                    title: 'Bitcoin',
                                    image: 'assets/eth-graph.svg',
                                    price: '\$41,43',
                                    pr: '+70%',
                                    bgcolor: const Color(0xffffab07).withOpacity(0.1),
                                    logo: 'assets/Group 48081.svg')),
                            Expanded(
                                flex: 2,
                                child: _buildbitconui(
                                    maincolor: const Color(0xff7265ff),
                                    title: 'Ethereum',
                                    image: 'assets/eth-graph.svg',
                                    price: '\$8,433',
                                    pr: '+90%',
                                    bgcolor: const Color(0xff7265ff).withOpacity(0.1),
                                    logo: 'assets/Group 1000000836.svg')),
                            Expanded(
                                flex: 2,
                                child: _buildbitconui(
                                    maincolor: const Color(0xff54ba4a),
                                    title: 'Doge Coin',
                                    image: 'assets/eth-graph.svg',
                                    price: '\$6,743',
                                    pr: '+18%',
                                    bgcolor: const Color(0xff54ba4a).withOpacity(0.1),
                                    logo: 'assets/Group 1000000838.svg')),
                            Expanded(
                                flex: 3,
                                child: _buildAverageSalesPerDay(
                                    maincolor: const Color(0xff7265ff),
                                    title: 'Today sele',
                                    price: '49,908',
                                    pr: '+9.7%',
                                    percentage: 70)),
                            Expanded(
                                flex: 3,
                                child: _buildAverageSalesPerDay(
                                    maincolor: const Color(0xfffc4438),
                                    title: 'Today Profit',
                                    price: '84.6%',
                                    pr: '2.6%',
                                    percentage: 60)),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: ComunTile1(
                                  price: 'Purchase',
                                  name: '60,000',
                                  trailing: '+56%',
                                  color: Colors.red,
                                  icon: 'assets/shopping-cart.svg'),
                            ),
                            Expanded(
                              child: ComunTile1(
                                  price: 'Sales',
                                  name: '5,660',
                                  trailing: '+73%',
                                  color: Colors.deepPurple,
                                  icon: 'assets/box-search.svg'),
                            ),
                            Expanded(
                              child: ComunTile1(
                                  price: 'Sales return',
                                  name: '8,000',
                                  trailing: '-14%',
                                  color: Colors.yellow,
                                  icon: 'assets/badge-discount.svg'),
                            ),
                            Expanded(
                              child: ComunTile1(
                                  price: 'Purchase rate',
                                  name: '4,300',
                                  trailing: '+50%',
                                  color: Colors.green,
                                  icon: 'assets/clipboard-search.svg'),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(padding),
                                child: SizedBox(
                                  height: 355,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: _buildCompletedCourses(
                                                  maincolor:
                                                  const Color(0xffff4471),
                                                  title: '100+',
                                                  subtitle: 'Completed Courses',
                                                  icon:
                                                  'assets/book-open-reader.svg')),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          Expanded(
                                              flex: 4, child: _buildTotalUsers()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: _buildCompletedCourses(
                                                  maincolor:
                                                  const Color(0xffffa131),
                                                  title: '50+',
                                                  subtitle: 'In Progress Courses',
                                                  icon:
                                                  'assets/clipboard-check.svg')),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          Expanded(
                                              flex: 4,
                                              child: _buildFollowersGrowth()),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 2, child: _buidVisiter()),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: _buildSnapchat(
                                    logo:
                                    'brand/005-snapchat.png',
                                    title: 'Snapchat',
                                    pr: '+52.9%',
                                    price: '72,098',
                                    percentage: 78,
                                    maincolor: const Color(0xff2a82f4))),
                            Expanded(
                                child: _buildSnapchat(
                                    logo:
                                    'brand/006-tumblr.png',
                                    title: 'Tumblr',
                                    pr: '+34.09%',
                                    price: '52,564',
                                    percentage: 50,
                                    maincolor: const Color(0xff20a2f2))),
                            Expanded(
                                child: _buildSnapchat(
                                    logo:
                                    'brand/001-Tumblr.png',
                                    title: 'Twitter',
                                    pr: '+67.4%',
                                    price: '13,080',
                                    percentage: 70,
                                    maincolor: const Color(0xffffa941))),
                            Expanded(
                                child: _buildSnapchat(
                                    logo:
                                    'brand/008-Snapchat.png',
                                    title: 'Facebook',
                                    pr: '+65.9%',
                                    price: '78,954',
                                    percentage: 80,
                                    maincolor: const Color(0xffff0505))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4, child: _buildTotalBalance()),
                            Expanded(flex: 3, child: _buildyourBalance()),
                            Expanded(flex: 4, child: buildclender()),
                          ],
                        ),
                        const SizeBoxx(),
                        const ComunBottomBar(),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildbitconui(
      {required Color maincolor,
        required String title,
        required String image,
        required String price,
        required String pr,
        required Color bgcolor,
        required String logo}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(logo,
                          height: 20, width: 20)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: SvgPicture.asset(image, color: maincolor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(padding),
                      child: Center(
                        child: Container(
                          height: 75,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: bgcolor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                price,
                                style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
                              const SizedBox(height: 5),
                              Text(
                                pr,
                                style: mediumGreyTextStyle.copyWith(fontSize: 13,color: maincolor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAverageSalesPerDay(
      {required Color maincolor,
        required String title,
        required String price,
        required String pr,
        required double percentage}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      price,
                      style: mainTextStyle.copyWith(fontSize: 17,color: maincolor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pr,
                      style: mediumGreyTextStyle.copyWith(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The point of using Lorem Ipsum",
                      style: mediumGreyTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ComunWidget4(
                percentage: percentage,
                maincolor: maincolor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buidVisiter() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: [
                  Text("Visitors",
                      style: mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/user.svg",
                    height: 12,
                    width: 12,
                    color: const Color(0xff7366fe),
                  ),
                  const Text(
                    "(+2.8)",
                    style: TextStyle(color: Color(0xff7366fe), fontSize: 14),
                  ),
                  const Expanded(
                      child: SizedBox(
                        width: 200,
                      )),
                  const ComunPopup(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xffffa941),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Active", style: mediumGreyTextStyle.copyWith(fontSize: 13)),
                const SizedBox(
                  width: 30,
                ),
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xff7366ff),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Bounce", style: mediumGreyTextStyle.copyWith(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 10,),
            Flexible(
              child: Consumer<ColorNotifire>(
                builder: (context, value, child) => SfCartesianChart(
                  legend: Legend(isVisible: true),
                  series: <ChartSeries>[
                    // Line series
                    LineSeries<SalesData, num>(
                      dataSource: <SalesData>[
                        SalesData(2010, 35),
                        SalesData(2011, 28),
                        SalesData(2012, 34),
                        SalesData(2013, 32),
                        SalesData(2014, 48),

                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                    // Column series
                    ColumnSeries<SalesData, num>(
                      dataSource: <SalesData>[
                        SalesData(2010, 30),
                        SalesData(2011, 35),
                        SalesData(2012, 28),
                        SalesData(2013, 36),
                        SalesData(2014, 40),

                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      name: 'Profit',
                    ),
                  ],
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCourses(
      {required Color maincolor,
        required String title,
        required String subtitle,
        required String icon}) {
    return Container(
      padding: const EdgeInsets.all(padding),
      // height: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getcontiner,
        boxShadow: boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Container(
              height: 70,
              width: 70,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: maincolor),
              child: Center(
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  )),
            ),
            title: Text(title,
                style:
                mainTextStyle.copyWith(fontSize: 20,color: notifire!.getMainText)),
            subtitle: Text(subtitle,
                style: mediumGreyTextStyle.copyWith(fontSize: 16)),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: notifire!.getbordercolor,
                fixedSize: const Size(150, 35),
                elevation: 0,
              ),
              child: Row(
                children: [
                  const Text(
                    "View Course",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SvgPicture.asset(
                    "assets/arrow-right-small.svg",
                    width: 8,
                    height: 8,
                    color: Colors.grey,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildTotalUsers() {
    return  const SizedBox(
// color: Colors.black,
      height: 170,
      child: Comun12(),
    );
  }

  Widget _buildFollowersGrowth() {
    return const SizedBox(
      height: 170,
      child: ComunWidget3(),
    );
  }

  Widget _buildSnapchat(
      {required String logo,
        required String title,
        required String pr,
        required String price,
        required double percentage,
        required Color maincolor}) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(logo),
              ),
              title: Text(title, style:mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText)),
              trailing: Text(pr, style:mediumGreyTextStyle.copyWith(fontSize: 13).copyWith(color: Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        price,
                        style:  mainTextStyle.copyWith(fontSize: 17,color: notifire!.getMainText),
                      ),
                      Text(
                        "Followers",
                        style: mediumGreyTextStyle.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  const Expanded(
                      child: SizedBox(
                        width: 300,
                      )),
                  ComunWidget4(
                    percentage: percentage,
                    maincolor: maincolor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalBalance() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
        height: 380,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                children: [
                  Expanded(
                    child: _buildNewOrderstilecomun(
                        title: 'New Orders',
                        price: '6,435',
                        pr: '+40%',
                        main: const Color(0xff7366ff),
                        bgcolor: const Color(0xff7366ff).withOpacity(0.1),
                        icon: 'assets/box-check.svg'),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: _buildNewOrderstilecomun(
                        title: 'New Customers',
                        price: '3,908',
                        pr: '+50%',
                        main: const Color(0xffffbc38),
                        bgcolor:  const Color(0xffffbc38).withOpacity(0.1),
                        icon: 'assets/users.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7, top: 7),
              child: Row(
                children: [
                  Expanded(
                    child: _buildNewOrderstilecomun(
                        title: 'Average Sale',
                        price: '\$489k',
                        pr: '-0.6%',
                        main: const Color(0xfff85a83),
                        bgcolor: const Color(0xfff85a83).withOpacity(0.1),
                        icon: 'assets/badge-discount.svg'),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: _buildNewOrderstilecomun(
                        title: 'Gross Profit',
                        price: '\$4,908',
                        pr: '+40%',
                        main: const Color(0xff54ba4a),
                        bgcolor: const Color(0xff54ba4a).withOpacity(0.1),
                        icon: 'assets/dollar-circle.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                children: [
                  Expanded(
                      child: _buildorderpro(
                          name: 'Orders', price: '4,86k', trailing: SizedBox(
                        height: 60,
                        width: 150,
                        child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff7366ff)),
                      ), color: Colors.deepPurple)),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                      child: _buildorderpro(
                          name: 'Profit', price: '3,97k', trailing: SizedBox(
                        height: 60,
                        width: 150,
                        child: SvgPicture.asset("assets/btc-graph.svg",fit: BoxFit.fill,color: const Color(0xff37cefa)),
                      ), color: const Color(0xff37cdfa))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNewOrderstilecomun(
      {required String title,
        required String price,
        required String pr,
        required Color main,
        required Color bgcolor,
        required String icon}) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getcontiner,
        boxShadow: boxShadow,
      ),
      child: Center(
        child: ListTile(
          enabled: true,
          contentPadding: const EdgeInsets.all(10),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title, style: mediumGreyTextStyle.copyWith(fontSize: 15)),
          ),
          subtitle: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              text: TextSpan(children: [
                TextSpan(
                    text: price,
                    style: mainTextStyle.copyWith(fontSize: 20,color: notifire!.getMainText)),
                TextSpan(text: pr, style: mediumGreyTextStyle.copyWith(fontSize: 16,color: appMainColor))
              ])),
          trailing: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
            child: Center(
                child: SvgPicture.asset(
                  icon,
                  height: 25,
                  width: 25,
                  color: main,
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildorderpro(
      {required String name,
        required String price,
        required Widget trailing,
        required Color color}) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getcontiner,
        boxShadow: boxShadow,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.indigo,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                    price,
                    style: mainTextStyle.copyWith(fontSize: 20,overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 1),
              ),
              subtitle: Text(
                name,
                style: mediumGreyTextStyle.copyWith(fontSize: 16,overflow: TextOverflow.ellipsis),maxLines: 1,),
              trailing: trailing,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildyourBalance() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 375,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: notifire!.getcontiner,
          boxShadow: boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/Item10.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your Balance",
              style: mediumGreyTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "\$1,986,547.90",
              style: mainTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: SvgPicture.asset(
                                  "assets/arrow-down-right-circle.svg",
                                  height: 20,
                                  width: 20,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Investment",
                                  style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis,),maxLines: 1),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("76.8K",
                                  style: mainTextStyle.copyWith(fontSize: 17,overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 1),
                              const SizedBox(
                                height: 6,
                              ),
                              Text("-14.67%",
                                  style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis).copyWith(color: Colors.red),maxLines: 1),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: SvgPicture.asset(
                                  "assets/arrow-up-right-circle.svg",
                                  height: 20,
                                  width: 20,
                                  color: Colors.green,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cash Back",
                                  style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis),maxLines: 1),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("59.7K",
                                  style: mainTextStyle.copyWith(fontSize: 17,overflow: TextOverflow.ellipsis,color: notifire!.getMainText),maxLines: 1),
                              const SizedBox(
                                height: 6,
                              ),
                              Text("+50.67%",
                                  style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis).copyWith(color: Colors.green),maxLines: 1),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: SvgPicture.asset(
                                    "assets/arrow-up-right-circle.svg",
                                    height: 20,
                                    width: 20,
                                    color: Colors.green,
                                  )),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Profit",
                                      style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis),maxLines: 1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("7.48K",
                                      style: mediumGreyTextStyle.copyWith(fontSize: 13).copyWith(color: Colors.green,overflow: TextOverflow.ellipsis),maxLines: 1),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),

                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child:    Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: SvgPicture.asset(
                                    "assets/arrow-down-right-circle.svg",
                                    height: 20,
                                    width: 20,
                                    color: Colors.red,
                                  )),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Text("Loss",
                                      style: mediumGreyTextStyle.copyWith(fontSize: 13,overflow: TextOverflow.ellipsis),maxLines: 1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("3.4K",
                                      style:  mediumGreyTextStyle.copyWith(fontSize: 13).copyWith(color: Colors.red,overflow: TextOverflow.ellipsis),maxLines: 1),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),),
                    )),

                // const SizedBox(height: 10,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildclender() {
  return Padding(
    padding: const EdgeInsets.all(padding),
    child: Container(
      height: 380,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: notifire!.getcontiner,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 350,
              child: Center(
                child: TableCalendar(
                  rowHeight: 50,
                  locale: 'en_US',
                  headerStyle:  HeaderStyle(
                      titleTextStyle: TextStyle(color: notifire!.getMainText),
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
