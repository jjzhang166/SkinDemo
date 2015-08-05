//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
//
// Buffer Definitions: 
//
// cbuffer cbPerObject
// {
//
//   float4x4 matWorld;                 // Offset:    0 Size:    64
//   float4x4 matWorldInvTranspose;     // Offset:   64 Size:    64
//   float4x4 matWVP;                   // Offset:  128 Size:    64
//   
//   struct Material
//   {
//       
//       float4 Ambient;                // Offset:  192
//       float4 Diffuse;                // Offset:  208
//       float4 Specular;               // Offset:  224
//       float4 Reflect;                // Offset:  240
//
//   } material;                        // Offset:  192 Size:    64 [unused]
//   float4x4 lightWVPT;                // Offset:  256 Size:    64
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// cbPerObject                       cbuffer      NA          NA    3        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyz         0     NONE   float   xyz 
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TANGENT                  0   xyz         3     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// POSITION                 0   xyz         1     NONE   float   xyz 
// NORMAL                   0   xyz         2     NONE   float   xyz 
// TANGENT                  0   xyz         3     NONE   float   xyz 
// TEXCOORD                 0   xy          4     NONE   float   xy  
// TEXCOORD                 1   xyzw        5     NONE   float   xyzw
//
vs_5_0
dcl_globalFlags refactoringAllowed | skipOptimization
dcl_constantbuffer cb3[20], immediateIndexed
dcl_input v0.xyz
dcl_input v1.xyz
dcl_input v2.xy
dcl_input v3.xyz
dcl_output_siv o0.xyzw, position
dcl_output o1.xyz
dcl_output o2.xyz
dcl_output o3.xyz
dcl_output o4.xy
dcl_output o5.xyzw
dcl_temps 7
//
// Initial variable locations:
//   v0.x <- input.PosL.x; v0.y <- input.PosL.y; v0.z <- input.PosL.z; 
//   v1.x <- input.NorL.x; v1.y <- input.NorL.y; v1.z <- input.NorL.z; 
//   v2.x <- input.Tex.x; v2.y <- input.Tex.y; 
//   v3.x <- input.TangentL.x; v3.y <- input.TangentL.y; v3.z <- input.TangentL.z; 
//   o5.x <- <VS return value>.ShadowH.x; o5.y <- <VS return value>.ShadowH.y; o5.z <- <VS return value>.ShadowH.z; o5.w <- <VS return value>.ShadowH.w; 
//   o4.x <- <VS return value>.Tex.x; o4.y <- <VS return value>.Tex.y; 
//   o3.x <- <VS return value>.TangentW.x; o3.y <- <VS return value>.TangentW.y; o3.z <- <VS return value>.TangentW.z; 
//   o2.x <- <VS return value>.NorW.x; o2.y <- <VS return value>.NorW.y; o2.z <- <VS return value>.NorW.z; 
//   o1.x <- <VS return value>.PosW.x; o1.y <- <VS return value>.PosW.y; o1.z <- <VS return value>.PosW.z; 
//   o0.x <- <VS return value>.PosH.x; o0.y <- <VS return value>.PosH.y; o0.z <- <VS return value>.PosH.z; o0.w <- <VS return value>.PosH.w
//
#line 121 "D:\Projects\Demo\Demo\SkinDemo\Shaders\DemoShader.hlsl"
mov r0.xyz, v0.xyzx
mov r0.w, l(1.000000)
dp4 r1.x, r0.xyzw, cb3[0].xyzw  // r1.x <- output.PosW.x
dp4 r1.y, r0.xyzw, cb3[1].xyzw  // r1.y <- output.PosW.y
dp4 r1.z, r0.xyzw, cb3[2].xyzw  // r1.z <- output.PosW.z
dp3 r2.x, v1.xyzx, cb3[4].xyzx  // r2.x <- output.NorW.x
dp3 r2.y, v1.xyzx, cb3[5].xyzx  // r2.y <- output.NorW.y
dp3 r2.z, v1.xyzx, cb3[6].xyzx  // r2.z <- output.NorW.z
dp3 r3.x, v3.xyzx, cb3[0].xyzx  // r3.x <- output.TangentW.x
dp3 r3.y, v3.xyzx, cb3[1].xyzx  // r3.y <- output.TangentW.y
dp3 r3.z, v3.xyzx, cb3[2].xyzx  // r3.z <- output.TangentW.z
dp4 r4.x, r0.xyzw, cb3[8].xyzw  // r4.x <- output.PosH.x
dp4 r4.y, r0.xyzw, cb3[9].xyzw  // r4.y <- output.PosH.y
dp4 r4.z, r0.xyzw, cb3[10].xyzw  // r4.z <- output.PosH.z
dp4 r4.w, r0.xyzw, cb3[11].xyzw  // r4.w <- output.PosH.w
mov r5.xy, v2.xyxx  // r5.x <- output.Tex.x; r5.y <- output.Tex.y
dp4 r6.x, r0.xyzw, cb3[16].xyzw  // r6.x <- output.ShadowH.x
dp4 r6.y, r0.xyzw, cb3[17].xyzw  // r6.y <- output.ShadowH.y
dp4 r6.z, r0.xyzw, cb3[18].xyzw  // r6.z <- output.ShadowH.z
dp4 r6.w, r0.xyzw, cb3[19].xyzw  // r6.w <- output.ShadowH.w
mov o0.xyzw, r4.xyzw
mov o5.xyzw, r6.xyzw
mov o1.xyz, r1.xyzx
mov o2.xyz, r2.xyzx
mov o3.xyz, r3.xyzx
mov o4.xy, r5.xyxx
ret 
// Approximately 27 instruction slots used
