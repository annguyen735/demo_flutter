import 'package:demo_flutter/data/enum.dart';
import 'package:demo_flutter/data/route_list.dart';
import 'package:demo_flutter/data/routes.dart';
import 'package:flutter/material.dart';

class FirstPageRoute extends StatelessWidget {
  const FirstPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Routes.popTo(context, popType: PopType.maybePop),
            icon: Icon(Icons.skip_previous_outlined)),
        title: Text('First'),
        actions: [
          IconButton(
            onPressed: () => Routes.pushTo(context, 
                              Routers.secondRoute, 
                              pushType: PushType.pushNamed, 
                              arguments: 'F->S'), 
            icon: Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('First Page'),
        ),
      ),
    );
  }
}

class SecondPageRoute extends StatelessWidget {
  const SecondPageRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Routes.popTo(context, popType: PopType.maybePop),
            icon: Icon(Icons.skip_previous_outlined)),
        title: Text('Second, ${arg ?? ''}'),
        actions: [
          IconButton(
            onPressed: () => Routes.pushTo(context, 
                  Routers.thirdRoute, 
                  pushType: PushType.pushReplacement,
                  arguments: 'S->T'),
            icon: Icon(Icons.navigate_next_outlined)
            )
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Second Page'),
        ),
      ),
    );
  }
}

class ThirdPageRoute extends StatelessWidget {
  const ThirdPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Routes.popTo(context, 
                              popType: PopType.popAndPushNamed, 
                              route: Routers.firstRoute),
            icon: Icon(Icons.skip_previous_outlined)),
        title: Text('Third, ${ arg ?? ''}'),
        actions: [
          IconButton(
            onPressed: () => Routes.pushTo(context, 
                                Routers.fourthRoute), 
                                // pushType: PushType.pushAndRemoveUntil, 
                                // modalRoute: Routers.firstRoute.url), 
            icon: Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Third Page'),
        ),
      ),
    );
  }
}

class FourThPageRoute extends StatelessWidget {
  const FourThPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Routes.popTo(context,
                              popType: PopType.popUntil,
                              modalRoute: Routers.firstRoute.url),
            icon: Icon(Icons.skip_previous_outlined)),
        title: Text('Four'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => SecondPageRoute()),
              (route) => false
            ), 
            icon: Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Fourth Page'),
        ),
      ),
    );
  }
}