; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [351 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [696 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 5747703, ; 1: Abp => 0x57b3f7 => 173
	i32 10166715, ; 2: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 4: Microsoft.Extensions.DependencyModel => 0x1903f80 => 198
	i32 32687329, ; 5: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 270
	i32 34715100, ; 6: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 304
	i32 34839235, ; 7: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 216
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 345
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 215
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 288
	i32 109019942, ; 17: BlazingPizzaMAUI.Domain.dll => 0x67f8326 => 346
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 288
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 308
	i32 142721839, ; 22: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 23: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 24: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 25: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 244
	i32 176265551, ; 26: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 27: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 290
	i32 184328833, ; 28: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 29: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 342
	i32 199333315, ; 30: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 343
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 242
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 264
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 39: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 181
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 247
	i32 262163688, ; 41: System.Linq.Dynamic.Core => 0xfa04ce8 => 226
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 266
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 263
	i32 280992041, ; 45: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 314
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 342
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 233
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 51: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 327
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 265
	i32 356389973, ; 53: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 326
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 55: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 56: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 57: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 58: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 59: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 60: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395382782, ; 61: Nito.AsyncEx.Tasks => 0x17910ffe => 219
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 347
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 64: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 338
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 248
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 261
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 70: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 71: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 72: System.dll => 0x1bff388e => 164
	i32 476646585, ; 73: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 263
	i32 486930444, ; 74: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 276
	i32 498788369, ; 75: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 76: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 325
	i32 503918385, ; 77: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 319
	i32 513247710, ; 78: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 208
	i32 526420162, ; 79: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 80: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 308
	i32 530272170, ; 81: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 82: Microsoft.Extensions.Logging => 0x20216150 => 204
	i32 540030774, ; 83: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 84: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 85: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 87: Jsr305Binding => 0x213954e7 => 301
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 299
	i32 571435654, ; 89: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 201
	i32 577335427, ; 90: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 91: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 333
	i32 601371474, ; 92: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 93: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 94: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 253
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 331
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 259
	i32 643868501, ; 98: System.Net => 0x2660a755 => 81
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 295
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 240
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 104: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 313
	i32 690569205, ; 105: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 106: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 310
	i32 693804605, ; 107: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 108: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 109: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 305
	i32 700358131, ; 110: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 111: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 328
	i32 709557578, ; 112: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 316
	i32 720511267, ; 113: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 309
	i32 722857257, ; 114: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 230
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 337
	i32 789151979, ; 122: Microsoft.Extensions.Options => 0x2f0980eb => 207
	i32 790371945, ; 123: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 254
	i32 804008546, ; 124: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 185
	i32 804715423, ; 125: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 126: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 268
	i32 823281589, ; 127: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 128: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 129: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 71
	i32 835661280, ; 131: MvvmHelpers.dll => 0x31cf2de0 => 222
	i32 843511501, ; 132: Xamarin.AndroidX.Print => 0x3246f6cd => 281
	i32 857956212, ; 133: System.Linq.Dynamic.Core.dll => 0x33235f74 => 226
	i32 873119928, ; 134: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 135: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 136: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 137: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 138: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 139: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 340
	i32 928116545, ; 140: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 304
	i32 930420828, ; 141: Castle.Facilities.Logging => 0x3775185c => 176
	i32 952186615, ; 142: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 143: Newtonsoft.Json => 0x38f24a24 => 216
	i32 956575887, ; 144: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 309
	i32 966729478, ; 145: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 302
	i32 967690846, ; 146: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 265
	i32 975236339, ; 147: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 148: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 149: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 150: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 153: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 203
	i32 1001831731, ; 154: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 155: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 285
	i32 1019214401, ; 156: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 157: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 197
	i32 1029334545, ; 158: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 315
	i32 1031528504, ; 159: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 303
	i32 1035644815, ; 160: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 238
	i32 1036536393, ; 161: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043796917, ; 162: Nito.Disposables => 0x3e3713b5 => 221
	i32 1044663988, ; 163: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 164: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 272
	i32 1067306892, ; 165: GoogleGson => 0x3f9dcf8c => 178
	i32 1082857460, ; 166: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 167: Xamarin.Kotlin.StdLib => 0x409e66d8 => 306
	i32 1089913930, ; 168: System.Diagnostics.EventLog.dll => 0x40f6c44a => 224
	i32 1098259244, ; 169: System => 0x41761b2c => 164
	i32 1106973742, ; 170: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 194
	i32 1118262833, ; 171: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 328
	i32 1121599056, ; 172: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 271
	i32 1127624469, ; 173: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 206
	i32 1149092582, ; 174: Xamarin.AndroidX.Window => 0x447dc2e6 => 298
	i32 1157931901, ; 175: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 188
	i32 1168523401, ; 176: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 334
	i32 1170634674, ; 177: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 178: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 199
	i32 1175144683, ; 179: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 294
	i32 1176518159, ; 180: Castle.Facilities.Logging.dll => 0x46203e0f => 176
	i32 1178241025, ; 181: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 279
	i32 1202000627, ; 182: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 188
	i32 1203215381, ; 183: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 332
	i32 1204270330, ; 184: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 240
	i32 1204575371, ; 185: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 190
	i32 1208641965, ; 186: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 187: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 188: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 330
	i32 1243150071, ; 189: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 299
	i32 1253011324, ; 190: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 191: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 314
	i32 1264511973, ; 192: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 289
	i32 1267360935, ; 193: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 293
	i32 1273260888, ; 194: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 245
	i32 1275534314, ; 195: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 310
	i32 1278448581, ; 196: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 237
	i32 1293217323, ; 197: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 256
	i32 1309188875, ; 198: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 199: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 298
	i32 1324164729, ; 200: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 201: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 202: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 203: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 344
	i32 1376866003, ; 204: Xamarin.AndroidX.SavedState => 0x52114ed3 => 285
	i32 1379779777, ; 205: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 206: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 207: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 249
	i32 1408764838, ; 208: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 209: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1413052328, ; 210: Nito.AsyncEx.Context => 0x543977a8 => 217
	i32 1422545099, ; 211: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 212: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 312
	i32 1434145427, ; 213: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 214: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 302
	i32 1439761251, ; 215: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 216: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 217: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 218: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 200
	i32 1457743152, ; 219: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 220: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 221: es\Microsoft.Maui.Controls.resources => 0x57152abe => 318
	i32 1461234159, ; 222: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 223: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 224: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 225: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 239
	i32 1470490898, ; 226: Microsoft.Extensions.Primitives => 0x57a5e912 => 208
	i32 1479771757, ; 227: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 228: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 229: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 230: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 286
	i32 1493001747, ; 231: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 322
	i32 1514721132, ; 232: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 317
	i32 1521091094, ; 233: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 203
	i32 1536373174, ; 234: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 235: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 236: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 237: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 185
	i32 1550322496, ; 238: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 239: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 337
	i32 1565862583, ; 240: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 241: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 242: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 243: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 244: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 255
	i32 1592978981, ; 245: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 246: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 303
	i32 1601112923, ; 247: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 248: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 249: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 250: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 275
	i32 1622358360, ; 251: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 252: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 297
	i32 1627597887, ; 253: BlazingPizzaMAUI => 0x61032c3f => 0
	i32 1632842087, ; 254: Microsoft.Extensions.Configuration.Json => 0x61533167 => 195
	i32 1635184631, ; 255: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 259
	i32 1636350590, ; 256: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 252
	i32 1639515021, ; 257: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 258: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 259: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 260: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 184
	i32 1657153582, ; 261: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 262: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 291
	i32 1658251792, ; 263: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 300
	i32 1670060433, ; 264: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 247
	i32 1675553242, ; 265: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 266: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 267: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 268: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 269: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 187
	i32 1691477237, ; 270: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 271: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 272: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 307
	i32 1701541528, ; 273: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 274: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 268
	i32 1726116996, ; 275: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 276: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 277: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 243
	i32 1736233607, ; 278: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 335
	i32 1743415430, ; 279: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 313
	i32 1744735666, ; 280: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 281: System.IO.Pipelines.dll => 0x68139a0d => 225
	i32 1746316138, ; 282: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 283: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 284: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 285: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 183
	i32 1763938596, ; 286: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 287: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 288: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 290
	i32 1770582343, ; 289: Microsoft.Extensions.Logging.dll => 0x6988f147 => 204
	i32 1776026572, ; 290: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 291: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 292: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 293: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 329
	i32 1788241197, ; 294: Xamarin.AndroidX.Fragment => 0x6a96652d => 261
	i32 1793755602, ; 295: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 321
	i32 1808609942, ; 296: Xamarin.AndroidX.Loader => 0x6bcd3296 => 275
	i32 1813058853, ; 297: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 306
	i32 1813201214, ; 298: Xamarin.Google.Android.Material => 0x6c13413e => 300
	i32 1818569960, ; 299: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 280
	i32 1818787751, ; 300: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 301: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 302: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 303: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 205
	i32 1842015223, ; 304: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 341
	i32 1847515442, ; 305: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 230
	i32 1853025655, ; 306: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 338
	i32 1858542181, ; 307: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 308: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 309: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 320
	i32 1879696579, ; 310: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 311: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 241
	i32 1888955245, ; 312: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 313: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 314: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 315: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 316: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 317: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1949863139, ; 318: Castle.Core.dll => 0x74388ce3 => 174
	i32 1956758971, ; 319: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 320: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 287
	i32 1968388702, ; 321: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 191
	i32 1983156543, ; 322: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 307
	i32 1985761444, ; 323: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 232
	i32 1994852232, ; 324: JetBrains.Annotations.dll => 0x76e70788 => 179
	i32 2003115576, ; 325: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 317
	i32 2011961780, ; 326: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 327: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 272
	i32 2025202353, ; 328: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 312
	i32 2031763787, ; 329: Xamarin.Android.Glide => 0x791a414b => 229
	i32 2034505457, ; 330: Castle.Core.AsyncInterceptor => 0x794416f1 => 175
	i32 2045470958, ; 331: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 332: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 193
	i32 2055239286, ; 333: Nito.Disposables.dll => 0x7a807676 => 221
	i32 2055257422, ; 334: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 267
	i32 2060060697, ; 335: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 336: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 316
	i32 2070888862, ; 337: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 338: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 202
	i32 2079903147, ; 339: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 340: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2123549063, ; 341: Nito.AsyncEx.Coordination.dll => 0x7e92c987 => 218
	i32 2127167465, ; 342: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 343: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 344: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 345: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 346: Microsoft.Maui => 0x80bd55ad => 213
	i32 2169148018, ; 347: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 324
	i32 2181898931, ; 348: Microsoft.Extensions.Options.dll => 0x820d22b3 => 207
	i32 2192057212, ; 349: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 205
	i32 2193016926, ; 350: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 351: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 198
	i32 2201107256, ; 352: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 311
	i32 2201231467, ; 353: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 354: it\Microsoft.Maui.Controls.resources => 0x839595db => 326
	i32 2217644978, ; 355: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 294
	i32 2222056684, ; 356: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2224293411, ; 357: BlazingPizzaMAUI.dll => 0x84940623 => 0
	i32 2244775296, ; 358: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 276
	i32 2252106437, ; 359: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 360: Microsoft.EntityFrameworkCore => 0x86487ec9 => 187
	i32 2256313426, ; 361: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 362: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 363: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 192
	i32 2267999099, ; 364: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 231
	i32 2270573516, ; 365: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 320
	i32 2279755925, ; 366: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 283
	i32 2293034957, ; 367: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 368: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 369: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 370: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 330
	i32 2305521784, ; 371: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 372: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 235
	i32 2320631194, ; 373: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2329808537, ; 374: Nito.AsyncEx.Coordination => 0x8ade0e99 => 218
	i32 2340441535, ; 375: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 376: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 377: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 378: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 379: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 191
	i32 2371487924, ; 380: Castle.Core.AsyncInterceptor.dll => 0x8d5a08b4 => 175
	i32 2378619854, ; 381: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 382: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 383: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 325
	i32 2401565422, ; 384: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 385: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 258
	i32 2411328690, ; 386: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 181
	i32 2421380589, ; 387: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 388: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 245
	i32 2427813419, ; 389: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 322
	i32 2435356389, ; 390: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 391: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 392: Microsoft.JSInterop.dll => 0x919672ca => 209
	i32 2450138282, ; 393: BlazingPizzaMAUI.Domain => 0x920a24aa => 346
	i32 2454642406, ; 394: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 395: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 396: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 397: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 248
	i32 2471841756, ; 398: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 399: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 400: Microsoft.Maui.Controls => 0x93dba8a1 => 211
	i32 2483903535, ; 401: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 402: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 403: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 404: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 405: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 270
	i32 2509217888, ; 406: System.Diagnostics.EventLog => 0x958fa060 => 224
	i32 2522472828, ; 407: Xamarin.Android.Glide.dll => 0x9659e17c => 229
	i32 2530453544, ; 408: Nito.AsyncEx.Context.dll => 0x96d3a828 => 217
	i32 2537015816, ; 409: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 180
	i32 2538310050, ; 410: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 411: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 323
	i32 2553664291, ; 412: Castle.Windsor.dll => 0x9835d323 => 177
	i32 2562349572, ; 413: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 414: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 415: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 271
	i32 2581819634, ; 416: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 293
	i32 2585220780, ; 417: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 418: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 419: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 182
	i32 2589602615, ; 420: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 421: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 199
	i32 2593496499, ; 422: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 332
	i32 2605712449, ; 423: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 311
	i32 2615233544, ; 424: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 262
	i32 2616218305, ; 425: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 206
	i32 2617129537, ; 426: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 427: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 428: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 252
	i32 2624644809, ; 429: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 257
	i32 2626831493, ; 430: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 327
	i32 2627185994, ; 431: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 432: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 433: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 266
	i32 2660759594, ; 434: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 227
	i32 2663391936, ; 435: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 231
	i32 2663698177, ; 436: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 437: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 438: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 439: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 440: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 441: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 184
	i32 2693849962, ; 442: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 443: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 291
	i32 2715334215, ; 444: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 445: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 446: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 447: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 448: Xamarin.AndroidX.Activity => 0xa2e0939b => 233
	i32 2735172069, ; 449: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 450: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 180
	i32 2737747696, ; 451: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 239
	i32 2740948882, ; 452: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2747394357, ; 453: Castle.Windsor => 0xa3c1e935 => 177
	i32 2748088231, ; 454: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 455: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 333
	i32 2758225723, ; 456: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 212
	i32 2764765095, ; 457: Microsoft.Maui.dll => 0xa4caf7a7 => 213
	i32 2765824710, ; 458: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 459: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 305
	i32 2778768386, ; 460: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 296
	i32 2779977773, ; 461: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 284
	i32 2785988530, ; 462: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 339
	i32 2788224221, ; 463: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 262
	i32 2801831435, ; 464: Microsoft.Maui.Graphics => 0xa7008e0b => 215
	i32 2803228030, ; 465: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 466: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 318
	i32 2810250172, ; 467: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 249
	i32 2819470561, ; 468: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 469: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 470: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 284
	i32 2824502124, ; 471: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 472: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 331
	i32 2833784645, ; 473: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 186
	i32 2838993487, ; 474: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 273
	i32 2849599387, ; 475: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 476: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 296
	i32 2855708567, ; 477: Xamarin.AndroidX.Transition => 0xaa36a797 => 292
	i32 2861098320, ; 478: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 479: Microsoft.Maui.Essentials => 0xaa8a4878 => 214
	i32 2867946736, ; 480: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 227
	i32 2870099610, ; 481: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 234
	i32 2875164099, ; 482: Jsr305Binding.dll => 0xab5f85c3 => 301
	i32 2875220617, ; 483: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 484: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 260
	i32 2887636118, ; 485: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 486: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 183
	i32 2899753641, ; 487: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 488: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 489: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 490: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 491: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 492: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 202
	i32 2916838712, ; 493: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 297
	i32 2919462931, ; 494: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 495: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 236
	i32 2923418970, ; 496: Nito.Collections.Deque.dll => 0xae3fd55a => 220
	i32 2933086635, ; 497: Nito.Collections.Deque => 0xaed359ab => 220
	i32 2936416060, ; 498: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 499: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 500: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 501: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 223
	i32 2959614098, ; 502: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 503: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 504: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 505: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 256
	i32 2987532451, ; 506: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 287
	i32 2996846495, ; 507: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 269
	i32 3012788804, ; 508: System.Configuration.ConfigurationManager => 0xb3938244 => 223
	i32 3016983068, ; 509: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 289
	i32 3023353419, ; 510: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 511: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 264
	i32 3038032645, ; 512: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 347
	i32 3056245963, ; 513: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 286
	i32 3057625584, ; 514: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 277
	i32 3059408633, ; 515: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 516: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 517: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 189
	i32 3075834255, ; 518: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 519: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 324
	i32 3090735792, ; 520: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 521: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 522: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 523: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 524: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 525: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 526: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 527: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 528: GoogleGson.dll => 0xbba64c02 => 178
	i32 3159123045, ; 529: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 530: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 531: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 278
	i32 3192346100, ; 532: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 533: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 534: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 189
	i32 3204380047, ; 535: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 536: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 537: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 255
	i32 3220365878, ; 538: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 539: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 540: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3257332390, ; 541: MvvmHelpers => 0xc226f2a6 => 222
	i32 3258312781, ; 542: Xamarin.AndroidX.CardView => 0xc235e84d => 243
	i32 3265493905, ; 543: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 544: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 545: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 546: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 547: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 548: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 549: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 550: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 551: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 319
	i32 3316684772, ; 552: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 553: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 253
	i32 3317144872, ; 554: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 555: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 241
	i32 3345895724, ; 556: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 282
	i32 3346324047, ; 557: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 279
	i32 3357674450, ; 558: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 336
	i32 3358260929, ; 559: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 560: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 234
	i32 3362522851, ; 561: Xamarin.AndroidX.Core => 0xc86c06e3 => 250
	i32 3366347497, ; 562: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 563: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 283
	i32 3381016424, ; 564: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 315
	i32 3395150330, ; 565: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 566: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 567: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 254
	i32 3406629867, ; 568: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 200
	i32 3421170118, ; 569: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 193
	i32 3428513518, ; 570: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 196
	i32 3429136800, ; 571: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 572: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 573: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 257
	i32 3445260447, ; 574: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 575: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 210
	i32 3463511458, ; 576: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 323
	i32 3464190856, ; 577: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 182
	i32 3471940407, ; 578: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 579: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 580: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 336
	i32 3484440000, ; 581: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 335
	i32 3485117614, ; 582: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3485328213, ; 583: Nito.AsyncEx.Tasks.dll => 0xcfbde355 => 219
	i32 3486566296, ; 584: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 585: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 246
	i32 3500000672, ; 586: Microsoft.JSInterop => 0xd09dc5a0 => 209
	i32 3509114376, ; 587: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 588: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 589: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 590: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 591: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 592: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 593: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 343
	i32 3597029428, ; 594: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 232
	i32 3598340787, ; 595: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 596: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 597: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 598: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 281
	i32 3633644679, ; 599: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 236
	i32 3638274909, ; 600: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 601: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 267
	i32 3643446276, ; 602: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 340
	i32 3643854240, ; 603: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 278
	i32 3645089577, ; 604: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3653605406, ; 605: TimeZoneConverter => 0xd9c5981e => 228
	i32 3657292374, ; 606: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 192
	i32 3660523487, ; 607: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 608: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 609: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 242
	i32 3684561358, ; 610: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 246
	i32 3697841164, ; 611: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 345
	i32 3700866549, ; 612: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 613: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 251
	i32 3716563718, ; 614: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 615: Xamarin.AndroidX.Annotation => 0xdda814c6 => 235
	i32 3722202641, ; 616: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 195
	i32 3724971120, ; 617: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 277
	i32 3732100267, ; 618: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 619: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 186
	i32 3737834244, ; 620: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 621: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 622: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 623: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 194
	i32 3786282454, ; 624: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 244
	i32 3792276235, ; 625: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 626: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 210
	i32 3802395368, ; 627: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 628: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 629: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 630: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 631: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 197
	i32 3844307129, ; 632: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 633: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 634: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 635: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 636: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 637: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 638: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 292
	i32 3888767677, ; 639: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 282
	i32 3889960447, ; 640: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 344
	i32 3896106733, ; 641: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 642: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 250
	i32 3901907137, ; 643: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 644: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 645: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 295
	i32 3928044579, ; 646: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 647: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 648: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 280
	i32 3945713374, ; 649: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 650: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 651: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 238
	i32 3959773229, ; 652: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 269
	i32 3980434154, ; 653: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 339
	i32 3987592930, ; 654: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 321
	i32 3992683802, ; 655: Abp.dll => 0xedfb851a => 173
	i32 4003436829, ; 656: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015796627, ; 657: JetBrains.Annotations => 0xef5c3193 => 179
	i32 4015948917, ; 658: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 237
	i32 4023392905, ; 659: System.IO.Pipelines => 0xefd01a89 => 225
	i32 4025784931, ; 660: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 661: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 212
	i32 4054681211, ; 662: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 663: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 664: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 665: Microsoft.Maui.Essentials.dll => 0xf40add04 => 214
	i32 4099507663, ; 666: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 667: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 668: Xamarin.AndroidX.Emoji2 => 0xf479582c => 258
	i32 4101842092, ; 669: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 190
	i32 4102112229, ; 670: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 334
	i32 4125707920, ; 671: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 329
	i32 4126470640, ; 672: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 196
	i32 4127667938, ; 673: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 674: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 675: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 676: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 341
	i32 4151237749, ; 677: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 678: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 679: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 680: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 681: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 682: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 274
	i32 4185676441, ; 683: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 684: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 685: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4241083455, ; 686: Castle.Core => 0xfcc9cc3f => 174
	i32 4249538387, ; 687: TimeZoneConverter.dll => 0xfd4acf53 => 228
	i32 4256097574, ; 688: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 251
	i32 4258378803, ; 689: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 273
	i32 4260525087, ; 690: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 691: Microsoft.Maui.Controls.dll => 0xfea12dee => 211
	i32 4274976490, ; 692: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 693: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 274
	i32 4294648842, ; 694: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 201
	i32 4294763496 ; 695: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 260
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [696 x i32] [
	i32 68, ; 0
	i32 173, ; 1
	i32 67, ; 2
	i32 108, ; 3
	i32 198, ; 4
	i32 270, ; 5
	i32 304, ; 6
	i32 48, ; 7
	i32 216, ; 8
	i32 80, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 345, ; 12
	i32 124, ; 13
	i32 215, ; 14
	i32 102, ; 15
	i32 288, ; 16
	i32 346, ; 17
	i32 107, ; 18
	i32 288, ; 19
	i32 139, ; 20
	i32 308, ; 21
	i32 77, ; 22
	i32 124, ; 23
	i32 13, ; 24
	i32 244, ; 25
	i32 132, ; 26
	i32 290, ; 27
	i32 151, ; 28
	i32 342, ; 29
	i32 343, ; 30
	i32 18, ; 31
	i32 242, ; 32
	i32 26, ; 33
	i32 264, ; 34
	i32 1, ; 35
	i32 59, ; 36
	i32 42, ; 37
	i32 91, ; 38
	i32 181, ; 39
	i32 247, ; 40
	i32 226, ; 41
	i32 147, ; 42
	i32 266, ; 43
	i32 263, ; 44
	i32 314, ; 45
	i32 54, ; 46
	i32 69, ; 47
	i32 342, ; 48
	i32 233, ; 49
	i32 83, ; 50
	i32 327, ; 51
	i32 265, ; 52
	i32 326, ; 53
	i32 131, ; 54
	i32 55, ; 55
	i32 149, ; 56
	i32 74, ; 57
	i32 145, ; 58
	i32 62, ; 59
	i32 146, ; 60
	i32 219, ; 61
	i32 347, ; 62
	i32 165, ; 63
	i32 338, ; 64
	i32 248, ; 65
	i32 12, ; 66
	i32 261, ; 67
	i32 125, ; 68
	i32 152, ; 69
	i32 113, ; 70
	i32 166, ; 71
	i32 164, ; 72
	i32 263, ; 73
	i32 276, ; 74
	i32 84, ; 75
	i32 325, ; 76
	i32 319, ; 77
	i32 208, ; 78
	i32 150, ; 79
	i32 308, ; 80
	i32 60, ; 81
	i32 204, ; 82
	i32 51, ; 83
	i32 103, ; 84
	i32 114, ; 85
	i32 40, ; 86
	i32 301, ; 87
	i32 299, ; 88
	i32 201, ; 89
	i32 120, ; 90
	i32 333, ; 91
	i32 52, ; 92
	i32 44, ; 93
	i32 119, ; 94
	i32 253, ; 95
	i32 331, ; 96
	i32 259, ; 97
	i32 81, ; 98
	i32 136, ; 99
	i32 295, ; 100
	i32 240, ; 101
	i32 8, ; 102
	i32 73, ; 103
	i32 313, ; 104
	i32 155, ; 105
	i32 310, ; 106
	i32 154, ; 107
	i32 92, ; 108
	i32 305, ; 109
	i32 45, ; 110
	i32 328, ; 111
	i32 316, ; 112
	i32 309, ; 113
	i32 109, ; 114
	i32 129, ; 115
	i32 25, ; 116
	i32 230, ; 117
	i32 72, ; 118
	i32 55, ; 119
	i32 46, ; 120
	i32 337, ; 121
	i32 207, ; 122
	i32 254, ; 123
	i32 185, ; 124
	i32 22, ; 125
	i32 268, ; 126
	i32 86, ; 127
	i32 43, ; 128
	i32 160, ; 129
	i32 71, ; 130
	i32 222, ; 131
	i32 281, ; 132
	i32 226, ; 133
	i32 3, ; 134
	i32 42, ; 135
	i32 63, ; 136
	i32 16, ; 137
	i32 53, ; 138
	i32 340, ; 139
	i32 304, ; 140
	i32 176, ; 141
	i32 105, ; 142
	i32 216, ; 143
	i32 309, ; 144
	i32 302, ; 145
	i32 265, ; 146
	i32 34, ; 147
	i32 158, ; 148
	i32 85, ; 149
	i32 32, ; 150
	i32 12, ; 151
	i32 51, ; 152
	i32 203, ; 153
	i32 56, ; 154
	i32 285, ; 155
	i32 36, ; 156
	i32 197, ; 157
	i32 315, ; 158
	i32 303, ; 159
	i32 238, ; 160
	i32 35, ; 161
	i32 221, ; 162
	i32 58, ; 163
	i32 272, ; 164
	i32 178, ; 165
	i32 17, ; 166
	i32 306, ; 167
	i32 224, ; 168
	i32 164, ; 169
	i32 194, ; 170
	i32 328, ; 171
	i32 271, ; 172
	i32 206, ; 173
	i32 298, ; 174
	i32 188, ; 175
	i32 334, ; 176
	i32 153, ; 177
	i32 199, ; 178
	i32 294, ; 179
	i32 176, ; 180
	i32 279, ; 181
	i32 188, ; 182
	i32 332, ; 183
	i32 240, ; 184
	i32 190, ; 185
	i32 29, ; 186
	i32 52, ; 187
	i32 330, ; 188
	i32 299, ; 189
	i32 5, ; 190
	i32 314, ; 191
	i32 289, ; 192
	i32 293, ; 193
	i32 245, ; 194
	i32 310, ; 195
	i32 237, ; 196
	i32 256, ; 197
	i32 85, ; 198
	i32 298, ; 199
	i32 61, ; 200
	i32 112, ; 201
	i32 57, ; 202
	i32 344, ; 203
	i32 285, ; 204
	i32 99, ; 205
	i32 19, ; 206
	i32 249, ; 207
	i32 111, ; 208
	i32 101, ; 209
	i32 217, ; 210
	i32 102, ; 211
	i32 312, ; 212
	i32 104, ; 213
	i32 302, ; 214
	i32 71, ; 215
	i32 38, ; 216
	i32 32, ; 217
	i32 200, ; 218
	i32 103, ; 219
	i32 73, ; 220
	i32 318, ; 221
	i32 9, ; 222
	i32 123, ; 223
	i32 46, ; 224
	i32 239, ; 225
	i32 208, ; 226
	i32 9, ; 227
	i32 43, ; 228
	i32 4, ; 229
	i32 286, ; 230
	i32 322, ; 231
	i32 317, ; 232
	i32 203, ; 233
	i32 31, ; 234
	i32 138, ; 235
	i32 92, ; 236
	i32 185, ; 237
	i32 93, ; 238
	i32 337, ; 239
	i32 49, ; 240
	i32 141, ; 241
	i32 112, ; 242
	i32 140, ; 243
	i32 255, ; 244
	i32 115, ; 245
	i32 303, ; 246
	i32 157, ; 247
	i32 76, ; 248
	i32 79, ; 249
	i32 275, ; 250
	i32 37, ; 251
	i32 297, ; 252
	i32 0, ; 253
	i32 195, ; 254
	i32 259, ; 255
	i32 252, ; 256
	i32 64, ; 257
	i32 138, ; 258
	i32 15, ; 259
	i32 184, ; 260
	i32 116, ; 261
	i32 291, ; 262
	i32 300, ; 263
	i32 247, ; 264
	i32 48, ; 265
	i32 70, ; 266
	i32 80, ; 267
	i32 126, ; 268
	i32 187, ; 269
	i32 94, ; 270
	i32 121, ; 271
	i32 307, ; 272
	i32 26, ; 273
	i32 268, ; 274
	i32 97, ; 275
	i32 28, ; 276
	i32 243, ; 277
	i32 335, ; 278
	i32 313, ; 279
	i32 149, ; 280
	i32 225, ; 281
	i32 169, ; 282
	i32 4, ; 283
	i32 98, ; 284
	i32 183, ; 285
	i32 33, ; 286
	i32 93, ; 287
	i32 290, ; 288
	i32 204, ; 289
	i32 21, ; 290
	i32 41, ; 291
	i32 170, ; 292
	i32 329, ; 293
	i32 261, ; 294
	i32 321, ; 295
	i32 275, ; 296
	i32 306, ; 297
	i32 300, ; 298
	i32 280, ; 299
	i32 2, ; 300
	i32 134, ; 301
	i32 111, ; 302
	i32 205, ; 303
	i32 341, ; 304
	i32 230, ; 305
	i32 338, ; 306
	i32 58, ; 307
	i32 95, ; 308
	i32 320, ; 309
	i32 39, ; 310
	i32 241, ; 311
	i32 25, ; 312
	i32 94, ; 313
	i32 89, ; 314
	i32 99, ; 315
	i32 10, ; 316
	i32 87, ; 317
	i32 174, ; 318
	i32 100, ; 319
	i32 287, ; 320
	i32 191, ; 321
	i32 307, ; 322
	i32 232, ; 323
	i32 179, ; 324
	i32 317, ; 325
	i32 7, ; 326
	i32 272, ; 327
	i32 312, ; 328
	i32 229, ; 329
	i32 175, ; 330
	i32 88, ; 331
	i32 193, ; 332
	i32 221, ; 333
	i32 267, ; 334
	i32 154, ; 335
	i32 316, ; 336
	i32 33, ; 337
	i32 202, ; 338
	i32 116, ; 339
	i32 82, ; 340
	i32 218, ; 341
	i32 20, ; 342
	i32 11, ; 343
	i32 162, ; 344
	i32 3, ; 345
	i32 213, ; 346
	i32 324, ; 347
	i32 207, ; 348
	i32 205, ; 349
	i32 84, ; 350
	i32 198, ; 351
	i32 311, ; 352
	i32 64, ; 353
	i32 326, ; 354
	i32 294, ; 355
	i32 143, ; 356
	i32 0, ; 357
	i32 276, ; 358
	i32 157, ; 359
	i32 187, ; 360
	i32 41, ; 361
	i32 117, ; 362
	i32 192, ; 363
	i32 231, ; 364
	i32 320, ; 365
	i32 283, ; 366
	i32 131, ; 367
	i32 75, ; 368
	i32 66, ; 369
	i32 330, ; 370
	i32 172, ; 371
	i32 235, ; 372
	i32 143, ; 373
	i32 218, ; 374
	i32 106, ; 375
	i32 151, ; 376
	i32 70, ; 377
	i32 156, ; 378
	i32 191, ; 379
	i32 175, ; 380
	i32 121, ; 381
	i32 127, ; 382
	i32 325, ; 383
	i32 152, ; 384
	i32 258, ; 385
	i32 181, ; 386
	i32 141, ; 387
	i32 245, ; 388
	i32 322, ; 389
	i32 20, ; 390
	i32 14, ; 391
	i32 209, ; 392
	i32 346, ; 393
	i32 135, ; 394
	i32 75, ; 395
	i32 59, ; 396
	i32 248, ; 397
	i32 167, ; 398
	i32 168, ; 399
	i32 211, ; 400
	i32 15, ; 401
	i32 74, ; 402
	i32 6, ; 403
	i32 23, ; 404
	i32 270, ; 405
	i32 224, ; 406
	i32 229, ; 407
	i32 217, ; 408
	i32 180, ; 409
	i32 91, ; 410
	i32 323, ; 411
	i32 177, ; 412
	i32 1, ; 413
	i32 136, ; 414
	i32 271, ; 415
	i32 293, ; 416
	i32 134, ; 417
	i32 69, ; 418
	i32 182, ; 419
	i32 146, ; 420
	i32 199, ; 421
	i32 332, ; 422
	i32 311, ; 423
	i32 262, ; 424
	i32 206, ; 425
	i32 88, ; 426
	i32 96, ; 427
	i32 252, ; 428
	i32 257, ; 429
	i32 327, ; 430
	i32 31, ; 431
	i32 45, ; 432
	i32 266, ; 433
	i32 227, ; 434
	i32 231, ; 435
	i32 109, ; 436
	i32 158, ; 437
	i32 35, ; 438
	i32 22, ; 439
	i32 114, ; 440
	i32 184, ; 441
	i32 57, ; 442
	i32 291, ; 443
	i32 144, ; 444
	i32 118, ; 445
	i32 120, ; 446
	i32 110, ; 447
	i32 233, ; 448
	i32 139, ; 449
	i32 180, ; 450
	i32 239, ; 451
	i32 54, ; 452
	i32 177, ; 453
	i32 105, ; 454
	i32 333, ; 455
	i32 212, ; 456
	i32 213, ; 457
	i32 133, ; 458
	i32 305, ; 459
	i32 296, ; 460
	i32 284, ; 461
	i32 339, ; 462
	i32 262, ; 463
	i32 215, ; 464
	i32 159, ; 465
	i32 318, ; 466
	i32 249, ; 467
	i32 163, ; 468
	i32 132, ; 469
	i32 284, ; 470
	i32 161, ; 471
	i32 331, ; 472
	i32 186, ; 473
	i32 273, ; 474
	i32 140, ; 475
	i32 296, ; 476
	i32 292, ; 477
	i32 169, ; 478
	i32 214, ; 479
	i32 227, ; 480
	i32 234, ; 481
	i32 301, ; 482
	i32 40, ; 483
	i32 260, ; 484
	i32 81, ; 485
	i32 183, ; 486
	i32 56, ; 487
	i32 37, ; 488
	i32 97, ; 489
	i32 166, ; 490
	i32 172, ; 491
	i32 202, ; 492
	i32 297, ; 493
	i32 82, ; 494
	i32 236, ; 495
	i32 220, ; 496
	i32 220, ; 497
	i32 98, ; 498
	i32 30, ; 499
	i32 159, ; 500
	i32 223, ; 501
	i32 18, ; 502
	i32 127, ; 503
	i32 119, ; 504
	i32 256, ; 505
	i32 287, ; 506
	i32 269, ; 507
	i32 223, ; 508
	i32 289, ; 509
	i32 165, ; 510
	i32 264, ; 511
	i32 347, ; 512
	i32 286, ; 513
	i32 277, ; 514
	i32 170, ; 515
	i32 16, ; 516
	i32 189, ; 517
	i32 144, ; 518
	i32 324, ; 519
	i32 125, ; 520
	i32 118, ; 521
	i32 38, ; 522
	i32 115, ; 523
	i32 47, ; 524
	i32 142, ; 525
	i32 117, ; 526
	i32 34, ; 527
	i32 178, ; 528
	i32 95, ; 529
	i32 53, ; 530
	i32 278, ; 531
	i32 129, ; 532
	i32 153, ; 533
	i32 189, ; 534
	i32 24, ; 535
	i32 161, ; 536
	i32 255, ; 537
	i32 148, ; 538
	i32 104, ; 539
	i32 89, ; 540
	i32 222, ; 541
	i32 243, ; 542
	i32 60, ; 543
	i32 142, ; 544
	i32 100, ; 545
	i32 5, ; 546
	i32 13, ; 547
	i32 122, ; 548
	i32 135, ; 549
	i32 28, ; 550
	i32 319, ; 551
	i32 72, ; 552
	i32 253, ; 553
	i32 24, ; 554
	i32 241, ; 555
	i32 282, ; 556
	i32 279, ; 557
	i32 336, ; 558
	i32 137, ; 559
	i32 234, ; 560
	i32 250, ; 561
	i32 168, ; 562
	i32 283, ; 563
	i32 315, ; 564
	i32 101, ; 565
	i32 123, ; 566
	i32 254, ; 567
	i32 200, ; 568
	i32 193, ; 569
	i32 196, ; 570
	i32 163, ; 571
	i32 167, ; 572
	i32 257, ; 573
	i32 39, ; 574
	i32 210, ; 575
	i32 323, ; 576
	i32 182, ; 577
	i32 17, ; 578
	i32 171, ; 579
	i32 336, ; 580
	i32 335, ; 581
	i32 137, ; 582
	i32 219, ; 583
	i32 150, ; 584
	i32 246, ; 585
	i32 209, ; 586
	i32 155, ; 587
	i32 130, ; 588
	i32 19, ; 589
	i32 65, ; 590
	i32 147, ; 591
	i32 47, ; 592
	i32 343, ; 593
	i32 232, ; 594
	i32 79, ; 595
	i32 61, ; 596
	i32 106, ; 597
	i32 281, ; 598
	i32 236, ; 599
	i32 49, ; 600
	i32 267, ; 601
	i32 340, ; 602
	i32 278, ; 603
	i32 14, ; 604
	i32 228, ; 605
	i32 192, ; 606
	i32 68, ; 607
	i32 171, ; 608
	i32 242, ; 609
	i32 246, ; 610
	i32 345, ; 611
	i32 78, ; 612
	i32 251, ; 613
	i32 108, ; 614
	i32 235, ; 615
	i32 195, ; 616
	i32 277, ; 617
	i32 67, ; 618
	i32 186, ; 619
	i32 63, ; 620
	i32 27, ; 621
	i32 160, ; 622
	i32 194, ; 623
	i32 244, ; 624
	i32 10, ; 625
	i32 210, ; 626
	i32 11, ; 627
	i32 78, ; 628
	i32 126, ; 629
	i32 83, ; 630
	i32 197, ; 631
	i32 66, ; 632
	i32 107, ; 633
	i32 65, ; 634
	i32 128, ; 635
	i32 122, ; 636
	i32 77, ; 637
	i32 292, ; 638
	i32 282, ; 639
	i32 344, ; 640
	i32 8, ; 641
	i32 250, ; 642
	i32 2, ; 643
	i32 44, ; 644
	i32 295, ; 645
	i32 156, ; 646
	i32 128, ; 647
	i32 280, ; 648
	i32 23, ; 649
	i32 133, ; 650
	i32 238, ; 651
	i32 269, ; 652
	i32 339, ; 653
	i32 321, ; 654
	i32 173, ; 655
	i32 29, ; 656
	i32 179, ; 657
	i32 237, ; 658
	i32 225, ; 659
	i32 62, ; 660
	i32 212, ; 661
	i32 90, ; 662
	i32 87, ; 663
	i32 148, ; 664
	i32 214, ; 665
	i32 36, ; 666
	i32 86, ; 667
	i32 258, ; 668
	i32 190, ; 669
	i32 334, ; 670
	i32 329, ; 671
	i32 196, ; 672
	i32 50, ; 673
	i32 6, ; 674
	i32 90, ; 675
	i32 341, ; 676
	i32 21, ; 677
	i32 162, ; 678
	i32 96, ; 679
	i32 50, ; 680
	i32 113, ; 681
	i32 274, ; 682
	i32 130, ; 683
	i32 76, ; 684
	i32 27, ; 685
	i32 174, ; 686
	i32 228, ; 687
	i32 251, ; 688
	i32 273, ; 689
	i32 7, ; 690
	i32 211, ; 691
	i32 110, ; 692
	i32 274, ; 693
	i32 201, ; 694
	i32 260 ; 695
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 45bb7f365f1587a7786d5bbbf0daec075d5aabea"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
