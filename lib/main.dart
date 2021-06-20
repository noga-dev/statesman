// ignore_for_file: unused_import
import 'dart:convert';
import 'dart:io';
// import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:statesman/src/provider.dart' as provider show MyApp;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

import 'src/async_redux.dart' as async_redux show MyApp;
import 'src/binder.dart' as binder show MyApp;
import 'src/bloc.dart' as bloc show MyApp;
import 'src/get.dart' as gett show MyApp;
import 'src/get_it.dart' as get_it show MyApp;
import 'src/hooks/riverpod_hook.dart' as riverpod_hook show MyApp;
// import 'src/hooks/hook_custom.dart' as hook_custom
//     show CustomHookFunctionExample;
// import 'src/hooks/hook_effect_builder.dart' as hook_effect_builder
//     show CustomHookExample;
import 'src/hooks/state.dart' as hook show MyApp;
import 'src/inherited_model.dart' as inherited_model show MyApp;
import 'src/inherited_widget.dart' as inherited_widget show MyApp;
import 'src/mobx.dart' as mobx show MyApp;
import 'src/redux.dart' as redux show MyApp;
import 'src/riverpod.dart' as riverpod show MyApp;
import 'src/rxdart.dart' as rxdart show MyApp;
import 'src/scoped_model.dart' as scoped_model show MyApp;
import 'src/setstate.dart' as set_state show MyApp;

