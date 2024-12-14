#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#ifdef iconEnabled
#undef iconEnabled
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler additional_settings_btn_refl_texSmpSC 2:23
//sampler sampler iconSmpSC 2:24
//sampler sampler intensityTextureSmpSC 2:25
//sampler sampler sc_ScreenTextureSmpSC 2:30
//sampler sampler z_hitIdAndBarycentricSmp 2:33
//sampler sampler z_rayDirectionsSmpSC 2:34
//texture texture2D additional_settings_btn_refl_tex 2:4:2:23
//texture texture2D icon 2:5:2:24
//texture texture2D intensityTexture 2:6:2:25
//texture texture2D sc_ScreenTexture 2:18:2:30
//texture utexture2D z_hitIdAndBarycentric 2:21:2:33
//texture texture2D z_rayDirections 2:22:2:34
//ubo float sc_BonesUBO 2:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 2:35:4656 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapDiffuseDims 1104
//float4 sc_EnvmapDiffuseView 1120
//float4 sc_EnvmapSpecularSize 1136
//float4 sc_EnvmapSpecularDims 1152
//float4 sc_EnvmapSpecularView 1168
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_GeometryInfo 1408
//float4x4 sc_ModelViewProjectionMatrixArray 1424:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1552:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1808:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2064:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2192:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2288:[2]:48
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float3x3 sc_NormalMatrixInverse 3200
//float4x4 sc_PrevFrameModelMatrix 3248
//float4x4 sc_PrevFrameModelMatrixInverse 3312
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float3 sc_WorldAabbMin 3408
//float3 sc_WorldAabbMax 3424
//float4 sc_WindowToViewportTransform 3440
//sc_Camera_t sc_Camera 3456
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3488
//float4 sc_ShadowColor 3504
//float4x4 sc_ProjectorMatrix 3520
//float _sc_GetFramebufferColorInvalidUsageMarker 3584
//float shaderComplexityValue 3588
//float sc_DisableFrustumCullingMarker 3592
//float4 weights0 3600
//float4 weights1 3616
//float4 weights2 3632
//float4 sc_StereoClipPlanes 3648:[2]:16
//int sc_FallbackInstanceID 3680
//float _sc_framebufferFetchMarker 3684
//float2 sc_TAAJitterOffset 3688
//float strandWidth 3696
//float strandTaper 3700
//float4 sc_StrandDataMapTextureSize 3712
//float clumpInstanceCount 3728
//float clumpRadius 3732
//float clumpTipScale 3736
//float hairstyleInstanceCount 3740
//float hairstyleNoise 3744
//float4 sc_ScreenTextureSize 3760
//float4 sc_ScreenTextureDims 3776
//float4 sc_ScreenTextureView 3792
//bool isProxyMode 3808
//int instance_id 3812
//int lray_triangles_last 3816
//bool noEarlyZ 3820
//bool has_animated_pn 3824
//int emitter_stride 3828
//int proxy_offset_position 3832
//int proxy_offset_normal 3836
//int proxy_offset_tangent 3840
//int proxy_offset_color 3844
//int proxy_offset_texture0 3848
//int proxy_offset_texture1 3852
//int proxy_offset_texture2 3856
//int proxy_offset_texture3 3860
//int proxy_format_position 3864
//int proxy_format_normal 3868
//int proxy_format_tangent 3872
//int proxy_format_color 3876
//int proxy_format_texture0 3880
//int proxy_format_texture1 3884
//int proxy_format_texture2 3888
//int proxy_format_texture3 3892
//float4 z_rayDirectionsSize 3904
//float4 z_rayDirectionsDims 3920
//float4 z_rayDirectionsView 3936
//float correctedIntensity 3952
//float4 intensityTextureSize 3968
//float4 intensityTextureDims 3984
//float4 intensityTextureView 4000
//float3x3 intensityTextureTransform 4016
//float4 intensityTextureUvMinMax 4064
//float4 intensityTextureBorderColor 4080
//float reflBlurWidth 4096
//float reflBlurMinRough 4100
//float reflBlurMaxRough 4104
//int overrideTimeEnabled 4108
//float overrideTimeElapsed 4112
//float overrideTimeDelta 4116
//int PreviewEnabled 4120
//int PreviewNodeID 4124
//float alphaTestThreshold 4128
//float4 additional_settings_btn_refl_texSize 4144
//float4 additional_settings_btn_refl_texDims 4160
//float4 additional_settings_btn_refl_texView 4176
//float3x3 additional_settings_btn_refl_texTransform 4192
//float4 additional_settings_btn_refl_texUvMinMax 4240
//float4 additional_settings_btn_refl_texBorderColor 4256
//float4 iconSize 4272
//float4 iconDims 4288
//float4 iconView 4304
//float3x3 iconTransform 4320
//float4 iconUvMinMax 4368
//float4 iconBorderColor 4384
//bool iconEnabled 4400
//float Port_Import_N006 4404
//float3 Port_Import_N049 4416
//float Port_Input1_N053 4432
//float Port_Input2_N053 4436
//float Port_Import_N062 4440
//float3 Port_Import_N068 4448
//float Port_Input1_N073 4464
//float Port_Input2_N073 4468
//float Port_Input2_N005 4472
//float2 Port_Input1_N009 4480
//float2 Port_Input2_N009 4488
//float4 Port_Value0_N003 4496
//float Port_Position1_N003 4512
//float4 Port_Value1_N003 4528
//float Port_Position2_N003 4544
//float4 Port_Value2_N003 4560
//float Port_Position3_N003 4576
//float4 Port_Value3_N003 4592
//float4 Port_Value4_N003 4608
//float2 Port_Scale_N002 4624
//float2 Port_Center_N002 4632
//float Port_Input2_N007 4640
//float depthRef 4644
//}
//ssbo int layoutIndices 2:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 2:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 2:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1030
//spec_const bool SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex 1031
//spec_const bool SC_USE_CLAMP_TO_BORDER_icon 1032
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1033
//spec_const bool SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex 1034
//spec_const bool SC_USE_UV_MIN_MAX_icon 1035
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1036
//spec_const bool SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex 1037
//spec_const bool SC_USE_UV_TRANSFORM_icon 1038
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1039
//spec_const bool UseViewSpaceDepthVariant 1040
//spec_const bool additional_settings_btn_refl_texHasSwappedViews 1041
//spec_const bool iconHasSwappedViews 1042
//spec_const bool intensityTextureHasSwappedViews 1043
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1044
//spec_const bool sc_BlendMode_Add 1045
//spec_const bool sc_BlendMode_AlphaTest 1046
//spec_const bool sc_BlendMode_AlphaToCoverage 1047
//spec_const bool sc_BlendMode_ColoredGlass 1048
//spec_const bool sc_BlendMode_Custom 1049
//spec_const bool sc_BlendMode_Max 1050
//spec_const bool sc_BlendMode_Min 1051
//spec_const bool sc_BlendMode_MultiplyOriginal 1052
//spec_const bool sc_BlendMode_Multiply 1053
//spec_const bool sc_BlendMode_Normal 1054
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1055
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1056
//spec_const bool sc_BlendMode_PremultipliedAlpha 1057
//spec_const bool sc_BlendMode_Screen 1058
//spec_const bool sc_DepthOnly 1059
//spec_const bool sc_FramebufferFetch 1060
//spec_const bool sc_MotionVectorsPass 1061
//spec_const bool sc_OITCompositingPass 1062
//spec_const bool sc_OITDepthBoundsPass 1063
//spec_const bool sc_OITDepthGatherPass 1064
//spec_const bool sc_ProjectiveShadowsCaster 1065
//spec_const bool sc_ProjectiveShadowsReceiver 1066
//spec_const bool sc_ProxyAlphaOne 1067
//spec_const bool sc_RenderAlphaToColor 1068
//spec_const bool sc_ScreenTextureHasSwappedViews 1069
//spec_const bool sc_ShaderComplexityAnalyzer 1070
//spec_const bool sc_UseFramebufferFetchMarker 1071
//spec_const bool sc_VertexBlendingUseNormals 1072
//spec_const bool sc_VertexBlending 1073
//spec_const int SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex 1074
//spec_const int SC_SOFTWARE_WRAP_MODE_U_icon 1075
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1076
//spec_const int SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex 1077
//spec_const int SC_SOFTWARE_WRAP_MODE_V_icon 1078
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1079
//spec_const int additional_settings_btn_refl_texLayout 1080
//spec_const int iconLayout 1081
//spec_const int intensityTextureLayout 1082
//spec_const int sc_DepthBufferMode 1083
//spec_const int sc_RenderingSpace 1084
//spec_const int sc_ScreenTextureLayout 1085
//spec_const int sc_SkinBonesCount 1086
//spec_const int sc_StereoRenderingMode 1087
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1088
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1030)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex [[function_constant(1031)]];
constant bool SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex) ? SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex : false;
constant bool SC_USE_CLAMP_TO_BORDER_icon [[function_constant(1032)]];
constant bool SC_USE_CLAMP_TO_BORDER_icon_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_icon) ? SC_USE_CLAMP_TO_BORDER_icon : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1033)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex [[function_constant(1034)]];
constant bool SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex) ? SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex : false;
constant bool SC_USE_UV_MIN_MAX_icon [[function_constant(1035)]];
constant bool SC_USE_UV_MIN_MAX_icon_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_icon) ? SC_USE_UV_MIN_MAX_icon : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1036)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex [[function_constant(1037)]];
constant bool SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex) ? SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex : false;
constant bool SC_USE_UV_TRANSFORM_icon [[function_constant(1038)]];
constant bool SC_USE_UV_TRANSFORM_icon_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_icon) ? SC_USE_UV_TRANSFORM_icon : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1039)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1040)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool additional_settings_btn_refl_texHasSwappedViews [[function_constant(1041)]];
constant bool additional_settings_btn_refl_texHasSwappedViews_tmp = is_function_constant_defined(additional_settings_btn_refl_texHasSwappedViews) ? additional_settings_btn_refl_texHasSwappedViews : false;
constant bool iconHasSwappedViews [[function_constant(1042)]];
constant bool iconHasSwappedViews_tmp = is_function_constant_defined(iconHasSwappedViews) ? iconHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1043)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1044)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1045)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1046)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1047)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1048)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1049)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1050)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1051)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1052)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1053)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1054)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1055)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1056)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1057)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1058)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1059)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(1060)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(1061)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1062)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1063)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1064)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1065)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1066)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(1067)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RenderAlphaToColor [[function_constant(1068)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1069)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1070)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1071)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1072)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1073)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex [[function_constant(1074)]];
constant int SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex) ? SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_icon [[function_constant(1075)]];
constant int SC_SOFTWARE_WRAP_MODE_U_icon_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_icon) ? SC_SOFTWARE_WRAP_MODE_U_icon : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1076)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex [[function_constant(1077)]];
constant int SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex) ? SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_icon [[function_constant(1078)]];
constant int SC_SOFTWARE_WRAP_MODE_V_icon_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_icon) ? SC_SOFTWARE_WRAP_MODE_V_icon : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1079)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int additional_settings_btn_refl_texLayout [[function_constant(1080)]];
constant int additional_settings_btn_refl_texLayout_tmp = is_function_constant_defined(additional_settings_btn_refl_texLayout) ? additional_settings_btn_refl_texLayout : 0;
constant int iconLayout [[function_constant(1081)]];
constant int iconLayout_tmp = is_function_constant_defined(iconLayout) ? iconLayout : 0;
constant int intensityTextureLayout [[function_constant(1082)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(1083)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(1084)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1085)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1086)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1087)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1088)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int isProxyMode;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 additional_settings_btn_refl_texSize;
float4 additional_settings_btn_refl_texDims;
float4 additional_settings_btn_refl_texView;
float3x3 additional_settings_btn_refl_texTransform;
float4 additional_settings_btn_refl_texUvMinMax;
float4 additional_settings_btn_refl_texBorderColor;
float4 iconSize;
float4 iconDims;
float4 iconView;
float3x3 iconTransform;
float4 iconUvMinMax;
float4 iconBorderColor;
int iconEnabled;
float Port_Import_N006;
float3 Port_Import_N049;
float Port_Input1_N053;
float Port_Input2_N053;
float Port_Import_N062;
float3 Port_Import_N068;
float Port_Input1_N073;
float Port_Input2_N073;
float Port_Input2_N005;
float2 Port_Input1_N009;
float2 Port_Input2_N009;
float4 Port_Value0_N003;
float Port_Position1_N003;
float4 Port_Value1_N003;
float Port_Position2_N003;
float4 Port_Value2_N003;
float Port_Position3_N003;
float4 Port_Value3_N003;
float4 Port_Value4_N003;
float2 Port_Scale_N002;
float2 Port_Center_N002;
float Port_Input2_N007;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> additional_settings_btn_refl_tex [[id(4)]];
texture2d<float> icon [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<uint> z_hitIdAndBarycentric [[id(21)]];
texture2d<float> z_rayDirections [[id(22)]];
sampler additional_settings_btn_refl_texSmpSC [[id(23)]];
sampler iconSmpSC [[id(24)]];
sampler intensityTextureSmpSC [[id(25)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
sampler z_hitIdAndBarycentricSmp [[id(33)]];
sampler z_rayDirectionsSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(35)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set2.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set2.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set2.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set2.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set2.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set2.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set2.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=0;
int l9_62=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_62=int(in.boneData[l9_61]);
}
int l9_63=l9_62;
int l9_64=l9_63;
int l9_65=1;
int l9_66=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_66=int(in.boneData[l9_65]);
}
int l9_67=l9_66;
int l9_68=l9_67;
int l9_69=2;
int l9_70=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_70=int(in.boneData[l9_69]);
}
int l9_71=l9_70;
int l9_72=l9_71;
int l9_73=3;
int l9_74=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_74=int(in.boneData[l9_73]);
}
int l9_75=l9_74;
int l9_76=l9_75;
int l9_77=l9_64;
float4 l9_78=l9_57.position;
float3 l9_79=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_80=l9_77;
float4 l9_81=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[0];
float4 l9_82=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[1];
float4 l9_83=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[2];
float4 l9_84[3];
l9_84[0]=l9_81;
l9_84[1]=l9_82;
l9_84[2]=l9_83;
l9_79=float3(dot(l9_78,l9_84[0]),dot(l9_78,l9_84[1]),dot(l9_78,l9_84[2]));
}
else
{
l9_79=l9_78.xyz;
}
float3 l9_85=l9_79;
float3 l9_86=l9_85;
float l9_87=l9_60.x;
int l9_88=l9_68;
float4 l9_89=l9_57.position;
float3 l9_90=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_91=l9_88;
float4 l9_92=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[0];
float4 l9_93=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[1];
float4 l9_94=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[2];
float4 l9_95[3];
l9_95[0]=l9_92;
l9_95[1]=l9_93;
l9_95[2]=l9_94;
l9_90=float3(dot(l9_89,l9_95[0]),dot(l9_89,l9_95[1]),dot(l9_89,l9_95[2]));
}
else
{
l9_90=l9_89.xyz;
}
float3 l9_96=l9_90;
float3 l9_97=l9_96;
float l9_98=l9_60.y;
int l9_99=l9_72;
float4 l9_100=l9_57.position;
float3 l9_101=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_102=l9_99;
float4 l9_103=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[0];
float4 l9_104=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[1];
float4 l9_105=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[2];
float4 l9_106[3];
l9_106[0]=l9_103;
l9_106[1]=l9_104;
l9_106[2]=l9_105;
l9_101=float3(dot(l9_100,l9_106[0]),dot(l9_100,l9_106[1]),dot(l9_100,l9_106[2]));
}
else
{
l9_101=l9_100.xyz;
}
float3 l9_107=l9_101;
float3 l9_108=l9_107;
float l9_109=l9_60.z;
int l9_110=l9_76;
float4 l9_111=l9_57.position;
float3 l9_112=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_113=l9_110;
float4 l9_114=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[0];
float4 l9_115=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[1];
float4 l9_116=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[2];
float4 l9_117[3];
l9_117[0]=l9_114;
l9_117[1]=l9_115;
l9_117[2]=l9_116;
l9_112=float3(dot(l9_111,l9_117[0]),dot(l9_111,l9_117[1]),dot(l9_111,l9_117[2]));
}
else
{
l9_112=l9_111.xyz;
}
float3 l9_118=l9_112;
float3 l9_119=(((l9_86*l9_87)+(l9_97*l9_98))+(l9_108*l9_109))+(l9_118*l9_60.w);
l9_57.position=float4(l9_119.x,l9_119.y,l9_119.z,l9_57.position.w);
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
int l9_124=l9_68;
float3x3 l9_125=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[2].xyz));
float3x3 l9_126=l9_125;
float3x3 l9_127=l9_126;
int l9_128=l9_72;
float3x3 l9_129=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[2].xyz));
float3x3 l9_130=l9_129;
float3x3 l9_131=l9_130;
int l9_132=l9_76;
float3x3 l9_133=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[2].xyz));
float3x3 l9_134=l9_133;
float3x3 l9_135=l9_134;
l9_57.normal=((((l9_123*l9_57.normal)*l9_60.x)+((l9_127*l9_57.normal)*l9_60.y))+((l9_131*l9_57.normal)*l9_60.z))+((l9_135*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_123*l9_57.tangent)*l9_60.x)+((l9_127*l9_57.tangent)*l9_60.y))+((l9_131*l9_57.tangent)*l9_60.z))+((l9_135*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_136=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_136.x,l9_136.y,l9_136.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_137=normalize(param_5);
out.varTangent=float4(l9_137.x,l9_137.y,l9_137.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_138=param_2.position;
float4 l9_139=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_139=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_141]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_142=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_142=0;
}
else
{
l9_142=gl_InstanceIndex%2;
}
int l9_143=l9_142;
l9_139=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_143]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_144=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_139=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*l9_138;
}
else
{
l9_139=l9_138;
}
}
}
float4 l9_146=l9_139;
out.varViewSpaceDepth=-l9_146.z;
}
float4 l9_147=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_147=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_148=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_147=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_149]*param_2.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_150=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_150=0;
}
else
{
l9_150=gl_InstanceIndex%2;
}
int l9_151=l9_150;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_151]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_152=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_152=0;
}
else
{
l9_152=gl_InstanceIndex%2;
}
int l9_153=l9_152;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_153]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_154=param_2.position;
float4 l9_155=l9_154;
if (sc_RenderingSpace_tmp==1)
{
l9_155=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_154;
}
float4 l9_156=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_155;
float2 l9_157=((l9_156.xy/float2(l9_156.w))*0.5)+float2(0.5);
out.varShadowTex=l9_157;
}
float4 l9_158=l9_147;
if (sc_DepthBufferMode_tmp==1)
{
int l9_159=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_159=0;
}
else
{
l9_159=gl_InstanceIndex%2;
}
int l9_160=l9_159;
if ((*sc_set2.UserUniforms).sc_ProjectionMatrixArray[l9_160][2].w!=0.0)
{
float l9_161=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_158.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_158.w))*l9_161)-1.0)*l9_158.w;
}
}
float4 l9_162=l9_158;
l9_147=l9_162;
float4 l9_163=l9_147;
float4 l9_164=l9_163;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_165=l9_164;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_166=dot(l9_165,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_167=l9_166;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_167;
}
}
float4 l9_168=float4(l9_164.x,-l9_164.y,(l9_164.z*0.5)+(l9_164.w*0.5),l9_164.w);
out.gl_Position=l9_168;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int isProxyMode;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 additional_settings_btn_refl_texSize;
float4 additional_settings_btn_refl_texDims;
float4 additional_settings_btn_refl_texView;
float3x3 additional_settings_btn_refl_texTransform;
float4 additional_settings_btn_refl_texUvMinMax;
float4 additional_settings_btn_refl_texBorderColor;
float4 iconSize;
float4 iconDims;
float4 iconView;
float3x3 iconTransform;
float4 iconUvMinMax;
float4 iconBorderColor;
int iconEnabled;
float Port_Import_N006;
float3 Port_Import_N049;
float Port_Input1_N053;
float Port_Input2_N053;
float Port_Import_N062;
float3 Port_Import_N068;
float Port_Input1_N073;
float Port_Input2_N073;
float Port_Input2_N005;
float2 Port_Input1_N009;
float2 Port_Input2_N009;
float4 Port_Value0_N003;
float Port_Position1_N003;
float4 Port_Value1_N003;
float Port_Position2_N003;
float4 Port_Value2_N003;
float Port_Position3_N003;
float4 Port_Value3_N003;
float4 Port_Value4_N003;
float2 Port_Scale_N002;
float2 Port_Center_N002;
float Port_Input2_N007;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> additional_settings_btn_refl_tex [[id(4)]];
texture2d<float> icon [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<uint> z_hitIdAndBarycentric [[id(21)]];
texture2d<float> z_rayDirections [[id(22)]];
sampler additional_settings_btn_refl_texSmpSC [[id(23)]];
sampler iconSmpSC [[id(24)]];
sampler intensityTextureSmpSC [[id(25)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
sampler z_hitIdAndBarycentricSmp [[id(33)]];
sampler z_rayDirectionsSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(35)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
bool l9_2=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set2.UserUniforms),sc_set2.z_rayDirections,sc_set2.z_rayDirectionsSmpSC,sc_set2.z_hitIdAndBarycentric,sc_set2.z_hitIdAndBarycentricSmp,(*sc_set2.layoutVertices),(*sc_set2.layoutVerticesPN),(*sc_set2.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set2.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set2.UserUniforms).instance_id))
{
return out;
}
}
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.Surface_UVCoord1=rhp.uv1;
}
else
{
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
}
float Value_N6=0.0;
Value_N6=(*sc_set2.UserUniforms).Port_Import_N006;
float3 Tangent_N19=float3(0.0);
Tangent_N19=Globals.VertexTangent_WorldSpace;
float3 Binormal_N20=float3(0.0);
Binormal_N20=Globals.VertexBinormal_WorldSpace;
float3 Normal_N46=float3(0.0);
Normal_N46=Globals.VertexNormal_WorldSpace;
float3x3 Matrix_N48=float3x3(float3(0.0),float3(0.0),float3(0.0));
Matrix_N48=float3x3(float3(Tangent_N19),float3(Binormal_N20),float3(Normal_N46));
float3 Value_N49=float3(0.0);
Value_N49=(*sc_set2.UserUniforms).Port_Import_N049;
float3 Output_N50=float3(0.0);
Output_N50=Matrix_N48*Value_N49;
float3 Output_N51=float3(0.0);
float3 param=Output_N50;
float l9_7=dot(param,param);
float l9_8;
if (l9_7>0.0)
{
l9_8=1.0/sqrt(l9_7);
}
else
{
l9_8=0.0;
}
float l9_9=l9_8;
float3 param_1=param*l9_9;
Output_N51=param_1;
float3 VectorOut_N52=float3(0.0);
int l9_10=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10=0;
}
else
{
l9_10=in.varStereoViewID;
}
int l9_11=l9_10;
VectorOut_N52=((*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_11]*float4(Output_N51,0.0)).xyz;
float3 Output_N53=float3(0.0);
Output_N53=(VectorOut_N52*float3((*sc_set2.UserUniforms).Port_Input1_N053))+float3((*sc_set2.UserUniforms).Port_Input2_N053);
float4 Color_N57=float4(0.0);
int l9_12=0;
if ((int(additional_settings_btn_refl_texHasSwappedViews_tmp)!=0))
{
int l9_13=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13=0;
}
else
{
l9_13=in.varStereoViewID;
}
int l9_14=l9_13;
l9_12=1-l9_14;
}
else
{
int l9_15=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_15=0;
}
else
{
l9_15=in.varStereoViewID;
}
int l9_16=l9_15;
l9_12=l9_16;
}
int l9_17=l9_12;
int param_2=additional_settings_btn_refl_texLayout_tmp;
int param_3=l9_17;
float2 param_4=Output_N53.xy;
bool param_5=(int(SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex_tmp)!=0);
float3x3 param_6=(*sc_set2.UserUniforms).additional_settings_btn_refl_texTransform;
int2 param_7=int2(SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex_tmp,SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex_tmp);
bool param_8=(int(SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex_tmp)!=0);
float4 param_9=(*sc_set2.UserUniforms).additional_settings_btn_refl_texUvMinMax;
bool param_10=(int(SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex_tmp)!=0);
float4 param_11=(*sc_set2.UserUniforms).additional_settings_btn_refl_texBorderColor;
float param_12=0.0;
bool l9_18=param_10&&(!param_8);
float l9_19=1.0;
float l9_20=param_4.x;
int l9_21=param_7.x;
if (l9_21==1)
{
l9_20=fract(l9_20);
}
else
{
if (l9_21==2)
{
float l9_22=fract(l9_20);
float l9_23=l9_20-l9_22;
float l9_24=step(0.25,fract(l9_23*0.5));
l9_20=mix(l9_22,1.0-l9_22,fast::clamp(l9_24,0.0,1.0));
}
}
param_4.x=l9_20;
float l9_25=param_4.y;
int l9_26=param_7.y;
if (l9_26==1)
{
l9_25=fract(l9_25);
}
else
{
if (l9_26==2)
{
float l9_27=fract(l9_25);
float l9_28=l9_25-l9_27;
float l9_29=step(0.25,fract(l9_28*0.5));
l9_25=mix(l9_27,1.0-l9_27,fast::clamp(l9_29,0.0,1.0));
}
}
param_4.y=l9_25;
if (param_8)
{
bool l9_30=param_10;
bool l9_31;
if (l9_30)
{
l9_31=param_7.x==3;
}
else
{
l9_31=l9_30;
}
float l9_32=param_4.x;
float l9_33=param_9.x;
float l9_34=param_9.z;
bool l9_35=l9_31;
float l9_36=l9_19;
float l9_37=fast::clamp(l9_32,l9_33,l9_34);
float l9_38=step(abs(l9_32-l9_37),9.9999997e-06);
l9_36*=(l9_38+((1.0-float(l9_35))*(1.0-l9_38)));
l9_32=l9_37;
param_4.x=l9_32;
l9_19=l9_36;
bool l9_39=param_10;
bool l9_40;
if (l9_39)
{
l9_40=param_7.y==3;
}
else
{
l9_40=l9_39;
}
float l9_41=param_4.y;
float l9_42=param_9.y;
float l9_43=param_9.w;
bool l9_44=l9_40;
float l9_45=l9_19;
float l9_46=fast::clamp(l9_41,l9_42,l9_43);
float l9_47=step(abs(l9_41-l9_46),9.9999997e-06);
l9_45*=(l9_47+((1.0-float(l9_44))*(1.0-l9_47)));
l9_41=l9_46;
param_4.y=l9_41;
l9_19=l9_45;
}
float2 l9_48=param_4;
bool l9_49=param_5;
float3x3 l9_50=param_6;
if (l9_49)
{
l9_48=float2((l9_50*float3(l9_48,1.0)).xy);
}
float2 l9_51=l9_48;
float2 l9_52=l9_51;
float2 l9_53=l9_52;
param_4=l9_53;
float l9_54=param_4.x;
int l9_55=param_7.x;
bool l9_56=l9_18;
float l9_57=l9_19;
if ((l9_55==0)||(l9_55==3))
{
float l9_58=l9_54;
float l9_59=0.0;
float l9_60=1.0;
bool l9_61=l9_56;
float l9_62=l9_57;
float l9_63=fast::clamp(l9_58,l9_59,l9_60);
float l9_64=step(abs(l9_58-l9_63),9.9999997e-06);
l9_62*=(l9_64+((1.0-float(l9_61))*(1.0-l9_64)));
l9_58=l9_63;
l9_54=l9_58;
l9_57=l9_62;
}
param_4.x=l9_54;
l9_19=l9_57;
float l9_65=param_4.y;
int l9_66=param_7.y;
bool l9_67=l9_18;
float l9_68=l9_19;
if ((l9_66==0)||(l9_66==3))
{
float l9_69=l9_65;
float l9_70=0.0;
float l9_71=1.0;
bool l9_72=l9_67;
float l9_73=l9_68;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_65=l9_69;
l9_68=l9_73;
}
param_4.y=l9_65;
l9_19=l9_68;
float2 l9_76=param_4;
int l9_77=param_2;
int l9_78=param_3;
float l9_79=param_12;
float2 l9_80=l9_76;
int l9_81=l9_77;
int l9_82=l9_78;
float3 l9_83=float3(0.0);
if (l9_81==0)
{
l9_83=float3(l9_80,0.0);
}
else
{
if (l9_81==1)
{
l9_83=float3(l9_80.x,(l9_80.y*0.5)+(0.5-(float(l9_82)*0.5)),0.0);
}
else
{
l9_83=float3(l9_80,float(l9_82));
}
}
float3 l9_84=l9_83;
float3 l9_85=l9_84;
float2 l9_86=l9_85.xy;
float l9_87=l9_79;
float4 l9_88=sc_set2.additional_settings_btn_refl_tex.sample(sc_set2.additional_settings_btn_refl_texSmpSC,l9_86,bias(l9_87));
float4 l9_89=l9_88;
float4 l9_90=l9_89;
if (param_10)
{
l9_90=mix(param_11,l9_90,float4(l9_19));
}
float4 l9_91=l9_90;
Color_N57=l9_91;
float4 Output_N58=float4(0.0);
Output_N58=float4(Value_N6)*Color_N57;
float4 Export_N59=float4(0.0);
Export_N59=Output_N58;
float Value_N62=0.0;
Value_N62=(*sc_set2.UserUniforms).Port_Import_N062;
float3 Tangent_N64=float3(0.0);
Tangent_N64=Globals.VertexTangent_WorldSpace;
float3 Binormal_N65=float3(0.0);
Binormal_N65=Globals.VertexBinormal_WorldSpace;
float3 Normal_N66=float3(0.0);
Normal_N66=Globals.VertexNormal_WorldSpace;
float3x3 Matrix_N67=float3x3(float3(0.0),float3(0.0),float3(0.0));
Matrix_N67=float3x3(float3(Tangent_N64),float3(Binormal_N65),float3(Normal_N66));
float3 Value_N68=float3(0.0);
Value_N68=(*sc_set2.UserUniforms).Port_Import_N068;
float3 Output_N69=float3(0.0);
Output_N69=Matrix_N67*Value_N68;
float3 Output_N70=float3(0.0);
float3 param_13=Output_N69;
float l9_92=dot(param_13,param_13);
float l9_93;
if (l9_92>0.0)
{
l9_93=1.0/sqrt(l9_92);
}
else
{
l9_93=0.0;
}
float l9_94=l9_93;
float3 param_14=param_13*l9_94;
Output_N70=param_14;
float3 VectorOut_N71=float3(0.0);
int l9_95=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_95=0;
}
else
{
l9_95=in.varStereoViewID;
}
int l9_96=l9_95;
VectorOut_N71=((*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_96]*float4(Output_N70,0.0)).xyz;
float3 Output_N73=float3(0.0);
Output_N73=(VectorOut_N71*float3((*sc_set2.UserUniforms).Port_Input1_N073))+float3((*sc_set2.UserUniforms).Port_Input2_N073);
float4 Color_N74=float4(0.0);
int l9_97=0;
if ((int(additional_settings_btn_refl_texHasSwappedViews_tmp)!=0))
{
int l9_98=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_98=0;
}
else
{
l9_98=in.varStereoViewID;
}
int l9_99=l9_98;
l9_97=1-l9_99;
}
else
{
int l9_100=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_100=0;
}
else
{
l9_100=in.varStereoViewID;
}
int l9_101=l9_100;
l9_97=l9_101;
}
int l9_102=l9_97;
int param_15=additional_settings_btn_refl_texLayout_tmp;
int param_16=l9_102;
float2 param_17=Output_N73.xy;
bool param_18=(int(SC_USE_UV_TRANSFORM_additional_settings_btn_refl_tex_tmp)!=0);
float3x3 param_19=(*sc_set2.UserUniforms).additional_settings_btn_refl_texTransform;
int2 param_20=int2(SC_SOFTWARE_WRAP_MODE_U_additional_settings_btn_refl_tex_tmp,SC_SOFTWARE_WRAP_MODE_V_additional_settings_btn_refl_tex_tmp);
bool param_21=(int(SC_USE_UV_MIN_MAX_additional_settings_btn_refl_tex_tmp)!=0);
float4 param_22=(*sc_set2.UserUniforms).additional_settings_btn_refl_texUvMinMax;
bool param_23=(int(SC_USE_CLAMP_TO_BORDER_additional_settings_btn_refl_tex_tmp)!=0);
float4 param_24=(*sc_set2.UserUniforms).additional_settings_btn_refl_texBorderColor;
float param_25=0.0;
bool l9_103=param_23&&(!param_21);
float l9_104=1.0;
float l9_105=param_17.x;
int l9_106=param_20.x;
if (l9_106==1)
{
l9_105=fract(l9_105);
}
else
{
if (l9_106==2)
{
float l9_107=fract(l9_105);
float l9_108=l9_105-l9_107;
float l9_109=step(0.25,fract(l9_108*0.5));
l9_105=mix(l9_107,1.0-l9_107,fast::clamp(l9_109,0.0,1.0));
}
}
param_17.x=l9_105;
float l9_110=param_17.y;
int l9_111=param_20.y;
if (l9_111==1)
{
l9_110=fract(l9_110);
}
else
{
if (l9_111==2)
{
float l9_112=fract(l9_110);
float l9_113=l9_110-l9_112;
float l9_114=step(0.25,fract(l9_113*0.5));
l9_110=mix(l9_112,1.0-l9_112,fast::clamp(l9_114,0.0,1.0));
}
}
param_17.y=l9_110;
if (param_21)
{
bool l9_115=param_23;
bool l9_116;
if (l9_115)
{
l9_116=param_20.x==3;
}
else
{
l9_116=l9_115;
}
float l9_117=param_17.x;
float l9_118=param_22.x;
float l9_119=param_22.z;
bool l9_120=l9_116;
float l9_121=l9_104;
float l9_122=fast::clamp(l9_117,l9_118,l9_119);
float l9_123=step(abs(l9_117-l9_122),9.9999997e-06);
l9_121*=(l9_123+((1.0-float(l9_120))*(1.0-l9_123)));
l9_117=l9_122;
param_17.x=l9_117;
l9_104=l9_121;
bool l9_124=param_23;
bool l9_125;
if (l9_124)
{
l9_125=param_20.y==3;
}
else
{
l9_125=l9_124;
}
float l9_126=param_17.y;
float l9_127=param_22.y;
float l9_128=param_22.w;
bool l9_129=l9_125;
float l9_130=l9_104;
float l9_131=fast::clamp(l9_126,l9_127,l9_128);
float l9_132=step(abs(l9_126-l9_131),9.9999997e-06);
l9_130*=(l9_132+((1.0-float(l9_129))*(1.0-l9_132)));
l9_126=l9_131;
param_17.y=l9_126;
l9_104=l9_130;
}
float2 l9_133=param_17;
bool l9_134=param_18;
float3x3 l9_135=param_19;
if (l9_134)
{
l9_133=float2((l9_135*float3(l9_133,1.0)).xy);
}
float2 l9_136=l9_133;
float2 l9_137=l9_136;
float2 l9_138=l9_137;
param_17=l9_138;
float l9_139=param_17.x;
int l9_140=param_20.x;
bool l9_141=l9_103;
float l9_142=l9_104;
if ((l9_140==0)||(l9_140==3))
{
float l9_143=l9_139;
float l9_144=0.0;
float l9_145=1.0;
bool l9_146=l9_141;
float l9_147=l9_142;
float l9_148=fast::clamp(l9_143,l9_144,l9_145);
float l9_149=step(abs(l9_143-l9_148),9.9999997e-06);
l9_147*=(l9_149+((1.0-float(l9_146))*(1.0-l9_149)));
l9_143=l9_148;
l9_139=l9_143;
l9_142=l9_147;
}
param_17.x=l9_139;
l9_104=l9_142;
float l9_150=param_17.y;
int l9_151=param_20.y;
bool l9_152=l9_103;
float l9_153=l9_104;
if ((l9_151==0)||(l9_151==3))
{
float l9_154=l9_150;
float l9_155=0.0;
float l9_156=1.0;
bool l9_157=l9_152;
float l9_158=l9_153;
float l9_159=fast::clamp(l9_154,l9_155,l9_156);
float l9_160=step(abs(l9_154-l9_159),9.9999997e-06);
l9_158*=(l9_160+((1.0-float(l9_157))*(1.0-l9_160)));
l9_154=l9_159;
l9_150=l9_154;
l9_153=l9_158;
}
param_17.y=l9_150;
l9_104=l9_153;
float2 l9_161=param_17;
int l9_162=param_15;
int l9_163=param_16;
float l9_164=param_25;
float2 l9_165=l9_161;
int l9_166=l9_162;
int l9_167=l9_163;
float3 l9_168=float3(0.0);
if (l9_166==0)
{
l9_168=float3(l9_165,0.0);
}
else
{
if (l9_166==1)
{
l9_168=float3(l9_165.x,(l9_165.y*0.5)+(0.5-(float(l9_167)*0.5)),0.0);
}
else
{
l9_168=float3(l9_165,float(l9_167));
}
}
float3 l9_169=l9_168;
float3 l9_170=l9_169;
float2 l9_171=l9_170.xy;
float l9_172=l9_164;
float4 l9_173=sc_set2.additional_settings_btn_refl_tex.sample(sc_set2.additional_settings_btn_refl_texSmpSC,l9_171,bias(l9_172));
float4 l9_174=l9_173;
float4 l9_175=l9_174;
if (param_23)
{
l9_175=mix(param_24,l9_175,float4(l9_104));
}
float4 l9_176=l9_175;
Color_N74=l9_176;
float4 Output_N75=float4(0.0);
Output_N75=float4(Value_N62)*Color_N74;
float4 Export_N76=float4(0.0);
Export_N76=Output_N75;
float4 Output_N5=float4(0.0);
Output_N5=mix(Export_N59,Export_N76,float4((*sc_set2.UserUniforms).Port_Input2_N005));
float2 UVCoord_N8=float2(0.0);
UVCoord_N8=Globals.Surface_UVCoord0;
float2 Output_N9=float2(0.0);
Output_N9=(UVCoord_N8*(*sc_set2.UserUniforms).Port_Input1_N009)+(*sc_set2.UserUniforms).Port_Input2_N009;
float Output_N10=0.0;
Output_N10=length(Output_N9);
float4 Value_N3=float4(0.0);
float param_26=Output_N10;
float4 param_27=(*sc_set2.UserUniforms).Port_Value0_N003;
float param_28=(*sc_set2.UserUniforms).Port_Position1_N003;
float4 param_29=(*sc_set2.UserUniforms).Port_Value1_N003;
float param_30=(*sc_set2.UserUniforms).Port_Position2_N003;
float4 param_31=(*sc_set2.UserUniforms).Port_Value2_N003;
float param_32=(*sc_set2.UserUniforms).Port_Position3_N003;
float4 param_33=(*sc_set2.UserUniforms).Port_Value3_N003;
float4 param_34=(*sc_set2.UserUniforms).Port_Value4_N003;
param_26=fast::clamp(param_26,0.0,1.0);
float4 param_35;
if (param_26<param_28)
{
param_35=mix(param_27,param_29,float4(fast::clamp(param_26/param_28,0.0,1.0)));
}
else
{
if (param_26<param_30)
{
param_35=mix(param_29,param_31,float4(fast::clamp((param_26-param_28)/(param_30-param_28),0.0,1.0)));
}
else
{
if (param_26<param_32)
{
param_35=mix(param_31,param_33,float4(fast::clamp((param_26-param_30)/(param_32-param_30),0.0,1.0)));
}
else
{
param_35=mix(param_33,param_34,float4(fast::clamp((param_26-param_32)/(1.0-param_32),0.0,1.0)));
}
}
}
bool l9_177=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_178;
if (l9_177)
{
l9_178=!PreviewInfo.Saved;
}
else
{
l9_178=l9_177;
}
bool l9_179;
if (l9_178)
{
l9_179=3==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_179=l9_178;
}
if (l9_179)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=param_35;
PreviewInfo.Color.w=1.0;
}
Value_N3=param_35;
float4 Output_N100=float4(0.0);
Output_N100=Output_N5+Value_N3;
float2 UVCoord_N12=float2(0.0);
UVCoord_N12=Globals.Surface_UVCoord1;
float2 CoordsOut_N2=float2(0.0);
CoordsOut_N2=((UVCoord_N12-(*sc_set2.UserUniforms).Port_Center_N002)*(*sc_set2.UserUniforms).Port_Scale_N002)+(*sc_set2.UserUniforms).Port_Center_N002;
float4 Color_N30=float4(0.0);
int l9_180=0;
if ((int(iconHasSwappedViews_tmp)!=0))
{
int l9_181=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_181=0;
}
else
{
l9_181=in.varStereoViewID;
}
int l9_182=l9_181;
l9_180=1-l9_182;
}
else
{
int l9_183=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_183=0;
}
else
{
l9_183=in.varStereoViewID;
}
int l9_184=l9_183;
l9_180=l9_184;
}
int l9_185=l9_180;
int param_36=iconLayout_tmp;
int param_37=l9_185;
float2 param_38=CoordsOut_N2;
bool param_39=(int(SC_USE_UV_TRANSFORM_icon_tmp)!=0);
float3x3 param_40=(*sc_set2.UserUniforms).iconTransform;
int2 param_41=int2(SC_SOFTWARE_WRAP_MODE_U_icon_tmp,SC_SOFTWARE_WRAP_MODE_V_icon_tmp);
bool param_42=(int(SC_USE_UV_MIN_MAX_icon_tmp)!=0);
float4 param_43=(*sc_set2.UserUniforms).iconUvMinMax;
bool param_44=(int(SC_USE_CLAMP_TO_BORDER_icon_tmp)!=0);
float4 param_45=(*sc_set2.UserUniforms).iconBorderColor;
float param_46=0.0;
bool l9_186=param_44&&(!param_42);
float l9_187=1.0;
float l9_188=param_38.x;
int l9_189=param_41.x;
if (l9_189==1)
{
l9_188=fract(l9_188);
}
else
{
if (l9_189==2)
{
float l9_190=fract(l9_188);
float l9_191=l9_188-l9_190;
float l9_192=step(0.25,fract(l9_191*0.5));
l9_188=mix(l9_190,1.0-l9_190,fast::clamp(l9_192,0.0,1.0));
}
}
param_38.x=l9_188;
float l9_193=param_38.y;
int l9_194=param_41.y;
if (l9_194==1)
{
l9_193=fract(l9_193);
}
else
{
if (l9_194==2)
{
float l9_195=fract(l9_193);
float l9_196=l9_193-l9_195;
float l9_197=step(0.25,fract(l9_196*0.5));
l9_193=mix(l9_195,1.0-l9_195,fast::clamp(l9_197,0.0,1.0));
}
}
param_38.y=l9_193;
if (param_42)
{
bool l9_198=param_44;
bool l9_199;
if (l9_198)
{
l9_199=param_41.x==3;
}
else
{
l9_199=l9_198;
}
float l9_200=param_38.x;
float l9_201=param_43.x;
float l9_202=param_43.z;
bool l9_203=l9_199;
float l9_204=l9_187;
float l9_205=fast::clamp(l9_200,l9_201,l9_202);
float l9_206=step(abs(l9_200-l9_205),9.9999997e-06);
l9_204*=(l9_206+((1.0-float(l9_203))*(1.0-l9_206)));
l9_200=l9_205;
param_38.x=l9_200;
l9_187=l9_204;
bool l9_207=param_44;
bool l9_208;
if (l9_207)
{
l9_208=param_41.y==3;
}
else
{
l9_208=l9_207;
}
float l9_209=param_38.y;
float l9_210=param_43.y;
float l9_211=param_43.w;
bool l9_212=l9_208;
float l9_213=l9_187;
float l9_214=fast::clamp(l9_209,l9_210,l9_211);
float l9_215=step(abs(l9_209-l9_214),9.9999997e-06);
l9_213*=(l9_215+((1.0-float(l9_212))*(1.0-l9_215)));
l9_209=l9_214;
param_38.y=l9_209;
l9_187=l9_213;
}
float2 l9_216=param_38;
bool l9_217=param_39;
float3x3 l9_218=param_40;
if (l9_217)
{
l9_216=float2((l9_218*float3(l9_216,1.0)).xy);
}
float2 l9_219=l9_216;
float2 l9_220=l9_219;
float2 l9_221=l9_220;
param_38=l9_221;
float l9_222=param_38.x;
int l9_223=param_41.x;
bool l9_224=l9_186;
float l9_225=l9_187;
if ((l9_223==0)||(l9_223==3))
{
float l9_226=l9_222;
float l9_227=0.0;
float l9_228=1.0;
bool l9_229=l9_224;
float l9_230=l9_225;
float l9_231=fast::clamp(l9_226,l9_227,l9_228);
float l9_232=step(abs(l9_226-l9_231),9.9999997e-06);
l9_230*=(l9_232+((1.0-float(l9_229))*(1.0-l9_232)));
l9_226=l9_231;
l9_222=l9_226;
l9_225=l9_230;
}
param_38.x=l9_222;
l9_187=l9_225;
float l9_233=param_38.y;
int l9_234=param_41.y;
bool l9_235=l9_186;
float l9_236=l9_187;
if ((l9_234==0)||(l9_234==3))
{
float l9_237=l9_233;
float l9_238=0.0;
float l9_239=1.0;
bool l9_240=l9_235;
float l9_241=l9_236;
float l9_242=fast::clamp(l9_237,l9_238,l9_239);
float l9_243=step(abs(l9_237-l9_242),9.9999997e-06);
l9_241*=(l9_243+((1.0-float(l9_240))*(1.0-l9_243)));
l9_237=l9_242;
l9_233=l9_237;
l9_236=l9_241;
}
param_38.y=l9_233;
l9_187=l9_236;
float2 l9_244=param_38;
int l9_245=param_36;
int l9_246=param_37;
float l9_247=param_46;
float2 l9_248=l9_244;
int l9_249=l9_245;
int l9_250=l9_246;
float3 l9_251=float3(0.0);
if (l9_249==0)
{
l9_251=float3(l9_248,0.0);
}
else
{
if (l9_249==1)
{
l9_251=float3(l9_248.x,(l9_248.y*0.5)+(0.5-(float(l9_250)*0.5)),0.0);
}
else
{
l9_251=float3(l9_248,float(l9_250));
}
}
float3 l9_252=l9_251;
float3 l9_253=l9_252;
float2 l9_254=l9_253.xy;
float l9_255=l9_247;
float4 l9_256=sc_set2.icon.sample(sc_set2.iconSmpSC,l9_254,bias(l9_255));
float4 l9_257=l9_256;
float4 l9_258=l9_257;
if (param_44)
{
l9_258=mix(param_45,l9_258,float4(l9_187));
}
float4 l9_259=l9_258;
Color_N30=l9_259;
float Output_N7=0.0;
float param_47=1.0;
float param_48=1.0;
float param_49=(*sc_set2.UserUniforms).Port_Input2_N007;
ssGlobals param_51=Globals;
float l9_260=0.0;
float l9_261=float((*sc_set2.UserUniforms).iconEnabled!=0);
l9_260=l9_261;
param_47=l9_260;
float param_50;
if ((param_47*1.0)!=0.0)
{
float2 l9_262=float2(0.0);
l9_262=param_51.Surface_UVCoord1;
float2 l9_263=float2(0.0);
l9_263=((l9_262-(*sc_set2.UserUniforms).Port_Center_N002)*(*sc_set2.UserUniforms).Port_Scale_N002)+(*sc_set2.UserUniforms).Port_Center_N002;
float4 l9_264=float4(0.0);
int l9_265=0;
if ((int(iconHasSwappedViews_tmp)!=0))
{
int l9_266=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_266=0;
}
else
{
l9_266=in.varStereoViewID;
}
int l9_267=l9_266;
l9_265=1-l9_267;
}
else
{
int l9_268=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_268=0;
}
else
{
l9_268=in.varStereoViewID;
}
int l9_269=l9_268;
l9_265=l9_269;
}
int l9_270=l9_265;
int l9_271=iconLayout_tmp;
int l9_272=l9_270;
float2 l9_273=l9_263;
bool l9_274=(int(SC_USE_UV_TRANSFORM_icon_tmp)!=0);
float3x3 l9_275=(*sc_set2.UserUniforms).iconTransform;
int2 l9_276=int2(SC_SOFTWARE_WRAP_MODE_U_icon_tmp,SC_SOFTWARE_WRAP_MODE_V_icon_tmp);
bool l9_277=(int(SC_USE_UV_MIN_MAX_icon_tmp)!=0);
float4 l9_278=(*sc_set2.UserUniforms).iconUvMinMax;
bool l9_279=(int(SC_USE_CLAMP_TO_BORDER_icon_tmp)!=0);
float4 l9_280=(*sc_set2.UserUniforms).iconBorderColor;
float l9_281=0.0;
bool l9_282=l9_279&&(!l9_277);
float l9_283=1.0;
float l9_284=l9_273.x;
int l9_285=l9_276.x;
if (l9_285==1)
{
l9_284=fract(l9_284);
}
else
{
if (l9_285==2)
{
float l9_286=fract(l9_284);
float l9_287=l9_284-l9_286;
float l9_288=step(0.25,fract(l9_287*0.5));
l9_284=mix(l9_286,1.0-l9_286,fast::clamp(l9_288,0.0,1.0));
}
}
l9_273.x=l9_284;
float l9_289=l9_273.y;
int l9_290=l9_276.y;
if (l9_290==1)
{
l9_289=fract(l9_289);
}
else
{
if (l9_290==2)
{
float l9_291=fract(l9_289);
float l9_292=l9_289-l9_291;
float l9_293=step(0.25,fract(l9_292*0.5));
l9_289=mix(l9_291,1.0-l9_291,fast::clamp(l9_293,0.0,1.0));
}
}
l9_273.y=l9_289;
if (l9_277)
{
bool l9_294=l9_279;
bool l9_295;
if (l9_294)
{
l9_295=l9_276.x==3;
}
else
{
l9_295=l9_294;
}
float l9_296=l9_273.x;
float l9_297=l9_278.x;
float l9_298=l9_278.z;
bool l9_299=l9_295;
float l9_300=l9_283;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_273.x=l9_296;
l9_283=l9_300;
bool l9_303=l9_279;
bool l9_304;
if (l9_303)
{
l9_304=l9_276.y==3;
}
else
{
l9_304=l9_303;
}
float l9_305=l9_273.y;
float l9_306=l9_278.y;
float l9_307=l9_278.w;
bool l9_308=l9_304;
float l9_309=l9_283;
float l9_310=fast::clamp(l9_305,l9_306,l9_307);
float l9_311=step(abs(l9_305-l9_310),9.9999997e-06);
l9_309*=(l9_311+((1.0-float(l9_308))*(1.0-l9_311)));
l9_305=l9_310;
l9_273.y=l9_305;
l9_283=l9_309;
}
float2 l9_312=l9_273;
bool l9_313=l9_274;
float3x3 l9_314=l9_275;
if (l9_313)
{
l9_312=float2((l9_314*float3(l9_312,1.0)).xy);
}
float2 l9_315=l9_312;
float2 l9_316=l9_315;
float2 l9_317=l9_316;
l9_273=l9_317;
float l9_318=l9_273.x;
int l9_319=l9_276.x;
bool l9_320=l9_282;
float l9_321=l9_283;
if ((l9_319==0)||(l9_319==3))
{
float l9_322=l9_318;
float l9_323=0.0;
float l9_324=1.0;
bool l9_325=l9_320;
float l9_326=l9_321;
float l9_327=fast::clamp(l9_322,l9_323,l9_324);
float l9_328=step(abs(l9_322-l9_327),9.9999997e-06);
l9_326*=(l9_328+((1.0-float(l9_325))*(1.0-l9_328)));
l9_322=l9_327;
l9_318=l9_322;
l9_321=l9_326;
}
l9_273.x=l9_318;
l9_283=l9_321;
float l9_329=l9_273.y;
int l9_330=l9_276.y;
bool l9_331=l9_282;
float l9_332=l9_283;
if ((l9_330==0)||(l9_330==3))
{
float l9_333=l9_329;
float l9_334=0.0;
float l9_335=1.0;
bool l9_336=l9_331;
float l9_337=l9_332;
float l9_338=fast::clamp(l9_333,l9_334,l9_335);
float l9_339=step(abs(l9_333-l9_338),9.9999997e-06);
l9_337*=(l9_339+((1.0-float(l9_336))*(1.0-l9_339)));
l9_333=l9_338;
l9_329=l9_333;
l9_332=l9_337;
}
l9_273.y=l9_329;
l9_283=l9_332;
float2 l9_340=l9_273;
int l9_341=l9_271;
int l9_342=l9_272;
float l9_343=l9_281;
float2 l9_344=l9_340;
int l9_345=l9_341;
int l9_346=l9_342;
float3 l9_347=float3(0.0);
if (l9_345==0)
{
l9_347=float3(l9_344,0.0);
}
else
{
if (l9_345==1)
{
l9_347=float3(l9_344.x,(l9_344.y*0.5)+(0.5-(float(l9_346)*0.5)),0.0);
}
else
{
l9_347=float3(l9_344,float(l9_346));
}
}
float3 l9_348=l9_347;
float3 l9_349=l9_348;
float2 l9_350=l9_349.xy;
float l9_351=l9_343;
float4 l9_352=sc_set2.icon.sample(sc_set2.iconSmpSC,l9_350,bias(l9_351));
float4 l9_353=l9_352;
float4 l9_354=l9_353;
if (l9_279)
{
l9_354=mix(l9_280,l9_354,float4(l9_283));
}
float4 l9_355=l9_354;
l9_264=l9_355;
float l9_356=0.0;
float4 l9_357=l9_264;
float l9_358=l9_357.w;
l9_356=l9_358;
param_48=l9_356;
param_50=param_48;
}
else
{
param_50=param_49;
}
Output_N7=param_50;
float4 Output_N11=float4(0.0);
Output_N11=mix(Output_N100,Color_N30,float4(Output_N7));
FinalColor=Output_N11;
float param_52=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_52<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_359=gl_FragCoord;
float2 l9_360=floor(mod(l9_359.xy,float2(4.0)));
float l9_361=(mod(dot(l9_360,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_52<l9_361)
{
discard_fragment();
}
}
bool l9_362=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_362)
{
float4 param_53=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_53.w=1.0;
}
float4 l9_363=fast::max(param_53,float4(0.0));
float4 param_54=l9_363;
out.FragColor0=param_54;
return out;
}
float4 param_55=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_364=param_55;
float4 l9_365=l9_364;
float l9_366=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_366=l9_365.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_366=fast::clamp(l9_365.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_366=fast::clamp(dot(l9_365.xyz,float3(l9_365.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_366=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_366=(1.0-dot(l9_365.xyz,float3(0.33333001)))*l9_365.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_366=(1.0-fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0))*l9_365.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_366=fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0)*l9_365.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_366=fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_366=fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0)*l9_365.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_366=dot(l9_365.xyz,float3(0.33333001))*l9_365.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_366=1.0-fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_366=fast::clamp(dot(l9_365.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_367=l9_366;
float l9_368=l9_367;
float l9_369=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_368;
float3 l9_370=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_364.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_371=float4(l9_370.x,l9_370.y,l9_370.z,l9_369);
param_55=l9_371;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_55=float4(param_55.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_372=param_55;
float4 l9_373=float4(0.0);
float4 l9_374=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_375=out.FragColor0;
float4 l9_376=l9_375;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_376.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_377=l9_376;
l9_374=l9_377;
}
else
{
float4 l9_378=gl_FragCoord;
float2 l9_379=(l9_378.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_380=l9_379;
float2 l9_381=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_382=1;
int l9_383=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_383=0;
}
else
{
l9_383=in.varStereoViewID;
}
int l9_384=l9_383;
int l9_385=l9_384;
float3 l9_386=float3(l9_380,0.0);
int l9_387=l9_382;
int l9_388=l9_385;
if (l9_387==1)
{
l9_386.y=((2.0*l9_386.y)+float(l9_388))-1.0;
}
float2 l9_389=l9_386.xy;
l9_381=l9_389;
}
else
{
l9_381=l9_380;
}
float2 l9_390=l9_381;
float2 l9_391=l9_390;
float2 l9_392=l9_391;
int l9_393=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_394=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_394=0;
}
else
{
l9_394=in.varStereoViewID;
}
int l9_395=l9_394;
l9_393=1-l9_395;
}
else
{
int l9_396=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_396=0;
}
else
{
l9_396=in.varStereoViewID;
}
int l9_397=l9_396;
l9_393=l9_397;
}
int l9_398=l9_393;
float2 l9_399=l9_392;
int l9_400=l9_398;
float2 l9_401=l9_399;
int l9_402=l9_400;
float l9_403=0.0;
float4 l9_404=float4(0.0);
float2 l9_405=l9_401;
int l9_406=sc_ScreenTextureLayout_tmp;
int l9_407=l9_402;
float l9_408=l9_403;
float2 l9_409=l9_405;
int l9_410=l9_406;
int l9_411=l9_407;
float3 l9_412=float3(0.0);
if (l9_410==0)
{
l9_412=float3(l9_409,0.0);
}
else
{
if (l9_410==1)
{
l9_412=float3(l9_409.x,(l9_409.y*0.5)+(0.5-(float(l9_411)*0.5)),0.0);
}
else
{
l9_412=float3(l9_409,float(l9_411));
}
}
float3 l9_413=l9_412;
float3 l9_414=l9_413;
float2 l9_415=l9_414.xy;
float l9_416=l9_408;
float4 l9_417=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_415,bias(l9_416));
float4 l9_418=l9_417;
l9_404=l9_418;
float4 l9_419=l9_404;
float4 l9_420=l9_419;
float4 l9_421=l9_420;
l9_374=l9_421;
}
float4 l9_422=l9_374;
float4 l9_423=l9_422;
float3 l9_424=l9_423.xyz;
float3 l9_425=l9_424;
float3 l9_426=l9_372.xyz;
float3 l9_427=definedBlend(l9_425,l9_426,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
l9_373=float4(l9_427.x,l9_427.y,l9_427.z,l9_373.w);
float3 l9_428=mix(l9_424,l9_373.xyz,float3(l9_372.w));
l9_373=float4(l9_428.x,l9_428.y,l9_428.z,l9_373.w);
l9_373.w=1.0;
float4 l9_429=l9_373;
param_55=l9_429;
}
else
{
float4 l9_430=param_55;
float4 l9_431=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_431=float4(mix(float3(1.0),l9_430.xyz,float3(l9_430.w)),l9_430.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_432=l9_430.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_432=fast::clamp(l9_432,0.0,1.0);
}
l9_431=float4(l9_430.xyz*l9_432,l9_432);
}
else
{
l9_431=l9_430;
}
}
float4 l9_433=l9_431;
param_55=l9_433;
}
}
}
float4 l9_434=param_55;
FinalColor=l9_434;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_435=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_435=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_435=float4(0.0);
}
float4 l9_436=l9_435;
float4 Cost=l9_436;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_56=in.varPos;
float4 param_57=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_56,param_57,in.varStereoViewID,(*sc_set2.UserUniforms));
float4 param_58=FinalColor;
float4 l9_437=param_58;
out.FragColor0=l9_437;
return out;
}
} // FRAGMENT SHADER