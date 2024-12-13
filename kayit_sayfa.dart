import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();
 /* Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    print("kişi kaydet: $kisi_ad - $kisi_tel");
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("kayıt sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50, right:50),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi , decoration: const InputDecoration(hintText: "kişi ad"),),
              TextField(controller: tfKisiTel , decoration: const InputDecoration(hintText: "kişi tel"),),
              ElevatedButton(onPressed: (){
                //kaydet(tfKisiAdi.text, tfKisiTel.text);
                context.read<KayitSayfaCubit>().kaydet(tfKisiAdi.text, tfKisiTel.text);
          
              }, child: const Text("kaydet"))
              
          
            ],
            ),
        ),


      ),
    );
  }
}