final _dio = Dio();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  _dio.interceptors.add(
    DioCacheInterceptor(
      options: CacheOptions(
        store: HiveCacheStore(kIsWeb ? null : Directory.current.path),
        maxStale: const Duration(minutes: 30),
        policy: CachePolicy.forceCache,
      ),
    ),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: ListView(
            children: const [
              StateManager(
                label: 'Async Redux',
                src: 'async_redux.dart',
                imgUrl:
                    'https://miro.medium.com/max/4000/1*UB8CDSyHmZtcaXBAfb0liA.jpeg',
                repoUrl: 'marcglasberg/async_redux',
                child: async_redux.MyApp(),
              ),
              StateManager(
                label: 'Binder',
                src: 'binder.dart',
                repoUrl: 'letsar/binder',
                imgUrl:
                    'https://raw.githubusercontent.com/letsar/binder/main/images/logo.svg',
                child: binder.MyApp(),
              ),
              StateManager(
                label: 'Bloc',
                src: 'bloc.dart',
                repoUrl: 'felangel/bloc',
                imgUrl:
                    'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png',
                child: bloc.MyApp(),
              ),
              StateManager(
                label: 'Get*2',
                src: 'get.dart',
                repoUrl: 'jonataslaw/getx',
                imgUrl:
                    'https://raw.githubusercontent.com/jonataslaw/getx-community/master/get.png',
                child: gett.MyApp(),
              ),
              StateManager(
                label: 'GetIt*2*3',
                src: 'get_it.dart',
                repoUrl: 'fluttercommunity/get_it',
                imgUrl: 'https://i.ytimg.com/vi/DbV5RV2HRUk/maxresdefault.jpg',
                child: get_it.MyApp(),
              ),
              StateManager(
                label: 'Hooks useState',
                src: 'hooks/state.dart',
                repoUrl: 'rrousselGit/flutter_hooks',
                imgUrl: 'https://daveceddia.com/images/useState-hook@2x.png',
                child: hook.MyApp(),
              ),
              StateManager(
                label: 'Inherited Model',
                src: 'inherited_model.dart',
                repoUrl: 'flutter-institute/inherited-model',
                imgUrl: 'https://i.ytimg.com/vi/ml5uefGgkaA/maxresdefault.jpg',
                child: inherited_model.MyApp(),
              ),
              StateManager(
                label: 'Inherited Widget',
                src: 'inherited_widget.dart',
                repoUrl: 'flutter-institute/inherited-model',
                imgUrl:
                    'https://miro.medium.com/max/3600/1*llAHicU3APfJLknYtT015A.png',
                child: inherited_widget.MyApp(),
              ),
              StateManager(
                label: 'Mobx',
                src: 'mobx.dart',
                repoUrl: 'mobxjs/mobx.dart',
                note: '*Requires files generation',
                imgUrl:
                    'https://github.com/mobxjs/mobx.dart/raw/master/docs/src/images/mobx.png',
                child: mobx.MyApp(),
              ),
              StateManager(
                label: 'Provider',
                src: 'provider.dart',
                repoUrl: 'rrousselGit/provider',
                imgUrl:
                    'https://blog-2021.s3.amazonaws.com/uploads/post/picture/2/thumb_1_-2XwusduiJmkTPVAsAAROw.png',
                child: provider.MyApp(),
              ),
              StateManager(
                label: 'Redux',
                src: 'redux.dart',
                repoUrl: 'brianegan/flutter_redux',
                imgUrl:
                    'https://miro.medium.com/max/2672/1*3F16RDrdkNFJIdaBWR91sA.png',
                child: redux.MyApp(),
              ),
              StateManager(
                label: 'Riverpod',
                src: 'riverpod.dart',
                repoUrl: 'rrousselGit/river_pod',
                imgUrl: 'https://riverpod.dev/img/cover.png',
                child: riverpod.MyApp(),
              ),
              StateManager(
                label: 'Riverpod+Hook',
                src: 'hooks/riverpod_hook.dart',
                repoUrl: 'rrousselGit/flutter_hooks',
                imgUrl:
                    'https://miro.medium.com/max/1200/0*dngzQ4Ymp0vFr0sQ.png',
                child: riverpod_hook.MyApp(),
              ),
              StateManager(
                label: 'Rxdart',
                src: 'rxdart.dart',
                repoUrl: 'ReactiveX/rxdart',
                imgUrl:
                    'https://learnpainless.com/static/d6a8d3e5aa6f02f8b1905f0559b3c17d/cafad/why-use-rxdart-use-with-bloc-pattern-flutter.png',
                child: rxdart.MyApp(),
              ),
              StateManager(
                label: 'Scoped Model',
                src: 'scoped_model.dart',
                repoUrl: 'brianegan/scoped_model',
                imgUrl:
                    'https://www.didierboelens.com/images/blog/models_scopedmodel_animation.gif',
                child: scoped_model.MyApp(),
              ),
              StateManager(
                label: 'setState',
                src: 'setstate.dart',
                repoUrl: 'flutter/flutter',
                imgUrl:
                    'https://miro.medium.com/max/837/1*eI__ku9-W7sGlem71miRhA.png',
                child: set_state.MyApp(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class StateManager extends StatefulWidget {
  const StateManager({
    Key? key,
    required this.label,
    required this.child,
    required this.src,
    this.imgUrl = '',
    this.codeLink = '',
    this.repoUrl = '',
    this.desc = '',
    this.note = '',
  }) : super(key: key);

  final Widget child;
  final String label;
  final String src;
  final String codeLink;
  final String imgUrl;
  final String repoUrl;
  final String desc;
  final String note;

  @override
  _StateManagerState createState() => _StateManagerState();
}

class _StateManagerState extends State<StateManager> {
  Future<Response>? repoRequest;
  Future<Response>? contRequest;
  late String repFullUrl;

  @override
  void initState() {
    super.initState();
    if (widget.repoUrl.isNotEmpty) {
      repoRequest = _dio.get('https://api.github.com/repos/${widget.repoUrl}');
      contRequest = _dio
          .get('https://api.github.com/repos/${widget.repoUrl}/contributors');
      repFullUrl = 'https://github.com/${widget.repoUrl}';
    } else {
      repFullUrl = 'https://github.com/Agondev';
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: Future.wait(<Future>[
          repoRequest as Future<dynamic>,
          contRequest as Future<dynamic>,
        ]),
        builder: (context, snapshot) {
          Map<String, dynamic> repo;
          if (snapshot.hasData) {
            repo = ((snapshot.data as List)[0] as Response).data;
            repo['contributions'] =
                // ignore: avoid_dynamic_calls
                ((snapshot.data as List)[1] as Response)
                    .data[0]['contributions']
                    .toString();
          } else {
            repo = {
              'forks_count': '?',
              'watchers_count': '?',
              'stargazers_count': '?',
              'description': '',
              'created_at': DateTime.now().toString(),
              'updated_at': DateTime.now().toString(),
              'contributions': '?',
            };
          }
          return Card(
            child: InkWell(
              overlayColor: MaterialStateColor.resolveWith(
                (states) => Colors
                    .accents[Random().nextInt(Colors.accents.length)].shade700
                    .withOpacity(.25),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => WidgetWithCodeView(
                    sourceFilePath: 'lib/src/${widget.src}',
                    codeLinkPrefix: widget.codeLink,
                    labelBackgroundColor: Colors.lightBlue,
                    child: widget.child,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Tooltip(
                    message: 'Go to repo',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(200),
                        onTap: () async => await canLaunch(repFullUrl)
                            ? await launch(repFullUrl)
                            : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.label,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .2,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              width: 200,
                              child: widget.imgUrl.contains('.svg')
                                  ? SvgPicture.network(widget.imgUrl)
                                  : Image.network(widget.imgUrl),
                            ),
                            Text(
                              widget.note,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Tooltip(
                            message: 'Total Forks',
                            child: ListTile(
                              leading: const Icon(LineIcons.codeBranch),
                              title: Text(repo['forks_count'].toString()),
                            ),
                          ),
                          Tooltip(
                            message: 'Total Watchers',
                            child: ListTile(
                              leading: const Icon(LineIcons.eye),
                              title: Text(repo['watchers_count'].toString()),
                            ),
                          ),
                          Tooltip(
                            message: 'Total Stars',
                            child: ListTile(
                              leading: const Icon(LineIcons.star),
                              title: Text(repo['stargazers_count'].toString()),
                            ),
                          ),
                          Tooltip(
                            message: 'Total Contributers',
                            child: ListTile(
                              leading: const Icon(LineIcons.users),
                              title: Text(repo['contributions']),
                            ),
                          ),
                          Tooltip(
                            message: 'Creation Date',
                            child: ListTile(
                              leading: const Icon(LineIcons.calendar),
                              title: Text(DateFormat.yMMMd()
                                  .format(DateTime.parse(repo['created_at']))),
                            ),
                          ),
                          Tooltip(
                            message: 'Last Update',
                            child: ListTile(
                              leading: const Icon(LineIcons.edit),
                              title: Text(DateFormat.yMMMd()
                                  .format(DateTime.parse(repo['updated_at']))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        repo['description'],
                        textScaleFactor: 1.6,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}

// link to gihub
// # commits
// release date
// last commit
// # contributers
// # forks