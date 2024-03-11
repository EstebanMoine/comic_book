import 'package:comic_book/cubits/configs/configs_cubit.dart';
import 'package:comic_book/blocs/issues/issues_bloc.dart';
import 'package:comic_book/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchNameDialog extends StatelessWidget {
  const SearchNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      title: const Text('Search by name'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: CustomText(
            text: 'Cancel',
            color: Colors.red[300],
          ),
        ),
        MaterialButton(
          onPressed: () {
            context.read<ConfigsCubit>().changeStateOfFilter();
            BlocProvider.of<IssuesBloc>(context, listen: false).add(LoadAllIssuesEvent(nameToFilter: nameController.text));
            Navigator.pop(context);
          },
          child: const CustomText(
            text: 'Apply',
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
