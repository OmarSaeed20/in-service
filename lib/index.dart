library index;

// packages
export 'package:get/get.dart' hide MultipartFile, FormData, Response;
export 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
export 'package:country_code_picker/country_code_picker.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:easy_refresh/easy_refresh.dart' hide Header;
export 'package:internet_connection_checker/internet_connection_checker.dart';
export 'package:nb_utils/nb_utils.dart'
    hide ContextExtensions, IntExtensions, StringExtension, GetDurationUtils;
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:equatable/equatable.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter/services.dart';
export 'package:image_picker/image_picker.dart';

// view
export 'features/public/presentation/contact_us/views/contact_us_view.dart';
export 'features/public/presentation/change_password/views/change_pass_view.dart';
export 'features/public/presentation/about_us/views/about_us_view.dart';
export 'features/public/presentation/splash/views/splash_view.dart';
export 'features/public/presentation/auth/register/views/register_view.dart';
export 'features/public/presentation/auth/login/views/login_view.dart';
export 'features/public/presentation/auth/forget_password/views/forget_password_view.dart';
export 'features/public/presentation/choose_langeuage/views/choose_language_view.dart';
export 'features/public/presentation/auth/verify_code/views/verify_code_view.dart';
export 'features/public/presentation/auth/forget_password/views/reset_forget_pass_view.dart';
export 'features/public/presentation/auth/forget_password/views/verify_forget_pass_view.dart';
export 'features/public/presentation/auth/login/views/widget/auth_widget.dart';
export 'features/public/presentation/profile/views/profile_view.dart';

/*
//? controllers
 */ // view Widgets
export 'features/public/presentation/auth/forget_password/controllers/forget_password/forget_password_controller.dart';
export 'features/public/presentation/auth/verify_code/controllers/verify_code_controller.dart';
export 'features/public/presentation/profile/controllers/profile_controller.dart';
export 'features/public/presentation/auth/forget_password/controllers/forget_password/forget_password_state.dart';
export 'features/public/presentation/change_password/controllers/change_pass_controller.dart';
export 'features/public/presentation/auth/register/controllers/register_controller.dart';
export 'features/public/presentation/auth/forget_password/controllers/verify_forget_pass/verify_forget_pass_controller.dart';
export 'features/public/presentation/auth/login/controllers/login_controller.dart';
export 'features/public/presentation/auth/forget_password/controllers/reset_forget_pass/reset_forget_pass_controller.dart';
export 'features/public/presentation/choose_langeuage/controllers/choose_language_controller.dart';
export 'features/public/presentation/about_us/controllers/about_us_controller.dart';

//? core
export 'core/widget/icon_back_widget.dart';
export 'core/functions/handele_function_return.dart';
export 'core/network/base/parameters/auth/register/register_params.dart';
export 'core/network/base/parameters/auth/register/verfiy_register_params.dart';
export 'core/network/base/parameters/auth/login_params.dart';

