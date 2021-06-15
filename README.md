# linkedin_login

A new Flutter plugin.

## Getting Started


Just create object and call method
```dart
LinkedInLogin user = new LinkedInLogin();
           var token = await user.getToken(context: context,
                clientId: "ClientId",
                clientSecret: "ClientSecret",
                callbackUrl:"https://example.com");            
```
## Example

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
                           child: Text('LinkedIn Login'),
                           style: ElevatedButton.styleFrom(
                             primary: Colors.blue,
                             elevation: 5,
                           ),
                           onPressed: () async {
                             LinkedInLogin user = new LinkedInLogin();
                            var token = await user.getToken(context: context,
                                 clientId: "ClientId",
                                 clientSecret: "ClientSecret",
                                 callbackUrl:"https://example.com");
                            print(token);
                           },
                         ),
        ),
      ),
    );
  }
}
```