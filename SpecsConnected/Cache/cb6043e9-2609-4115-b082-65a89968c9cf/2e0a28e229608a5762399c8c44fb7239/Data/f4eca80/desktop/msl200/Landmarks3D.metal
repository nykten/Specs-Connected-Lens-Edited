#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING
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
//attribute float spritetimestamp 19
//attribute float spriteindex 20
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler intensityTextureSmpSC 2:20
//sampler sampler sc_EnvmapDiffuseSmpSC 2:21
//sampler sampler sc_EnvmapSpecularSmpSC 2:22
//sampler sampler sc_RayTracedAoTextureSmpSC 2:24
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 2:25
//sampler sampler sc_RayTracedReflectionTextureSmpSC 2:26
//sampler sampler sc_RayTracedShadowTextureSmpSC 2:27
//sampler sampler sc_SSAOTextureSmpSC 2:28
//sampler sampler sc_ScreenTextureSmpSC 2:29
//sampler sampler sc_ShadowTextureSmpSC 2:30
//texture texture2D intensityTexture 2:1:2:20
//texture texture2D sc_EnvmapDiffuse 2:2:2:21
//texture texture2D sc_EnvmapSpecular 2:3:2:22
//texture texture2D sc_RayTracedAoTexture 2:12:2:24
//texture texture2D sc_RayTracedDiffIndTexture 2:13:2:25
//texture texture2D sc_RayTracedReflectionTexture 2:14:2:26
//texture texture2D sc_RayTracedShadowTexture 2:15:2:27
//texture texture2D sc_SSAOTexture 2:16:2:28
//texture texture2D sc_ScreenTexture 2:17:2:29
//texture texture2D sc_ShadowTexture 2:18:2:30
//ubo float sc_BonesUBO 2:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 2:32:4432 {
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
//bool receivesRayTracedReflections 3808
//bool receivesRayTracedShadows 3812
//bool receivesRayTracedDiffuseIndirect 3816
//bool receivesRayTracedAo 3820
//float4 sc_RayTracedReflectionTextureSize 3824
//float4 sc_RayTracedReflectionTextureDims 3840
//float4 sc_RayTracedReflectionTextureView 3856
//float4 sc_RayTracedShadowTextureSize 3872
//float4 sc_RayTracedShadowTextureDims 3888
//float4 sc_RayTracedShadowTextureView 3904
//float4 sc_RayTracedDiffIndTextureSize 3920
//float4 sc_RayTracedDiffIndTextureDims 3936
//float4 sc_RayTracedDiffIndTextureView 3952
//float4 sc_RayTracedAoTextureSize 3968
//float4 sc_RayTracedAoTextureDims 3984
//float4 sc_RayTracedAoTextureView 4000
//float receiver_mask 4016
//float3 OriginNormalizationScale 4032
//float3 OriginNormalizationScaleInv 4048
//float3 OriginNormalizationOffset 4064
//int receiverId 4080
//float correctedIntensity 4084
//float4 intensityTextureSize 4096
//float4 intensityTextureDims 4112
//float4 intensityTextureView 4128
//float3x3 intensityTextureTransform 4144
//float4 intensityTextureUvMinMax 4192
//float4 intensityTextureBorderColor 4208
//float reflBlurWidth 4224
//float reflBlurMinRough 4228
//float reflBlurMaxRough 4232
//int overrideTimeEnabled 4236
//float overrideTimeElapsed 4240
//float overrideTimeDelta 4244
//int PreviewEnabled 4248
//int PreviewNodeID 4252
//float alphaTestThreshold 4256
//float4 baseColor 4272
//float Port_Value_N044 4288
//float Port_Multiplier_N086 4292
//float Port_Value_N073 4296
//float Port_Scale_N083 4300
//float Port_RangeMinB_N085 4304
//float Port_RangeMaxB_N085 4308
//float Port_Input1_N045 4312
//float Port_Input1_N046 4316
//float2 Port_Input1_N041 4320
//float2 Port_Input1_N099 4328
//float Port_Value2_N100 4336
//float Port_Opacity_N000 4340
//float3 Port_Emissive_N000 4352
//float Port_Value_N001 4368
//float Port_Value_N002 4372
//float3 Port_AO_N000 4384
//float3 Port_SpecularAO_N000 4400
//float Port_Input1_N105 4416
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1031
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1032
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1033
//spec_const bool UseViewSpaceDepthVariant 1034
//spec_const bool intensityTextureHasSwappedViews 1035
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1036
//spec_const bool sc_BlendMode_Add 1037
//spec_const bool sc_BlendMode_AlphaTest 1038
//spec_const bool sc_BlendMode_AlphaToCoverage 1039
//spec_const bool sc_BlendMode_ColoredGlass 1040
//spec_const bool sc_BlendMode_Custom 1041
//spec_const bool sc_BlendMode_Max 1042
//spec_const bool sc_BlendMode_Min 1043
//spec_const bool sc_BlendMode_MultiplyOriginal 1044
//spec_const bool sc_BlendMode_Multiply 1045
//spec_const bool sc_BlendMode_Normal 1046
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1047
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1048
//spec_const bool sc_BlendMode_PremultipliedAlpha 1049
//spec_const bool sc_BlendMode_Screen 1050
//spec_const bool sc_DepthOnly 1051
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1052
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1053
//spec_const bool sc_FramebufferFetch 1054
//spec_const bool sc_HasDiffuseEnvmap 1055
//spec_const bool sc_LightEstimation 1056
//spec_const bool sc_MotionVectorsPass 1057
//spec_const bool sc_OITCompositingPass 1058
//spec_const bool sc_OITDepthBoundsPass 1059
//spec_const bool sc_OITDepthGatherPass 1060
//spec_const bool sc_ProjectiveShadowsCaster 1061
//spec_const bool sc_ProjectiveShadowsReceiver 1062
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 1063
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 1064
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 1065
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 1066
//spec_const bool sc_RenderAlphaToColor 1067
//spec_const bool sc_SSAOEnabled 1068
//spec_const bool sc_ScreenTextureHasSwappedViews 1069
//spec_const bool sc_ShaderComplexityAnalyzer 1070
//spec_const bool sc_UseFramebufferFetchMarker 1071
//spec_const bool sc_VertexBlendingUseNormals 1072
//spec_const bool sc_VertexBlending 1073
//spec_const int SC_DEVICE_CLASS 1074
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1075
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1076
//spec_const int intensityTextureLayout 1077
//spec_const int sc_AmbientLightMode0 1078
//spec_const int sc_AmbientLightMode1 1079
//spec_const int sc_AmbientLightMode2 1080
//spec_const int sc_AmbientLightMode_Constant 1081
//spec_const int sc_AmbientLightMode_EnvironmentMap 1082
//spec_const int sc_AmbientLightMode_FromCamera 1083
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1084
//spec_const int sc_AmbientLightsCount 1085
//spec_const int sc_DepthBufferMode 1086
//spec_const int sc_DirectionalLightsCount 1087
//spec_const int sc_EnvLightMode 1088
//spec_const int sc_EnvmapDiffuseLayout 1089
//spec_const int sc_EnvmapSpecularLayout 1090
//spec_const int sc_LightEstimationSGCount 1091
//spec_const int sc_MaxTextureImageUnits 1092
//spec_const int sc_PointLightsCount 1093
//spec_const int sc_RayTracedAoTextureLayout 1094
//spec_const int sc_RayTracedDiffIndTextureLayout 1095
//spec_const int sc_RayTracedReflectionTextureLayout 1096
//spec_const int sc_RayTracedShadowTextureLayout 1097
//spec_const int sc_RenderingSpace 1098
//spec_const int sc_ScreenTextureLayout 1099
//spec_const int sc_SkinBonesCount 1100
//spec_const int sc_StereoRenderingMode 1101
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1102
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
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1031)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1032)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1033)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1034)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(1035)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1036)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1037)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1038)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1039)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1040)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1041)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1042)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1043)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1044)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1045)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1046)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1047)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1048)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1049)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1050)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1051)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1052)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1053)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1054)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1055)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1056)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(1057)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1058)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1059)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1060)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1061)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1062)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(1063)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(1064)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(1065)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(1066)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(1067)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1068)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
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
constant int SC_DEVICE_CLASS [[function_constant(1074)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1075)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1076)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int intensityTextureLayout [[function_constant(1077)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1078)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1079)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1080)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1081)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1082)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1083)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1084)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1085)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1086)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1087)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1088)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1089)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1090)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1091)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1092)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1093)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(1094)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(1095)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(1096)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(1097)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(1098)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1099)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1100)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1101)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1102)]];
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float3 SurfacePosition_ObjectSpace;
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
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
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
float4 baseColor;
float Port_Value_N044;
float Port_Multiplier_N086;
float Port_Value_N073;
float Port_Scale_N083;
float Port_RangeMinB_N085;
float Port_RangeMaxB_N085;
float Port_Input1_N045;
float Port_Input1_N046;
float2 Port_Input1_N041;
float2 Port_Input1_N099;
float Port_Value2_N100;
float Port_Opacity_N000;
float3 Port_Emissive_N000;
float Port_Value_N001;
float Port_Value_N002;
float3 Port_AO_N000;
float3 Port_SpecularAO_N000;
float Port_Input1_N105;
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
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracedAoTexture [[id(12)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(13)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(14)]];
texture2d<float> sc_RayTracedShadowTexture [[id(15)]];
texture2d<float> sc_SSAOTexture [[id(16)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<float> sc_ShadowTexture [[id(18)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler sc_EnvmapDiffuseSmpSC [[id(21)]];
sampler sc_EnvmapSpecularSmpSC [[id(22)]];
sampler sc_RayTracedAoTextureSmpSC [[id(24)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(25)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(26)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(27)]];
sampler sc_SSAOTextureSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(29)]];
sampler sc_ShadowTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(32)]];
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
float spritetimestamp [[attribute(19)]];
float spriteindex [[attribute(20)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set2.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set2.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set2.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set2.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set2.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set2.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=0;
int l9_56=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_56=int(in.boneData[l9_55]);
}
int l9_57=l9_56;
int l9_58=l9_57;
int l9_59=1;
int l9_60=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_60=int(in.boneData[l9_59]);
}
int l9_61=l9_60;
int l9_62=l9_61;
int l9_63=2;
int l9_64=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_64=int(in.boneData[l9_63]);
}
int l9_65=l9_64;
int l9_66=l9_65;
int l9_67=3;
int l9_68=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_68=int(in.boneData[l9_67]);
}
int l9_69=l9_68;
int l9_70=l9_69;
int l9_71=l9_58;
float4 l9_72=l9_51.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_54.x;
int l9_82=l9_62;
float4 l9_83=l9_51.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_54.y;
int l9_93=l9_66;
float4 l9_94=l9_51.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=l9_101;
float l9_103=l9_54.z;
int l9_104=l9_70;
float4 l9_105=l9_51.position;
float3 l9_106=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_107=l9_104;
float4 l9_108=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[0];
float4 l9_109=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[1];
float4 l9_110=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[2];
float4 l9_111[3];
l9_111[0]=l9_108;
l9_111[1]=l9_109;
l9_111[2]=l9_110;
l9_106=float3(dot(l9_105,l9_111[0]),dot(l9_105,l9_111[1]),dot(l9_105,l9_111[2]));
}
else
{
l9_106=l9_105.xyz;
}
float3 l9_112=l9_106;
float3 l9_113=(((l9_80*l9_81)+(l9_91*l9_92))+(l9_102*l9_103))+(l9_112*l9_54.w);
l9_51.position=float4(l9_113.x,l9_113.y,l9_113.z,l9_51.position.w);
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
int l9_118=l9_62;
float3x3 l9_119=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[2].xyz));
float3x3 l9_120=l9_119;
float3x3 l9_121=l9_120;
int l9_122=l9_66;
float3x3 l9_123=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[2].xyz));
float3x3 l9_124=l9_123;
float3x3 l9_125=l9_124;
int l9_126=l9_70;
float3x3 l9_127=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[2].xyz));
float3x3 l9_128=l9_127;
float3x3 l9_129=l9_128;
l9_51.normal=((((l9_117*l9_51.normal)*l9_54.x)+((l9_121*l9_51.normal)*l9_54.y))+((l9_125*l9_51.normal)*l9_54.z))+((l9_129*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_117*l9_51.tangent)*l9_54.x)+((l9_121*l9_51.tangent)*l9_54.y))+((l9_125*l9_51.tangent)*l9_54.z))+((l9_129*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_130=(*sc_set2.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_130.x,l9_130.y,l9_130.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_131;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_131=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_131=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_131;
float l9_132;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_132=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_132=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_132;
Globals.Surface_UVCoord0=v.texture0;
Globals.SurfacePosition_ObjectSpace=((*sc_set2.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 Camera_Up_N75=float3(0.0);
int l9_133=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_133=0;
}
else
{
l9_133=gl_InstanceIndex%2;
}
int l9_134=l9_133;
Camera_Up_N75=normalize((*sc_set2.UserUniforms).sc_ViewMatrixInverseArray[l9_134][1].xyz);
float Output_N44=0.0;
float param_1=(*sc_set2.UserUniforms).Port_Value_N044;
float param_2=param_1+0.001;
param_2-=0.001;
Output_N44=param_2;
float Time_N86=0.0;
Time_N86=Globals.gTimeElapsed*(*sc_set2.UserUniforms).Port_Multiplier_N086;
float _Attribute_N72=0.0;
float param_3=in.spritetimestamp;
_Attribute_N72=param_3;
float Output_N73=0.0;
float param_4=(*sc_set2.UserUniforms).Port_Value_N073;
float param_5=param_4+0.001;
param_5-=0.001;
Output_N73=param_5;
float _Attribute_N57=0.0;
float param_6=in.spriteindex;
_Attribute_N57=param_6;
float Random_N83=0.0;
float param_7=_Attribute_N57;
float param_8=(*sc_set2.UserUniforms).Port_Scale_N083;
param_7=floor(param_7*10000.0)*9.9999997e-05;
float param_9=floor(param_7*param_8);
param_9=floor(param_9*10000.0)*9.9999997e-05;
param_9=sin(param_9);
param_9*=437.58499;
param_9=fract(param_9);
param_9=floor(param_9*10000.0)*9.9999997e-05;
Random_N83=param_9;
float Output_N84=0.0;
Output_N84=Output_N73*Random_N83;
float Output_N87=0.0;
Output_N87=_Attribute_N72+Output_N84;
float ValueOut_N85=0.0;
float param_10=Time_N86;
float param_12=_Attribute_N72;
float param_13=Output_N87;
float param_14=(*sc_set2.UserUniforms).Port_RangeMinB_N085;
float param_15=(*sc_set2.UserUniforms).Port_RangeMaxB_N085;
float param_11=(((param_10-param_12)/(param_13-param_12))*(param_15-param_14))+param_14;
float l9_135;
if (param_15>param_14)
{
l9_135=fast::clamp(param_11,param_14,param_15);
}
else
{
l9_135=fast::clamp(param_11,param_15,param_14);
}
param_11=l9_135;
ValueOut_N85=param_11;
float Output_N89=0.0;
Output_N89=Output_N44*ValueOut_N85;
float Output_N45=0.0;
Output_N45=Output_N89/(*sc_set2.UserUniforms).Port_Input1_N045;
float Output_N46=0.0;
Output_N46=Output_N45*(*sc_set2.UserUniforms).Port_Input1_N046;
float2 Output_N48=float2(0.0);
Output_N48=float2(Output_N46,Output_N46);
float2 UVCoord_N42=float2(0.0);
UVCoord_N42=Globals.Surface_UVCoord0;
float2 Output_N41=float2(0.0);
Output_N41=UVCoord_N42-(*sc_set2.UserUniforms).Port_Input1_N041;
float2 Output_N70=float2(0.0);
Output_N70=Output_N48*Output_N41;
float Output_N79=0.0;
Output_N79=Output_N70.y;
float3 Output_N76=float3(0.0);
Output_N76=Camera_Up_N75*float3(Output_N79);
float3 Camera_Right_N74=float3(0.0);
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
Camera_Right_N74=normalize((*sc_set2.UserUniforms).sc_ViewMatrixInverseArray[l9_137][0].xyz);
float Output_N78=0.0;
Output_N78=Output_N70.x;
float3 Output_N77=float3(0.0);
Output_N77=Camera_Right_N74*float3(Output_N78);
float3 Output_N80=float3(0.0);
Output_N80=Output_N76+Output_N77;
float3 Position_N47=float3(0.0);
Position_N47=Globals.SurfacePosition_ObjectSpace;
float3 Output_N81=float3(0.0);
Output_N81=Output_N80+Position_N47;
float3 VectorOut_N82=float3(0.0);
VectorOut_N82=((*sc_set2.UserUniforms).sc_ModelMatrix*float4(Output_N81,1.0)).xyz;
WorldPosition=VectorOut_N82;
float2 UVCoord_N42_1=float2(0.0);
UVCoord_N42_1=Globals.Surface_UVCoord0;
float2 Output_N41_1=float2(0.0);
Output_N41_1=UVCoord_N42_1-(*sc_set2.UserUniforms).Port_Input1_N041;
float2 Output_N99=float2(0.0);
Output_N99=Output_N41_1*(*sc_set2.UserUniforms).Port_Input1_N099;
float3 Value_N100=float3(0.0);
Value_N100=float3(Output_N99.x,Output_N99.y,Value_N100.z);
Value_N100.z=(*sc_set2.UserUniforms).Port_Value2_N100;
float3 Output_N101=float3(0.0);
float3 param_16=Value_N100;
float l9_138=dot(param_16,param_16);
float l9_139;
if (l9_138>0.0)
{
l9_139=1.0/sqrt(l9_138);
}
else
{
l9_139=0.0;
}
float l9_140=l9_139;
float3 param_17=param_16*l9_140;
Output_N101=param_17;
float3 VectorOut_N106=float3(0.0);
VectorOut_N106=((*sc_set2.UserUniforms).sc_ModelMatrix*float4(Output_N101,1.0)).xyz;
WorldNormal=VectorOut_N106;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_18=v;
float3 param_19=WorldPosition;
float3 param_20=WorldNormal;
float3 param_21=WorldTangent;
float4 param_22=v.position;
out.varPos=param_19;
out.varNormal=normalize(param_20);
float3 l9_141=normalize(param_21);
out.varTangent=float4(l9_141.x,l9_141.y,l9_141.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_142=param_18.position;
float4 l9_143=float4(0.0);
if (sc_RenderingSpace_tmp==3)
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
l9_143=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_145]*l9_142;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_146=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=gl_InstanceIndex%2;
}
int l9_147=l9_146;
l9_143=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_147]*l9_142;
}
else
{
if (sc_RenderingSpace_tmp==1)
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
l9_143=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_149]*l9_142;
}
else
{
l9_143=l9_142;
}
}
}
float4 l9_150=l9_143;
out.varViewSpaceDepth=-l9_150.z;
}
float4 l9_151=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_151=param_22;
}
else
{
if (sc_RenderingSpace_tmp==4)
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
l9_151=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_153]*param_18.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_154=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_154=0;
}
else
{
l9_154=gl_InstanceIndex%2;
}
int l9_155=l9_154;
l9_151=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_155]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=gl_InstanceIndex%2;
}
int l9_157=l9_156;
l9_151=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_157]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_18.texture0,param_18.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_158=param_18.position;
float4 l9_159=l9_158;
if (sc_RenderingSpace_tmp==1)
{
l9_159=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_158;
}
float4 l9_160=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_159;
float2 l9_161=((l9_160.xy/float2(l9_160.w))*0.5)+float2(0.5);
out.varShadowTex=l9_161;
}
float4 l9_162=l9_151;
if (sc_DepthBufferMode_tmp==1)
{
int l9_163=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_163=0;
}
else
{
l9_163=gl_InstanceIndex%2;
}
int l9_164=l9_163;
if ((*sc_set2.UserUniforms).sc_ProjectionMatrixArray[l9_164][2].w!=0.0)
{
float l9_165=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_162.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_162.w))*l9_165)-1.0)*l9_162.w;
}
}
float4 l9_166=l9_162;
l9_151=l9_166;
float4 l9_167=l9_151;
float4 l9_168=l9_167;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_169=l9_168;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_170=dot(l9_169,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_171=l9_170;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_171;
}
}
float4 l9_172=float4(l9_168.x,-l9_168.y,(l9_168.z*0.5)+(l9_168.w*0.5),l9_168.w);
out.gl_Position=l9_172;
v=param_18;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float2 Surface_UVCoord0;
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
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
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
float4 baseColor;
float Port_Value_N044;
float Port_Multiplier_N086;
float Port_Value_N073;
float Port_Scale_N083;
float Port_RangeMinB_N085;
float Port_RangeMaxB_N085;
float Port_Input1_N045;
float Port_Input1_N046;
float2 Port_Input1_N041;
float2 Port_Input1_N099;
float Port_Value2_N100;
float Port_Opacity_N000;
float3 Port_Emissive_N000;
float Port_Value_N001;
float Port_Value_N002;
float3 Port_AO_N000;
float3 Port_SpecularAO_N000;
float Port_Input1_N105;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracedAoTexture [[id(12)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(13)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(14)]];
texture2d<float> sc_RayTracedShadowTexture [[id(15)]];
texture2d<float> sc_SSAOTexture [[id(16)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<float> sc_ShadowTexture [[id(18)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler sc_EnvmapDiffuseSmpSC [[id(21)]];
sampler sc_EnvmapSpecularSmpSC [[id(22)]];
sampler sc_RayTracedAoTextureSmpSC [[id(24)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(25)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(26)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(27)]];
sampler sc_SSAOTextureSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(29)]];
sampler sc_ShadowTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(32)]];
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
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
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
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=(l9_1.xy*UserUniforms.sc_WindowToViewportTransform.xy)+UserUniforms.sc_WindowToViewportTransform.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
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
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=(l9_1.xy*UserUniforms.sc_WindowToViewportTransform.xy)+UserUniforms.sc_WindowToViewportTransform.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
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
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedReflectionTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=(l9_1.xy*UserUniforms.sc_WindowToViewportTransform.xy)+UserUniforms.sc_WindowToViewportTransform.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
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
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
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
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float4 Output_N5=float4(0.0);
float4 param=(*sc_set2.UserUniforms).baseColor;
Output_N5=param;
float2 UVCoord_N42=float2(0.0);
UVCoord_N42=Globals.Surface_UVCoord0;
float2 Output_N41=float2(0.0);
Output_N41=UVCoord_N42-(*sc_set2.UserUniforms).Port_Input1_N041;
float2 Output_N99=float2(0.0);
Output_N99=Output_N41*(*sc_set2.UserUniforms).Port_Input1_N099;
float3 Value_N100=float3(0.0);
Value_N100=float3(Output_N99.x,Output_N99.y,Value_N100.z);
Value_N100.z=(*sc_set2.UserUniforms).Port_Value2_N100;
float3 Output_N101=float3(0.0);
float3 param_1=Value_N100;
float l9_2=dot(param_1,param_1);
float l9_3;
if (l9_2>0.0)
{
l9_3=1.0/sqrt(l9_2);
}
else
{
l9_3=0.0;
}
float l9_4=l9_3;
float3 param_2=param_1*l9_4;
Output_N101=param_2;
float3 VectorOut_N106=float3(0.0);
VectorOut_N106=((*sc_set2.UserUniforms).sc_ModelMatrix*float4(Output_N101,1.0)).xyz;
float Output_N1=0.0;
float param_3=(*sc_set2.UserUniforms).Port_Value_N001;
float param_4=param_3+0.001;
param_4-=0.001;
Output_N1=param_4;
float Output_N2=0.0;
float param_5=(*sc_set2.UserUniforms).Port_Value_N002;
float param_6=param_5+0.001;
param_6-=0.001;
Output_N2=param_6;
float4 Output_N0=float4(0.0);
float3 param_7=Output_N5.xyz;
float param_8=(*sc_set2.UserUniforms).Port_Opacity_N000;
float3 param_9=VectorOut_N106;
float3 param_10=(*sc_set2.UserUniforms).Port_Emissive_N000;
float param_11=Output_N1;
float param_12=Output_N2;
float3 param_13=(*sc_set2.UserUniforms).Port_AO_N000;
float3 param_14=(*sc_set2.UserUniforms).Port_SpecularAO_N000;
ssGlobals param_16=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_16.BumpedNormal=param_9;
}
float l9_5=param_8;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_5<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_6=gl_FragCoord;
float2 l9_7=floor(mod(l9_6.xy,float2(4.0)));
float l9_8=(mod(dot(l9_7,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_5<l9_8)
{
discard_fragment();
}
}
param_7=fast::max(param_7,float3(0.0));
float4 param_15;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_15=float4(param_7,param_8);
}
else
{
param_11=fast::clamp(param_11,0.0,1.0);
param_12=fast::clamp(param_12,0.0,1.0);
float3 l9_9=param_7;
float l9_10=param_8;
float3 l9_11=param_16.BumpedNormal;
float3 l9_12=param_16.PositionWS;
float3 l9_13=param_16.ViewDirWS;
float3 l9_14=param_10;
float l9_15=param_11;
float l9_16=param_12;
float3 l9_17=param_13;
float3 l9_18=param_14;
SurfaceProperties l9_19;
l9_19.albedo=float3(0.0);
l9_19.opacity=1.0;
l9_19.normal=float3(0.0);
l9_19.positionWS=float3(0.0);
l9_19.viewDirWS=float3(0.0);
l9_19.metallic=0.0;
l9_19.roughness=0.0;
l9_19.emissive=float3(0.0);
l9_19.ao=float3(1.0);
l9_19.specularAo=float3(1.0);
l9_19.bakedShadows=float3(1.0);
SurfaceProperties l9_20=l9_19;
SurfaceProperties l9_21=l9_20;
l9_21.opacity=l9_10;
float3 l9_22=l9_9;
float3 l9_23;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_23=float3(pow(l9_22.x,2.2),pow(l9_22.y,2.2),pow(l9_22.z,2.2));
}
else
{
l9_23=l9_22*l9_22;
}
float3 l9_24=l9_23;
l9_21.albedo=l9_24;
l9_21.normal=normalize(l9_11);
l9_21.positionWS=l9_12;
l9_21.viewDirWS=l9_13;
float3 l9_25=l9_14;
float3 l9_26;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_26=float3(pow(l9_25.x,2.2),pow(l9_25.y,2.2),pow(l9_25.z,2.2));
}
else
{
l9_26=l9_25*l9_25;
}
float3 l9_27=l9_26;
l9_21.emissive=l9_27;
l9_21.metallic=l9_15;
l9_21.roughness=l9_16;
l9_21.ao=l9_17;
l9_21.specularAo=l9_18;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_28=l9_21.positionWS;
l9_21.ao=evaluateSSAO(l9_28,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_29=l9_21;
SurfaceProperties l9_30=l9_29;
float3 l9_31=mix(float3(0.039999999),l9_30.albedo*l9_30.metallic,float3(l9_30.metallic));
float3 l9_32=mix(l9_30.albedo*(1.0-l9_30.metallic),float3(0.0),float3(l9_30.metallic));
l9_29.albedo=l9_32;
l9_29.specColor=l9_31;
SurfaceProperties l9_33=l9_29;
l9_21=l9_33;
SurfaceProperties l9_34=l9_21;
LightingComponents l9_35;
l9_35.directDiffuse=float3(0.0);
l9_35.directSpecular=float3(0.0);
l9_35.indirectDiffuse=float3(1.0);
l9_35.indirectSpecular=float3(0.0);
l9_35.emitted=float3(0.0);
l9_35.transmitted=float3(0.0);
LightingComponents l9_36=l9_35;
LightingComponents l9_37=l9_36;
float3 l9_38=l9_34.viewDirWS;
int l9_39=0;
float4 l9_40=float4(l9_34.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_41;
LightProperties l9_42;
int l9_43=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_43<sc_DirectionalLightsCount_tmp)
{
l9_41.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_43].direction;
l9_41.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_43].color;
l9_42.direction=l9_41.direction;
l9_42.color=l9_41.color.xyz;
l9_42.attenuation=l9_41.color.w;
l9_42.attenuation*=l9_40[(l9_39<3) ? l9_39 : 3];
l9_39++;
LightingComponents l9_44=l9_37;
LightProperties l9_45=l9_42;
SurfaceProperties l9_46=l9_34;
float3 l9_47=l9_38;
SurfaceProperties l9_48=l9_46;
float3 l9_49=l9_45.direction;
float l9_50=dot(l9_48.normal,l9_49);
float l9_51=fast::clamp(l9_50,0.0,1.0);
float3 l9_52=float3(l9_51);
l9_44.directDiffuse+=((l9_52*l9_45.color)*l9_45.attenuation);
SurfaceProperties l9_53=l9_46;
float3 l9_54=l9_45.direction;
float3 l9_55=l9_47;
l9_44.directSpecular+=((calculateDirectSpecular(l9_53,l9_54,l9_55)*l9_45.color)*l9_45.attenuation);
LightingComponents l9_56=l9_44;
l9_37=l9_56;
l9_43++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_57;
LightProperties l9_58;
int l9_59=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_59<sc_PointLightsCount_tmp)
{
l9_57.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_59].falloffEnabled!=0;
l9_57.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_59].falloffEndDistance;
l9_57.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_59].negRcpFalloffEndDistance4;
l9_57.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_59].angleScale;
l9_57.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_59].angleOffset;
l9_57.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_59].direction;
l9_57.position=(*sc_set2.UserUniforms).sc_PointLights[l9_59].position;
l9_57.color=(*sc_set2.UserUniforms).sc_PointLights[l9_59].color;
float3 l9_60=l9_57.position-l9_34.positionWS;
l9_58.direction=normalize(l9_60);
l9_58.color=l9_57.color.xyz;
l9_58.attenuation=l9_57.color.w;
l9_58.attenuation*=l9_40[(l9_39<3) ? l9_39 : 3];
float3 l9_61=l9_58.direction;
float3 l9_62=l9_57.direction;
float l9_63=l9_57.angleScale;
float l9_64=l9_57.angleOffset;
float l9_65=dot(l9_61,l9_62);
float l9_66=fast::clamp((l9_65*l9_63)+l9_64,0.0,1.0);
float l9_67=l9_66*l9_66;
l9_58.attenuation*=l9_67;
if (l9_57.falloffEnabled)
{
float l9_68=length(l9_60);
float l9_69=l9_57.falloffEndDistance;
l9_58.attenuation*=computeDistanceAttenuation(l9_68,l9_69);
}
l9_39++;
LightingComponents l9_70=l9_37;
LightProperties l9_71=l9_58;
SurfaceProperties l9_72=l9_34;
float3 l9_73=l9_38;
SurfaceProperties l9_74=l9_72;
float3 l9_75=l9_71.direction;
float l9_76=dot(l9_74.normal,l9_75);
float l9_77=fast::clamp(l9_76,0.0,1.0);
float3 l9_78=float3(l9_77);
l9_70.directDiffuse+=((l9_78*l9_71.color)*l9_71.attenuation);
SurfaceProperties l9_79=l9_72;
float3 l9_80=l9_71.direction;
float3 l9_81=l9_73;
l9_70.directSpecular+=((calculateDirectSpecular(l9_79,l9_80,l9_81)*l9_71.color)*l9_71.attenuation);
LightingComponents l9_82=l9_70;
l9_37=l9_82;
l9_59++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_83=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_84=abs(in.varShadowTex-float2(0.5));
float l9_85=fast::max(l9_84.x,l9_84.y);
float l9_86=step(l9_85,0.5);
float4 l9_87=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_86;
float3 l9_88=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_87.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_89=l9_87.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_83=mix(float3(1.0),l9_88,float3(l9_89));
}
else
{
l9_83=float3(1.0);
}
float3 l9_90=l9_83;
float3 l9_91=l9_90;
l9_37.directDiffuse*=l9_91;
l9_37.directSpecular*=l9_91;
}
bool l9_92=(*sc_set2.UserUniforms).receivesRayTracedShadows!=0;
if (l9_92)
{
float4 l9_93=gl_FragCoord;
float2 l9_94=(l9_93.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_95=l9_94;
float2 l9_96=l9_95;
int l9_97=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
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
float2 l9_103=l9_96;
int l9_104=l9_102;
float2 l9_105=l9_103;
int l9_106=l9_104;
float l9_107=0.0;
float4 l9_108=float4(0.0);
float2 l9_109=l9_105;
int l9_110=sc_RayTracedShadowTextureLayout_tmp;
int l9_111=l9_106;
float l9_112=l9_107;
float2 l9_113=l9_109;
int l9_114=l9_110;
int l9_115=l9_111;
float3 l9_116=float3(0.0);
if (l9_114==0)
{
l9_116=float3(l9_113,0.0);
}
else
{
if (l9_114==1)
{
l9_116=float3(l9_113.x,(l9_113.y*0.5)+(0.5-(float(l9_115)*0.5)),0.0);
}
else
{
l9_116=float3(l9_113,float(l9_115));
}
}
float3 l9_117=l9_116;
float3 l9_118=l9_117;
float2 l9_119=l9_118.xy;
float l9_120=l9_112;
float4 l9_121=sc_set2.sc_RayTracedShadowTexture.sample(sc_set2.sc_RayTracedShadowTextureSmpSC,l9_119,bias(l9_120));
float4 l9_122=l9_121;
l9_108=l9_122;
float4 l9_123=l9_108;
float4 l9_124=l9_123;
float4 l9_125=l9_124;
float l9_126=l9_125.x;
float3 l9_127=float3(l9_126);
float3 l9_128=l9_127;
l9_37.directDiffuse*=(float3(1.0)-l9_128);
l9_37.directSpecular*=(float3(1.0)-l9_128);
}
SurfaceProperties l9_129=l9_34;
float3 l9_130=l9_129.normal;
float3 l9_131=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_132=l9_130;
float3 l9_133=l9_132;
float l9_134=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float2 l9_135=float2(0.0);
float l9_136=l9_133.x;
float l9_137=-l9_133.z;
float l9_138=(l9_136<0.0) ? (-1.0) : 1.0;
float l9_139=l9_138*acos(fast::clamp(l9_137/length(float2(l9_136,l9_137)),-1.0,1.0));
l9_135.x=l9_139-1.5707964;
l9_135.y=acos(l9_133.y);
l9_135/=float2(6.2831855,3.1415927);
l9_135.y=1.0-l9_135.y;
l9_135.x+=(l9_134/360.0);
l9_135.x=fract((l9_135.x+floor(l9_135.x))+1.0);
float2 l9_140=l9_135;
float2 l9_141=l9_140;
float4 l9_142=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_143=l9_141;
float2 l9_144=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_145=5.0;
l9_141=calcSeamlessPanoramicUvsForSampling(l9_143,l9_144,l9_145);
}
float2 l9_146=l9_141;
float l9_147=13.0;
int l9_148=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_149=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_149=0;
}
else
{
l9_149=in.varStereoViewID;
}
int l9_150=l9_149;
l9_148=1-l9_150;
}
else
{
int l9_151=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_151=0;
}
else
{
l9_151=in.varStereoViewID;
}
int l9_152=l9_151;
l9_148=l9_152;
}
int l9_153=l9_148;
float2 l9_154=l9_146;
int l9_155=l9_153;
float l9_156=l9_147;
float4 l9_157=float4(0.0);
float2 l9_158=l9_154;
int l9_159=sc_EnvmapSpecularLayout_tmp;
int l9_160=l9_155;
float l9_161=l9_156;
float2 l9_162=l9_158;
int l9_163=l9_159;
int l9_164=l9_160;
float3 l9_165=float3(0.0);
if (l9_163==0)
{
l9_165=float3(l9_162,0.0);
}
else
{
if (l9_163==1)
{
l9_165=float3(l9_162.x,(l9_162.y*0.5)+(0.5-(float(l9_164)*0.5)),0.0);
}
else
{
l9_165=float3(l9_162,float(l9_164));
}
}
float3 l9_166=l9_165;
float3 l9_167=l9_166;
float2 l9_168=l9_167.xy;
float l9_169=l9_161;
float4 l9_170=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_168,bias(l9_169));
float4 l9_171=l9_170;
l9_157=l9_171;
float4 l9_172=l9_157;
float4 l9_173=l9_172;
l9_142=l9_173;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_174=l9_141;
float2 l9_175=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_176=0.0;
l9_141=calcSeamlessPanoramicUvsForSampling(l9_174,l9_175,l9_176);
float2 l9_177=l9_141;
float l9_178=-13.0;
int l9_179=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_180=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_180=0;
}
else
{
l9_180=in.varStereoViewID;
}
int l9_181=l9_180;
l9_179=1-l9_181;
}
else
{
int l9_182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_182=0;
}
else
{
l9_182=in.varStereoViewID;
}
int l9_183=l9_182;
l9_179=l9_183;
}
int l9_184=l9_179;
float2 l9_185=l9_177;
int l9_186=l9_184;
float l9_187=l9_178;
float4 l9_188=float4(0.0);
float2 l9_189=l9_185;
int l9_190=sc_EnvmapDiffuseLayout_tmp;
int l9_191=l9_186;
float l9_192=l9_187;
float2 l9_193=l9_189;
int l9_194=l9_190;
int l9_195=l9_191;
float3 l9_196=float3(0.0);
if (l9_194==0)
{
l9_196=float3(l9_193,0.0);
}
else
{
if (l9_194==1)
{
l9_196=float3(l9_193.x,(l9_193.y*0.5)+(0.5-(float(l9_195)*0.5)),0.0);
}
else
{
l9_196=float3(l9_193,float(l9_195));
}
}
float3 l9_197=l9_196;
float3 l9_198=l9_197;
float2 l9_199=l9_198.xy;
float l9_200=l9_192;
float4 l9_201=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_199,bias(l9_200));
float4 l9_202=l9_201;
l9_188=l9_202;
float4 l9_203=l9_188;
float4 l9_204=l9_203;
l9_142=l9_204;
}
else
{
float2 l9_205=l9_141;
float l9_206=13.0;
int l9_207=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_208=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_208=0;
}
else
{
l9_208=in.varStereoViewID;
}
int l9_209=l9_208;
l9_207=1-l9_209;
}
else
{
int l9_210=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_210=0;
}
else
{
l9_210=in.varStereoViewID;
}
int l9_211=l9_210;
l9_207=l9_211;
}
int l9_212=l9_207;
float2 l9_213=l9_205;
int l9_214=l9_212;
float l9_215=l9_206;
float4 l9_216=float4(0.0);
float2 l9_217=l9_213;
int l9_218=sc_EnvmapSpecularLayout_tmp;
int l9_219=l9_214;
float l9_220=l9_215;
float2 l9_221=l9_217;
int l9_222=l9_218;
int l9_223=l9_219;
float3 l9_224=float3(0.0);
if (l9_222==0)
{
l9_224=float3(l9_221,0.0);
}
else
{
if (l9_222==1)
{
l9_224=float3(l9_221.x,(l9_221.y*0.5)+(0.5-(float(l9_223)*0.5)),0.0);
}
else
{
l9_224=float3(l9_221,float(l9_223));
}
}
float3 l9_225=l9_224;
float3 l9_226=l9_225;
float2 l9_227=l9_226.xy;
float l9_228=l9_220;
float4 l9_229=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_227,bias(l9_228));
float4 l9_230=l9_229;
l9_216=l9_230;
float4 l9_231=l9_216;
float4 l9_232=l9_231;
l9_142=l9_232;
}
}
float4 l9_233=l9_142;
float3 l9_234=l9_233.xyz*(1.0/l9_233.w);
float3 l9_235=l9_234*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_131=l9_235;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_236=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_237=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_238=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_239=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_240=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_241=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_242=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_243=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_244=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_245=-l9_130;
float l9_246=0.0;
l9_246=l9_245.x;
float l9_247=l9_245.y;
float l9_248=l9_245.z;
float l9_249=l9_246*l9_246;
float l9_250=l9_247*l9_247;
float l9_251=l9_248*l9_248;
float l9_252=l9_246*l9_247;
float l9_253=l9_247*l9_248;
float l9_254=l9_246*l9_248;
float3 l9_255=((((((l9_244*0.42904299)*(l9_249-l9_250))+((l9_242*0.74312502)*l9_251))+(l9_236*0.88622701))-(l9_242*0.24770799))+((((l9_240*l9_252)+(l9_243*l9_254))+(l9_241*l9_253))*0.85808599))+((((l9_239*l9_246)+(l9_237*l9_247))+(l9_238*l9_248))*1.0233279);
l9_131=l9_255*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
bool l9_256=(*sc_set2.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_256)
{
float4 l9_257=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_RayTracedDiffIndTexture,sc_set2.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_131=mix(l9_131,l9_257.xyz,float3(l9_257.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_131+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_131.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_131+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_131.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_131+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_131.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_258=l9_130;
float3 l9_259=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_260;
float l9_261;
int l9_262=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_262<sc_LightEstimationSGCount_tmp)
{
l9_260.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_262].color;
l9_260.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_262].sharpness;
l9_260.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_262].axis;
float3 l9_263=l9_258;
float l9_264=dot(l9_260.axis,l9_263);
float l9_265=l9_260.sharpness;
float l9_266=0.36000001;
float l9_267=1.0/(4.0*l9_266);
float l9_268=exp(-l9_265);
float l9_269=l9_268*l9_268;
float l9_270=1.0/l9_265;
float l9_271=(1.0+(2.0*l9_269))-l9_270;
float l9_272=((l9_268-l9_269)*l9_270)-l9_269;
float l9_273=sqrt(1.0-l9_271);
float l9_274=l9_266*l9_264;
float l9_275=l9_267*l9_273;
float l9_276=l9_274+l9_275;
float l9_277=l9_264;
float l9_278=fast::clamp(l9_277,0.0,1.0);
float l9_279=l9_278;
if (step(abs(l9_274),l9_275)>0.5)
{
l9_261=(l9_276*l9_276)/l9_273;
}
else
{
l9_261=l9_279;
}
l9_279=l9_261;
float l9_280=(l9_271*l9_279)+l9_272;
sc_SphericalGaussianLight_t l9_281=l9_260;
float3 l9_282=(l9_281.color/float3(l9_281.sharpness))*6.2831855;
float3 l9_283=(l9_282*l9_280)/float3(3.1415927);
l9_259+=l9_283;
l9_262++;
continue;
}
else
{
break;
}
}
float3 l9_284=l9_259;
l9_131+=l9_284;
}
float3 l9_285=l9_131;
float3 l9_286=l9_285;
l9_37.indirectDiffuse=l9_286;
SurfaceProperties l9_287=l9_34;
float3 l9_288=l9_38;
float3 l9_289=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_290=l9_287;
float3 l9_291=l9_288;
float3 l9_292=l9_290.normal;
float3 l9_293=reflect(-l9_291,l9_292);
float3 l9_294=l9_292;
float3 l9_295=l9_293;
float l9_296=l9_290.roughness;
l9_293=getSpecularDominantDir(l9_294,l9_295,l9_296);
float l9_297=l9_290.roughness;
float l9_298=pow(l9_297,0.66666669);
float l9_299=fast::clamp(l9_298,0.0,1.0);
float l9_300=l9_299*5.0;
float l9_301=l9_300;
float l9_302=l9_301;
float3 l9_303=l9_293;
float l9_304=l9_302;
float3 l9_305=l9_303;
float l9_306=l9_304;
float4 l9_307=float4(0.0);
float3 l9_308=l9_305;
float l9_309=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float2 l9_310=float2(0.0);
float l9_311=l9_308.x;
float l9_312=-l9_308.z;
float l9_313=(l9_311<0.0) ? (-1.0) : 1.0;
float l9_314=l9_313*acos(fast::clamp(l9_312/length(float2(l9_311,l9_312)),-1.0,1.0));
l9_310.x=l9_314-1.5707964;
l9_310.y=acos(l9_308.y);
l9_310/=float2(6.2831855,3.1415927);
l9_310.y=1.0-l9_310.y;
l9_310.x+=(l9_309/360.0);
l9_310.x=fract((l9_310.x+floor(l9_310.x))+1.0);
float2 l9_315=l9_310;
float2 l9_316=l9_315;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_317=floor(l9_306);
float l9_318=ceil(l9_306);
float l9_319=l9_306-l9_317;
float2 l9_320=l9_316;
float2 l9_321=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_322=l9_317;
float2 l9_323=calcSeamlessPanoramicUvsForSampling(l9_320,l9_321,l9_322);
float2 l9_324=l9_323;
float l9_325=l9_317;
float2 l9_326=l9_324;
float l9_327=l9_325;
int l9_328=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_329=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_329=0;
}
else
{
l9_329=in.varStereoViewID;
}
int l9_330=l9_329;
l9_328=1-l9_330;
}
else
{
int l9_331=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_331=0;
}
else
{
l9_331=in.varStereoViewID;
}
int l9_332=l9_331;
l9_328=l9_332;
}
int l9_333=l9_328;
float2 l9_334=l9_326;
int l9_335=l9_333;
float l9_336=l9_327;
float4 l9_337=float4(0.0);
float2 l9_338=l9_334;
int l9_339=sc_EnvmapSpecularLayout_tmp;
int l9_340=l9_335;
float l9_341=l9_336;
float2 l9_342=l9_338;
int l9_343=l9_339;
int l9_344=l9_340;
float3 l9_345=float3(0.0);
if (l9_343==0)
{
l9_345=float3(l9_342,0.0);
}
else
{
if (l9_343==1)
{
l9_345=float3(l9_342.x,(l9_342.y*0.5)+(0.5-(float(l9_344)*0.5)),0.0);
}
else
{
l9_345=float3(l9_342,float(l9_344));
}
}
float3 l9_346=l9_345;
float3 l9_347=l9_346;
float2 l9_348=l9_347.xy;
float l9_349=l9_341;
float4 l9_350=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_348,level(l9_349));
float4 l9_351=l9_350;
l9_337=l9_351;
float4 l9_352=l9_337;
float4 l9_353=l9_352;
float4 l9_354=l9_353;
float4 l9_355=l9_354;
float2 l9_356=l9_316;
float2 l9_357=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_358=l9_318;
float2 l9_359=calcSeamlessPanoramicUvsForSampling(l9_356,l9_357,l9_358);
float2 l9_360=l9_359;
float l9_361=l9_318;
float2 l9_362=l9_360;
float l9_363=l9_361;
int l9_364=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_365=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_365=0;
}
else
{
l9_365=in.varStereoViewID;
}
int l9_366=l9_365;
l9_364=1-l9_366;
}
else
{
int l9_367=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_367=0;
}
else
{
l9_367=in.varStereoViewID;
}
int l9_368=l9_367;
l9_364=l9_368;
}
int l9_369=l9_364;
float2 l9_370=l9_362;
int l9_371=l9_369;
float l9_372=l9_363;
float4 l9_373=float4(0.0);
float2 l9_374=l9_370;
int l9_375=sc_EnvmapSpecularLayout_tmp;
int l9_376=l9_371;
float l9_377=l9_372;
float2 l9_378=l9_374;
int l9_379=l9_375;
int l9_380=l9_376;
float3 l9_381=float3(0.0);
if (l9_379==0)
{
l9_381=float3(l9_378,0.0);
}
else
{
if (l9_379==1)
{
l9_381=float3(l9_378.x,(l9_378.y*0.5)+(0.5-(float(l9_380)*0.5)),0.0);
}
else
{
l9_381=float3(l9_378,float(l9_380));
}
}
float3 l9_382=l9_381;
float3 l9_383=l9_382;
float2 l9_384=l9_383.xy;
float l9_385=l9_377;
float4 l9_386=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_384,level(l9_385));
float4 l9_387=l9_386;
l9_373=l9_387;
float4 l9_388=l9_373;
float4 l9_389=l9_388;
float4 l9_390=l9_389;
float4 l9_391=l9_390;
l9_307=mix(l9_355,l9_391,float4(l9_319));
}
else
{
float2 l9_392=l9_316;
float l9_393=l9_306;
float2 l9_394=l9_392;
float l9_395=l9_393;
int l9_396=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_397=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_397=0;
}
else
{
l9_397=in.varStereoViewID;
}
int l9_398=l9_397;
l9_396=1-l9_398;
}
else
{
int l9_399=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_399=0;
}
else
{
l9_399=in.varStereoViewID;
}
int l9_400=l9_399;
l9_396=l9_400;
}
int l9_401=l9_396;
float2 l9_402=l9_394;
int l9_403=l9_401;
float l9_404=l9_395;
float4 l9_405=float4(0.0);
float2 l9_406=l9_402;
int l9_407=sc_EnvmapSpecularLayout_tmp;
int l9_408=l9_403;
float l9_409=l9_404;
float2 l9_410=l9_406;
int l9_411=l9_407;
int l9_412=l9_408;
float3 l9_413=float3(0.0);
if (l9_411==0)
{
l9_413=float3(l9_410,0.0);
}
else
{
if (l9_411==1)
{
l9_413=float3(l9_410.x,(l9_410.y*0.5)+(0.5-(float(l9_412)*0.5)),0.0);
}
else
{
l9_413=float3(l9_410,float(l9_412));
}
}
float3 l9_414=l9_413;
float3 l9_415=l9_414;
float2 l9_416=l9_415.xy;
float l9_417=l9_409;
float4 l9_418=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_416,level(l9_417));
float4 l9_419=l9_418;
l9_405=l9_419;
float4 l9_420=l9_405;
float4 l9_421=l9_420;
float4 l9_422=l9_421;
l9_307=l9_422;
}
float4 l9_423=l9_307;
float3 l9_424=l9_423.xyz*(1.0/l9_423.w);
float3 l9_425=l9_424;
float3 l9_426=l9_425*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_426+=float3(1e-06);
float3 l9_427=l9_426;
float3 l9_428=l9_427;
bool l9_429=(*sc_set2.UserUniforms).receivesRayTracedReflections!=0;
if (l9_429)
{
float4 l9_430=sampleRayTracedReflections(in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_RayTracedReflectionTexture,sc_set2.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_428=mix(l9_428,l9_430.xyz,float3(l9_430.w));
}
SurfaceProperties l9_431=l9_290;
float l9_432=abs(dot(l9_292,l9_291));
float3 l9_433=l9_428*envBRDFApprox(l9_431,l9_432);
l9_289+=l9_433;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_434=l9_287;
float3 l9_435=l9_288;
float l9_436=fast::clamp(l9_434.roughness*l9_434.roughness,0.0099999998,1.0);
float3 l9_437=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight*l9_434.specColor;
sc_SphericalGaussianLight_t l9_438;
sc_SphericalGaussianLight_t l9_439;
sc_SphericalGaussianLight_t l9_440;
int l9_441=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_441<sc_LightEstimationSGCount_tmp)
{
l9_438.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_441].color;
l9_438.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_441].sharpness;
l9_438.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_441].axis;
float3 l9_442=l9_434.normal;
float l9_443=l9_436;
float3 l9_444=l9_435;
float3 l9_445=l9_434.specColor;
float3 l9_446=l9_442;
float l9_447=l9_443;
l9_439.axis=l9_446;
float l9_448=l9_447*l9_447;
l9_439.sharpness=2.0/l9_448;
l9_439.color=float3(1.0/(3.1415927*l9_448));
sc_SphericalGaussianLight_t l9_449=l9_439;
sc_SphericalGaussianLight_t l9_450=l9_449;
sc_SphericalGaussianLight_t l9_451=l9_450;
float3 l9_452=l9_444;
l9_440.axis=reflect(-l9_452,l9_451.axis);
l9_440.color=l9_451.color;
l9_440.sharpness=l9_451.sharpness;
l9_440.sharpness/=(4.0*fast::max(dot(l9_451.axis,l9_452),9.9999997e-05));
sc_SphericalGaussianLight_t l9_453=l9_440;
sc_SphericalGaussianLight_t l9_454=l9_453;
sc_SphericalGaussianLight_t l9_455=l9_454;
sc_SphericalGaussianLight_t l9_456=l9_438;
float l9_457=length((l9_455.axis*l9_455.sharpness)+(l9_456.axis*l9_456.sharpness));
float3 l9_458=(l9_455.color*exp((l9_457-l9_455.sharpness)-l9_456.sharpness))*l9_456.color;
float l9_459=1.0-exp((-2.0)*l9_457);
float3 l9_460=((l9_458*6.2831855)*l9_459)/float3(l9_457);
float3 l9_461=l9_460;
float3 l9_462=l9_454.axis;
float l9_463=l9_443*l9_443;
float l9_464=dot(l9_442,l9_462);
float l9_465=fast::clamp(l9_464,0.0,1.0);
float l9_466=l9_465;
float l9_467=dot(l9_442,l9_444);
float l9_468=fast::clamp(l9_467,0.0,1.0);
float l9_469=l9_468;
float3 l9_470=normalize(l9_454.axis+l9_444);
float l9_471=l9_463;
float l9_472=l9_466;
float l9_473=1.0/(l9_472+sqrt(l9_471+(((1.0-l9_471)*l9_472)*l9_472)));
float l9_474=l9_463;
float l9_475=l9_469;
float l9_476=1.0/(l9_475+sqrt(l9_474+(((1.0-l9_474)*l9_475)*l9_475)));
l9_461*=(l9_473*l9_476);
float l9_477=dot(l9_462,l9_470);
float l9_478=fast::clamp(l9_477,0.0,1.0);
float l9_479=pow(1.0-l9_478,5.0);
l9_461*=(l9_445+((float3(1.0)-l9_445)*l9_479));
l9_461*=l9_466;
float3 l9_480=l9_461;
l9_437+=l9_480;
l9_441++;
continue;
}
else
{
break;
}
}
float3 l9_481=l9_437;
l9_289+=l9_481;
}
float3 l9_482=l9_289;
l9_37.indirectSpecular=l9_482;
LightingComponents l9_483=l9_37;
LightingComponents l9_484=l9_483;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_484.directDiffuse=float3(0.0);
l9_484.indirectDiffuse=float3(0.0);
float4 l9_485=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_486=out.FragColor0;
float4 l9_487=l9_486;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_487.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_488=l9_487;
l9_485=l9_488;
}
else
{
float4 l9_489=gl_FragCoord;
float2 l9_490=(l9_489.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_491=l9_490;
float2 l9_492=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_493=1;
int l9_494=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_494=0;
}
else
{
l9_494=in.varStereoViewID;
}
int l9_495=l9_494;
int l9_496=l9_495;
float3 l9_497=float3(l9_491,0.0);
int l9_498=l9_493;
int l9_499=l9_496;
if (l9_498==1)
{
l9_497.y=((2.0*l9_497.y)+float(l9_499))-1.0;
}
float2 l9_500=l9_497.xy;
l9_492=l9_500;
}
else
{
l9_492=l9_491;
}
float2 l9_501=l9_492;
float2 l9_502=l9_501;
float2 l9_503=l9_502;
int l9_504=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_505=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_505=0;
}
else
{
l9_505=in.varStereoViewID;
}
int l9_506=l9_505;
l9_504=1-l9_506;
}
else
{
int l9_507=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_507=0;
}
else
{
l9_507=in.varStereoViewID;
}
int l9_508=l9_507;
l9_504=l9_508;
}
int l9_509=l9_504;
float2 l9_510=l9_503;
int l9_511=l9_509;
float2 l9_512=l9_510;
int l9_513=l9_511;
float l9_514=0.0;
float4 l9_515=float4(0.0);
float2 l9_516=l9_512;
int l9_517=sc_ScreenTextureLayout_tmp;
int l9_518=l9_513;
float l9_519=l9_514;
float2 l9_520=l9_516;
int l9_521=l9_517;
int l9_522=l9_518;
float3 l9_523=float3(0.0);
if (l9_521==0)
{
l9_523=float3(l9_520,0.0);
}
else
{
if (l9_521==1)
{
l9_523=float3(l9_520.x,(l9_520.y*0.5)+(0.5-(float(l9_522)*0.5)),0.0);
}
else
{
l9_523=float3(l9_520,float(l9_522));
}
}
float3 l9_524=l9_523;
float3 l9_525=l9_524;
float2 l9_526=l9_525.xy;
float l9_527=l9_519;
float4 l9_528=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_526,bias(l9_527));
float4 l9_529=l9_528;
l9_515=l9_529;
float4 l9_530=l9_515;
float4 l9_531=l9_530;
float4 l9_532=l9_531;
l9_485=l9_532;
}
float4 l9_533=l9_485;
float4 l9_534=l9_533;
float3 l9_535=l9_534.xyz;
float3 l9_536;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_536=float3(pow(l9_535.x,2.2),pow(l9_535.y,2.2),pow(l9_535.z,2.2));
}
else
{
l9_536=l9_535*l9_535;
}
float3 l9_537=l9_536;
float3 l9_538=l9_537;
l9_484.transmitted=l9_538*mix(float3(1.0),l9_21.albedo,float3(l9_21.opacity));
l9_21.opacity=1.0;
}
bool l9_539=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_539=true;
}
SurfaceProperties l9_540=l9_21;
LightingComponents l9_541=l9_484;
bool l9_542=l9_539;
float3 l9_543=float3(0.0);
bool l9_544=(*sc_set2.UserUniforms).receivesRayTracedAo!=0;
if (l9_544)
{
l9_543=l9_540.albedo*(l9_541.directDiffuse+(l9_541.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_RayTracedAoTexture,sc_set2.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_543=l9_540.albedo*(l9_541.directDiffuse+(l9_541.indirectDiffuse*l9_540.ao));
}
float3 l9_545=l9_541.directSpecular+(l9_541.indirectSpecular*l9_540.specularAo);
float3 l9_546=l9_540.emissive;
float3 l9_547=l9_541.transmitted;
if (l9_542)
{
float l9_548=l9_540.opacity;
l9_543*=srgbToLinear(l9_548);
}
float3 l9_549=((l9_543+l9_545)+l9_546)+l9_547;
float3 l9_550=l9_549;
float4 l9_551=float4(l9_550,l9_21.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_552=l9_551.xyz;
float l9_553=1.8;
float l9_554=1.4;
float l9_555=0.5;
float l9_556=1.5;
float3 l9_557=(l9_552*((l9_552*l9_553)+float3(l9_554)))/((l9_552*((l9_552*l9_553)+float3(l9_555)))+float3(l9_556));
l9_551=float4(l9_557.x,l9_557.y,l9_557.z,l9_551.w);
}
float3 l9_558=l9_551.xyz;
float l9_559=l9_558.x;
float l9_560=l9_558.y;
float l9_561=l9_558.z;
float3 l9_562=float3(linearToSrgb(l9_559),linearToSrgb(l9_560),linearToSrgb(l9_561));
l9_551=float4(l9_562.x,l9_562.y,l9_562.z,l9_551.w);
float4 l9_563=l9_551;
param_15=l9_563;
}
param_15=fast::max(param_15,float4(0.0));
Output_N0=param_15;
float Output_N98=0.0;
Output_N98=length(Output_N99);
float Output_N105=0.0;
Output_N105=float(Output_N98>(*sc_set2.UserUniforms).Port_Input1_N105);
float4 Output_N104=float4(0.0);
float4 param_17=Output_N0;
float param_18=Output_N105;
float4 param_19=param_17;
if ((param_18*1.0)!=0.0)
{
discard_fragment();
}
Output_N104=param_19;
FinalColor=Output_N104;
float4 param_20=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_564=param_20;
float4 l9_565=l9_564;
float l9_566=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_566=l9_565.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_566=fast::clamp(l9_565.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_566=fast::clamp(dot(l9_565.xyz,float3(l9_565.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_566=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_566=(1.0-dot(l9_565.xyz,float3(0.33333001)))*l9_565.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_566=(1.0-fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0))*l9_565.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_566=fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0)*l9_565.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_566=fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_566=fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0)*l9_565.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_566=dot(l9_565.xyz,float3(0.33333001))*l9_565.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_566=1.0-fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_566=fast::clamp(dot(l9_565.xyz,float3(1.0)),0.0,1.0);
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
float l9_567=l9_566;
float l9_568=l9_567;
float l9_569=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_568;
float3 l9_570=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_564.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_571=float4(l9_570.x,l9_570.y,l9_570.z,l9_569);
param_20=l9_571;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_20=float4(param_20.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_572=param_20;
float4 l9_573=float4(0.0);
float4 l9_574=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_575=out.FragColor0;
float4 l9_576=l9_575;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_576.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_577=l9_576;
l9_574=l9_577;
}
else
{
float4 l9_578=gl_FragCoord;
float2 l9_579=(l9_578.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_580=l9_579;
float2 l9_581=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_582=1;
int l9_583=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_583=0;
}
else
{
l9_583=in.varStereoViewID;
}
int l9_584=l9_583;
int l9_585=l9_584;
float3 l9_586=float3(l9_580,0.0);
int l9_587=l9_582;
int l9_588=l9_585;
if (l9_587==1)
{
l9_586.y=((2.0*l9_586.y)+float(l9_588))-1.0;
}
float2 l9_589=l9_586.xy;
l9_581=l9_589;
}
else
{
l9_581=l9_580;
}
float2 l9_590=l9_581;
float2 l9_591=l9_590;
float2 l9_592=l9_591;
int l9_593=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_594=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_594=0;
}
else
{
l9_594=in.varStereoViewID;
}
int l9_595=l9_594;
l9_593=1-l9_595;
}
else
{
int l9_596=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_596=0;
}
else
{
l9_596=in.varStereoViewID;
}
int l9_597=l9_596;
l9_593=l9_597;
}
int l9_598=l9_593;
float2 l9_599=l9_592;
int l9_600=l9_598;
float2 l9_601=l9_599;
int l9_602=l9_600;
float l9_603=0.0;
float4 l9_604=float4(0.0);
float2 l9_605=l9_601;
int l9_606=sc_ScreenTextureLayout_tmp;
int l9_607=l9_602;
float l9_608=l9_603;
float2 l9_609=l9_605;
int l9_610=l9_606;
int l9_611=l9_607;
float3 l9_612=float3(0.0);
if (l9_610==0)
{
l9_612=float3(l9_609,0.0);
}
else
{
if (l9_610==1)
{
l9_612=float3(l9_609.x,(l9_609.y*0.5)+(0.5-(float(l9_611)*0.5)),0.0);
}
else
{
l9_612=float3(l9_609,float(l9_611));
}
}
float3 l9_613=l9_612;
float3 l9_614=l9_613;
float2 l9_615=l9_614.xy;
float l9_616=l9_608;
float4 l9_617=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_615,bias(l9_616));
float4 l9_618=l9_617;
l9_604=l9_618;
float4 l9_619=l9_604;
float4 l9_620=l9_619;
float4 l9_621=l9_620;
l9_574=l9_621;
}
float4 l9_622=l9_574;
float4 l9_623=l9_622;
float3 l9_624=l9_623.xyz;
float3 l9_625=l9_624;
float3 l9_626=l9_572.xyz;
float3 l9_627=definedBlend(l9_625,l9_626,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
l9_573=float4(l9_627.x,l9_627.y,l9_627.z,l9_573.w);
float3 l9_628=mix(l9_624,l9_573.xyz,float3(l9_572.w));
l9_573=float4(l9_628.x,l9_628.y,l9_628.z,l9_573.w);
l9_573.w=1.0;
float4 l9_629=l9_573;
param_20=l9_629;
}
else
{
float4 l9_630=param_20;
float4 l9_631=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_631=float4(mix(float3(1.0),l9_630.xyz,float3(l9_630.w)),l9_630.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_632=l9_630.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_632=fast::clamp(l9_632,0.0,1.0);
}
l9_631=float4(l9_630.xyz*l9_632,l9_632);
}
else
{
l9_631=l9_630;
}
}
float4 l9_633=l9_631;
param_20=l9_633;
}
}
}
float4 l9_634=param_20;
FinalColor=l9_634;
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
float4 l9_635=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_635=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_635=float4(0.0);
}
float4 l9_636=l9_635;
float4 Cost=l9_636;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_21=in.varPos;
float4 param_22=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_21,param_22,in.varStereoViewID,(*sc_set2.UserUniforms));
float4 param_23=FinalColor;
float4 l9_637=param_23;
out.FragColor0=l9_637;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float2 Surface_UVCoord0;
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
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
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
float4 baseColor;
float Port_Value_N044;
float Port_Multiplier_N086;
float Port_Value_N073;
float Port_Scale_N083;
float Port_RangeMinB_N085;
float Port_RangeMaxB_N085;
float Port_Input1_N045;
float Port_Input1_N046;
float2 Port_Input1_N041;
float2 Port_Input1_N099;
float Port_Value2_N100;
float Port_Opacity_N000;
float3 Port_Emissive_N000;
float Port_Value_N001;
float Port_Value_N002;
float3 Port_AO_N000;
float3 Port_SpecularAO_N000;
float Port_Input1_N105;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracedAoTexture [[id(12)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(13)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(14)]];
texture2d<float> sc_RayTracedShadowTexture [[id(15)]];
texture2d<float> sc_SSAOTexture [[id(16)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<float> sc_ShadowTexture [[id(18)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler sc_EnvmapDiffuseSmpSC [[id(21)]];
sampler sc_EnvmapSpecularSmpSC [[id(22)]];
sampler sc_RayTracedAoTextureSmpSC [[id(24)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(25)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(26)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(27)]];
sampler sc_SSAOTextureSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(29)]];
sampler sc_ShadowTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
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
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
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
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float2 UVCoord_N42=float2(0.0);
UVCoord_N42=Globals.Surface_UVCoord0;
float2 Output_N41=float2(0.0);
Output_N41=UVCoord_N42-(*sc_set2.UserUniforms).Port_Input1_N041;
float2 Output_N99=float2(0.0);
Output_N99=Output_N41*(*sc_set2.UserUniforms).Port_Input1_N099;
float3 Value_N100=float3(0.0);
Value_N100=float3(Output_N99.x,Output_N99.y,Value_N100.z);
Value_N100.z=(*sc_set2.UserUniforms).Port_Value2_N100;
float3 Output_N101=float3(0.0);
float3 param=Value_N100;
float l9_2=dot(param,param);
float l9_3;
if (l9_2>0.0)
{
l9_3=1.0/sqrt(l9_2);
}
else
{
l9_3=0.0;
}
float l9_4=l9_3;
float3 param_1=param*l9_4;
Output_N101=param_1;
float3 VectorOut_N106=float3(0.0);
VectorOut_N106=((*sc_set2.UserUniforms).sc_ModelMatrix*float4(Output_N101,1.0)).xyz;
float Output_N2=0.0;
float param_2=(*sc_set2.UserUniforms).Port_Value_N002;
float param_3=param_2+0.001;
param_3-=0.001;
Output_N2=param_3;
float param_4=(*sc_set2.UserUniforms).Port_Opacity_N000;
float3 param_5=VectorOut_N106;
float param_6=Output_N2;
ssGlobals param_7=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_7.BumpedNormal=param_5;
}
float l9_5=param_4;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_5<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_6=gl_FragCoord;
float2 l9_7=floor(mod(l9_6.xy,float2(4.0)));
float l9_8=(mod(dot(l9_7,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_5<l9_8)
{
discard_fragment();
}
}
float3 l9_9=param_7.PositionWS;
float3 l9_10=param_7.BumpedNormal;
float l9_11=param_6;
float3 l9_12=normalize((*sc_set2.UserUniforms).sc_Camera.position-l9_9);
if (dot(l9_12,l9_10)>=(-0.050000001))
{
uint3 l9_13=uint3(round((l9_9-(*sc_set2.UserUniforms).OriginNormalizationOffset)*(*sc_set2.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_13.x,l9_13.y,l9_13.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set2.UserUniforms).receiver_mask);
float3 l9_14=l9_10;
float l9_15=dot(abs(l9_14),float3(1.0));
l9_14/=float3(l9_15);
float l9_16=fast::clamp(-l9_14.z,0.0,1.0);
float2 l9_17=l9_14.xy;
float l9_18;
if (l9_14.x>=0.0)
{
l9_18=l9_16;
}
else
{
l9_18=-l9_16;
}
l9_17.x+=l9_18;
float l9_19;
if (l9_14.y>=0.0)
{
l9_19=l9_16;
}
else
{
l9_19=-l9_16;
}
l9_17.y+=l9_19;
float2 l9_20=l9_17;
float2 l9_21=l9_20;
uint2 l9_22=uint2(as_type<uint>(half2(float2(l9_21.x,0.0))),as_type<uint>(half2(float2(l9_21.y,0.0))));
out.normal_and_more=uint4(l9_22.x,l9_22.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_23;
if (l9_11<0.0)
{
l9_23=1023u;
}
else
{
l9_23=uint(fast::clamp(l9_11,0.0,1.0)*1000.0);
}
uint l9_24=l9_23;
l9_24 |= uint(((*sc_set2.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_24;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
float Output_N98=0.0;
Output_N98=length(Output_N99);
float Output_N105=0.0;
Output_N105=float(Output_N98>(*sc_set2.UserUniforms).Port_Input1_N105);
float param_8=Output_N105;
if ((param_8*1.0)!=0.0)
{
discard_fragment();
}
return out;
}
} // RECEIVER MODE SHADER
