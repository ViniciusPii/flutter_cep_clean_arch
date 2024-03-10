import 'package:flutter/material.dart';
import 'package:flutter_arch/src/core/theme/app_styles.dart';
import 'package:flutter_arch/src/core/theme/infra/app_dimension.dart';
import 'package:flutter_arch/src/core/ui/components/app_label.dart';
import 'package:flutter_arch/src/core/ui/components/app_title.dart';
import 'package:flutter_arch/src/core/ui/components/loader_component.dart';
import 'package:flutter_arch/src/core/ui/components/snackbar_component.dart';
import 'package:flutter_arch/src/core/ui/components/spacing_page.dart';
import 'package:flutter_arch/src/presentation/home/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_bloc_state.dart';
import '/src/presentation/home/controller/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseBlocState<HomePage, HomeCubit> {
  final _formKey = GlobalKey<FormState>();
  final _cepEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquise o seu Cep'),
        centerTitle: true,
      ),
      body: Center(
        child: SpacingPage(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppTitle(title: 'Encontre o seu CEP!'),
                const SizedBox(
                  height: AppDimension.large,
                ),
                TextFormField(
                  autofocus: true,
                  controller: _cepEC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '#####-###',
                    )
                  ],
                  decoration: const InputDecoration(
                    label: Text('CEP'),
                    hintText: 'Ex: #####-###',
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório!'),
                    Validatorless.min(9, 'CEP incompleto!'),
                  ]),
                ),
                const SizedBox(
                  height: AppDimension.extraLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.getAddress(_cepEC.text);
                    }
                  },
                  child: const Text('Buscar'),
                ),
                const SizedBox(
                  height: AppDimension.extraLarge,
                ),
                BlocConsumer<HomeCubit, HomeState>(
                  bloc: controller,
                  listener: (context, state) {
                    if (state is HomeStateError) {
                      if (state.isNetworError) {
                        return SnackbarComponent.info(context, message: state.message);
                      }
                      return SnackbarComponent.error(context, message: state.message);
                    }
                  },
                  builder: (context, state) {
                    return LoaderComponent(
                      loading: state is HomeStateLoading,
                      height: AppDimension.enormous,
                      child: state is HomeStateSuccess
                          ? ListTile(
                              leading: const Icon(
                                Icons.house_outlined,
                                size: AppDimension.mega,
                                color: AppStyles.primary,
                              ),
                              title: AppTitle(
                                title: state.address.city,
                                type: TitleType.medium,
                              ),
                              subtitle: AppLabel(
                                type: LabelType.medium,
                                label: state.address.street,
                                isCenter: false,
                              ),
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
