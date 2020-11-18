### Description
This is the bug can 100% reproduce in iOS 12.x while other iOS versions (>= v13.0) work fine.

### Project structure
1. A framework named `PublicStruct`. It enables `BUILD_LIBRARY_FOR_DISTRIBUTION` and defines a ABI-public struct `CardOwnerVerificationMethod`
2. A iOS demo named `LibraryEvolution`. In the default screen `ViewController.swift`, it defines an optional property `var method: CardOwnerVerificationMethod?`

### Ways to reproduce the crash
1. Open `LibraryEvolution.xcworkspace`
2. Run target `LibraryEvolution` in Simulator or real device with iOS v12.x installed.
3. When app launches, it will crash immediately with following crash log.
```
2020-11-18 23:32:56.123072+0800 LibraryEvolution[47218:2212584] Unknown class _TtC16LibraryEvolution14ViewController in Interface Builder file.
2020-11-18 23:33:34.041010+0800 LibraryEvolution[47218:2212584] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<UIViewController 0x7fb9aac08420> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key validLabelInStoryboard.'
*** First throw call stack:
(
    0   CoreFoundation                      0x000000010cf866fb __exceptionPreprocess + 331
    1   libobjc.A.dylib                     0x000000010b689ac5 objc_exception_throw + 48
    2   CoreFoundation                      0x000000010cf86269 -[NSException raise] + 9
    3   Foundation                          0x000000010b0fe562 -[NSObject(NSKeyValueCoding) setValue:forKey:] + 289
    4   UIKitCore                           0x0000000110dea2d2 -[UIViewController setValue:forKey:] + 87
    5   UIKitCore                           0x00000001110778fd -[UIRuntimeOutletConnection connect] + 109
    6   CoreFoundation                      0x000000010cf72d41 -[NSArray makeObjectsPerformSelector:] + 305
    7   UIKitCore                           0x0000000111074643 -[UINib instantiateWithOwner:options:] + 1810
    8   UIKitCore                           0x0000000110df13af -[UIViewController _loadViewFromNibNamed:bundle:] + 382
    9   UIKitCore                           0x0000000110df1d39 -[UIViewController loadView] + 177
    10  UIKitCore                           0x0000000110df2048 -[UIViewController loadViewIfRequired] + 172
    11  UIKitCore                           0x0000000110df2868 -[UIViewController view] + 27
    12  UIKitCore                           0x000000011142ac33 -[UIWindow addRootViewControllerViewIfPossible] + 122
    13  UIKitCore                           0x000000011142b327 -[UIWindow _setHidden:forced:] + 289
    14  UIKitCore                           0x000000011143df86 -[UIWindow makeKeyAndVisible] + 42
    15  UIKitCore                           0x00000001113edf1c -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 4555
    16  UIKitCore                           0x00000001113f30c6 -[UIApplication _runWithMainScene:transitionContext:completion:] + 1617
    17  UIKitCore                           0x0000000110c386d6 __111-[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:]_block_invoke + 904
    18  UIKitCore                           0x0000000110c40fce +[_UICanvas _enqueuePostSettingUpdateTransactionBlock:] + 153
    19  UIKitCore                           0x0000000110c382ec -[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:] + 236
    20  UIKitCore                           0x0000000110c38c48 -[__UICanvasLifecycleMonitor_Compatability activateEventsOnly:withContext:completion:] + 1091
    21  UIKitCore                           0x0000000110c36fba __82-[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:]_block_invoke + 782
    22  UIKitCore                           0x0000000110c36c71 -[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:] + 433
    23  UIKitCore                           0x0000000110c3b9b6 __125-[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:]_block_invoke + 576
    24  UIKitCore                           0x0000000110c3c610 _performActionsWithDelayForTransitionContext + 100
    25  UIKitCore                           0x0000000110c3b71d -[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:] + 223
    26  UIKitCore                           0x0000000110c406d0 -[_UICanvas scene:didUpdateWithDiff:transitionContext:completion:] + 392
    27  UIKitCore                           0x00000001113f19a8 -[UIApplication workspace:didCreateScene:withTransitionContext:completion:] + 514
    28  UIKitCore                           0x0000000110fa8dfa -[UIApplicationSceneClientAgent scene:didInitializeWithEvent:completion:] + 361
    29  FrontBoardServices                  0x0000000118157125 -[FBSSceneImpl _didCreateWithTransitionContext:completion:] + 448
    30  FrontBoardServices                  0x0000000118160ed6 __56-[FBSWorkspace client:handleCreateScene:withCompletion:]_block_invoke_2 + 283
    31  FrontBoardServices                  0x0000000118160700 __40-[FBSWorkspace _performDelegateCallOut:]_block_invoke + 53
    32  libdispatch.dylib                   0x000000010e318db5 _dispatch_client_callout + 8
    33  libdispatch.dylib                   0x000000010e31c2ba _dispatch_block_invoke_direct + 300
    34  FrontBoardServices                  0x0000000118192146 __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__ + 30
    35  FrontBoardServices                  0x0000000118191dfe -[FBSSerialQueue _performNext] + 451
    36  FrontBoardServices                  0x0000000118192393 -[FBSSerialQueue _performNextFromRunLoopSource] + 42
    37  CoreFoundation                      0x000000010ceedbe1 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
    38  CoreFoundation                      0x000000010ceed463 __CFRunLoopDoSources0 + 243
    39  CoreFoundation                      0x000000010cee7b1f __CFRunLoopRun + 1231
    40  CoreFoundation                      0x000000010cee7302 CFRunLoopRunSpecific + 626
    41  GraphicsServices                    0x00000001150cc2fe GSEventRunModal + 65
    42  UIKitCore                           0x00000001113f4ba2 UIApplicationMain + 140
    43  LibraryEvolution                    0x000000010ad9c5cb main + 75
    44  libdyld.dylib                       0x000000010e38d541 start + 1
    45  ???                                 0x0000000000000001 0x0 + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException

```
