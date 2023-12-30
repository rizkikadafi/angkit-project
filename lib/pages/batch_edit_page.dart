import 'package:angkit_project/controller/batch_edit_controller.dart';
import 'package:angkit_project/models/models.dart';
import 'package:angkit_project/widgets/batch_input_form.dart';
import 'package:angkit_project/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.batch});

  final Batch batch;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Edit Batch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final role = snapshot.data!.getString('role');
                print(role);
                if (role == 'Distributor') {
                  return DistributorEdit(batch: widget.batch);
                } else {
                  return FarmEdit(batch: widget.batch);
                }
              }
              return Container();
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class FarmEdit extends StatefulWidget {
  const FarmEdit({super.key, required this.batch});

  final Batch batch;

  @override
  State<FarmEdit> createState() => _FarmEditState();
}

class _FarmEditState extends State<FarmEdit> {
  String date = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    date = widget.batch.tglMulai!;
    batchController.text = widget.batch.nama!;
    weightController.text = widget.batch.beratRtSample == null
        ? '0'
        : widget.batch.beratRtSample.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: InputSection(
        title: 'Detail Batch',
        inputs: [
          Text(
            "Tanggal Mulai",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 5),
          DatePicker(
            initDate: widget.batch.tglMulai!,
            callback: (val) {
              date = val;
            },
          ),
          const SizedBox(height: 10),
          Text(
            "Nama batch",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: batchController,
            decoration: const InputDecoration(labelText: 'Nama Batch'),
          ),
          const SizedBox(height: 10),
          Text(
            "Berat",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 5),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
            ],
            keyboardType: TextInputType.number,
            controller: weightController,
            decoration:
                const InputDecoration(labelText: 'Berat', suffixText: 'Kg'),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                String res;
                try {
                  res = await BatchEditController.batchUpdateFarm(
                    widget.batch.id!,
                    double.parse(weightController.text),
                    date,
                    batchController.text,
                  );
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                  return;
                }
                if (res == 'ok') {
                  Fluttertoast.showToast(msg: "Success update data");
                } else {
                  Fluttertoast.showToast(msg: res);
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

class DistributorEdit extends StatefulWidget {
  const DistributorEdit({super.key, required this.batch});

  final Batch batch;

  @override
  State<DistributorEdit> createState() => _DistributorEditState();
}

class _DistributorEditState extends State<DistributorEdit> {
  String date = '';

  @override
  void initState() {
    date = widget.batch.tglKemas ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputSection(
      title: 'Packaging date',
      inputs: [
        DatePicker(
          callback: (val) {
            date = val;
          },
        ),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () async {
              String res;
              try {
                res = await BatchEditController.batchUpdateDist(
                  widget.batch.id!,
                  date,
                );
              } catch (e) {
                Fluttertoast.showToast(msg: e.toString());
                return;
              }
              if (res == 'ok') {
                Fluttertoast.showToast(msg: "Success update data");
              } else {
                Fluttertoast.showToast(msg: res);
              }
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
