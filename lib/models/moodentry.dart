

@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold

  onPressed: () async {
    if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
            "http://[URL_APP_KAMU]/create-flutter/",
            jsonEncode(<String, String>{
                'mood': _mood,
                'mood_intensity': _moodIntensity.toString(),
                'feelings': _feelings,
            // TODO: Sesuaikan field data sesuai dengan aplikasimu
            }),
        );
        if (context.mounted) {
            if (response['status'] == 'success') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                content: Text("Mood baru berhasil disimpan!"),
                ));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                );
            } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                    content:
                        Text("Terdapat kesalahan, silakan coba lagi."),
                ));
            }
        }
    }
},