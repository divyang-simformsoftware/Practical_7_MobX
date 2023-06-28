import 'package:bitcoin_app/store/password_store.dart';
import 'package:bitcoin_app/utils/constants.dart';
import 'package:bitcoin_app/utils/export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginStore = context.read<LoginStore>();
    final passwordStore = context.read<PasswordStore>();

    return ReactionBuilder(
      builder: (BuildContext context) {
        return reaction(
          (_) => loginStore.loginStatus?.error,
          (value) {
            if (value != null) {
              var exceptionMsg = "";
              if (value.toString().contains('400')) {
                exceptionMsg = 'Invalid-Auth-Credential';
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    exceptionMsg,
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            height: 280,
            margin: const EdgeInsets.all(10),
            child: Card(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: loginStore.emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Observer(
                          builder: (context) {
                            return TextField(
                              controller: loginStore.passController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  passwordStore.isPassVisible ? true : false,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.zero,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    passwordStore.isPassVisible =
                                        !passwordStore.isPassVisible;
                                  },
                                  icon: Icon(passwordStore.isPassVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                labelText: 'Password',
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Observer(
                        builder: (context) {
                          if (loginStore.loginStatus?.status ==
                              FutureStatus.fulfilled) {
                            Future.delayed(
                              const Duration(milliseconds: 1),
                              () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/dashboardPage', (route) => false);
                              },
                            );
                          }
                          return MaterialButton(
                            minWidth: 100,
                            color: Colors.purple,
                            textColor: Colors.white,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              loginStore.sendReq(
                                map: {
                                  "email": loginStore.emailController.text,
                                  "password": loginStore.passController.text
                                },
                              );
                            },
                            child: loginStore.loginStatus?.status ==
                                    FutureStatus.pending
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Login'),
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: -60,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: const NetworkImage(AppConst.imageURL),
                      backgroundColor: Colors.purple.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