export 'core/consts/app_images.dart';
export 'core/consts/app_strings.dart';
export 'core/consts/app_colors.dart';
export 'core/util/extensions.dart';
export 'core/widget/app_text/text_styles.dart';
export 'core/widget/app_text/text_widget.dart';
export 'core/widget/button/btn_widget.dart';
export 'core/widget/app_text_field/text_input_widget.dart';
export 'core/widget/app_text_field/expansion_tile_field.dart';
export 'core/widget/app_text_field/drop_down_field.dart';
export 'core/util/keys.dart';
export 'core/util/dialog_manager.dart';
export 'core/routes/app_pages.dart';
export 'core/widget/image_widget.dart';
export 'core/widget/lists/animation_list_vertical_widget.dart';
export 'core/network/base/typedef/typedef.dart';
export 'core/network/api_result/api_result.dart';
export 'core/network/base/network_exceptions/network_exceptions.dart';
export 'core/network/base/repository/base_repository.dart';
export 'core/util/enums.dart';
export 'core/util/toast_manager.dart';
export 'core/consts/end_points.dart';
export 'core/widget/search_bar_widget.dart';
export 'core/widget/slider_widget.dart';
export 'core/util/storage/app_prefs.dart';
export 'core/network/dio/dio.dart';
export 'core/consts/app_constants.dart';
export 'core/network/base/response/base_response.dart';
export 'core/network/base/response/pagenation_model.dart';
export 'core/network/base/response/data_converter.dart';
export 'core/service/user_service.dart';
export 'core/widget/app_text/txt_btn.dart';
export 'core/widget/lists/horizontal_lists.dart';
export 'core/widget/app_loading/loading_widget.dart';
export 'core/network/base/parameters/id_only.dart';
export 'core/network/base/parameters/page_only.dart';
export 'core/widget/shimmer_widget.dart';
export 'core/widget/handling_view_widgets/offline_internet_state_widget.dart';
export 'core/widget/build_app_bar.dart';
export 'core/widget/button/default_app_button.dart';
export 'core/network/connection_checker.dart';
export 'core/network/base/use_case/base_use_case.dart';
export 'core/widget/handling_view_widgets/handling_requset_view.dart';
export 'sl.dart';

export 'features/public/domain/repository/auth_repository.dart';
export 'features/public/data/data_sorce/remote/api_client.dart';
export 'features/public/data/model/authentication_model.dart';
export 'features/public/data/repository/authe_repository_imp.dart';
export 'features/public/data/model/about_us_model.dart';

//? bindings
export 'features/public/presentation/auth/verify_code/bindings/verify_code_binding.dart';
export 'features/public/presentation/auth/forget_password/bindings/verify_forget_pass_vendor_binding.dart';
export 'features/public/presentation/about_us/bindings/about_us_binding.dart';
export 'features/public/presentation/choose_langeuage/bindings/choose_language_binding.dart';
export 'features/public/presentation/change_password/bindings/change_pass_binding.dart';
export 'features/public/presentation/profile/bindings/profile_binding.dart';
export 'features/public/presentation/contact_us/bindings/contact_us_binding.dart';
export 'features/public/presentation/auth/login/bindings/login_binding.dart';
export 'features/public/presentation/auth/forget_password/bindings/forget_password_binding.dart';
export 'features/public/presentation/auth/register/bindings/register_binding.dart';
export 'features/public/presentation/auth/forget_password/bindings/reset_forget_pass_vendor_binding.dart';
export 'features/public/presentation/splash/bindings/splash_binding.dart';

//? use cases

export 'features/public/domain/use_case/auth/forget_password/forgot_password_usecase.dart';
export 'features/public/domain/use_case/auth/forget_password/reset_password_usecase.dart';
export 'features/public/domain/use_case/auth/forget_password/verify_email_usecase.dart';
export 'features/public/domain/use_case/auth/register/register_usecase.dart';
export 'features/public/domain/use_case/auth/register/verify_register_usecase.dart';
export 'features/public/domain/use_case/auth/register/resend_code_register_usecase.dart';
export 'features/public/domain/use_case/auth/login/login_usecase.dart';
export 'features/public/domain/use_case/contact_us_usecase.dart';
export 'features/public/domain/use_case/profile/update_password_usecase.dart';
export 'features/public/domain/use_case/profile/get_user_usecase.dart';
export 'features/public/domain/use_case/profile/update_profile_use_case.dart';
export 'features/public/domain/use_case/get_about_usecase.dart';
//? entity

export 'features/public/domain/entity/authentication.dart';
export 'features/public/domain/entity/about_us_entity.dart';

export 'core/widget/smart_ref_widget.dart';
export 'features/public/presentation/about_us/views/privacy/privacy_view.dart';
export 'features/public/presentation/about_us/views/terms/terms_view.dart';

export 'features/public/domain/use_case/auth/login/login_anonymous_usecase.dart';
export 'features/public/domain/use_case/auth/login/login_refresh_usecase.dart';
export 'features/public/domain/use_case/auth/token_verify_usecase.dart';
