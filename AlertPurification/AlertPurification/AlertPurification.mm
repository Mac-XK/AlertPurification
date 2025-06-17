#line 1 "/Users/macxk/Desktop/AlertPurification/AlertPurification/AlertPurification.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__asm__(".linker_option \"-framework\", \"CydiaSubstrate\"");

@class UIView; @class UIVisualEffectView; @class UIApplication; @class SwiftMessagesView; @class UILabel; 
static void (*_logos_orig$_ungrouped$UIApplication$openURL$options$completionHandler$)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, NSURL *, NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *, void (^)(BOOL success)); static void _logos_method$_ungrouped$UIApplication$openURL$options$completionHandler$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, NSURL *, NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *, void (^)(BOOL success)); static BOOL (*_logos_orig$_ungrouped$UIApplication$openURL$)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, NSURL *); static BOOL _logos_method$_ungrouped$UIApplication$openURL$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, NSURL *); static void (*_logos_orig$_ungrouped$UILabel$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UILabel$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UIView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SwiftMessagesView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SwiftMessagesView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIVisualEffectView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIVisualEffectView"); } return _klass; }
#line 9 "/Users/macxk/Desktop/AlertPurification/AlertPurification/AlertPurification.xm"



static void _logos_method$_ungrouped$UIApplication$openURL$options$completionHandler$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * url, NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> * options, void (^completion)(BOOL success)) {
    NSString *urlString = [url absoluteString];
    if ([urlString isEqualToString:@"https://t.me/blatants"]) {
        NSURL *newURL = [NSURL URLWithString:@"https://www.baidu.com"];
        _logos_orig$_ungrouped$UIApplication$openURL$options$completionHandler$(self, _cmd, newURL, options, completion);
    } else {
        _logos_orig$_ungrouped$UIApplication$openURL$options$completionHandler$(self, _cmd, url, options, completion);
    }
}


static BOOL _logos_method$_ungrouped$UIApplication$openURL$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * url) {
    NSString *urlString = [url absoluteString];
    if ([urlString isEqualToString:@"https://t.me/blatants"]) {
        NSURL *newURL = [NSURL URLWithString:@"https://www.baidu.com"];
        return _logos_orig$_ungrouped$UIApplication$openURL$(self, _cmd, newURL);
    }
    return _logos_orig$_ungrouped$UIApplication$openURL$(self, _cmd, url);
}





static void _logos_method$_ungrouped$UILabel$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$UILabel$didMoveToWindow(self, _cmd);

    
    if ([self.text isEqualToString:@"❤️"]) {
        UIWindow *window = self.window;
        if (window) {
            
            window.rootViewController = nil;
            window.hidden = YES;
        }
    }
}





static void _logos_method$_ungrouped$UIView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$UIView$didMoveToWindow(self, _cmd);

    
    if ([self isKindOfClass:_logos_static_class_lookup$SwiftMessagesView()]) {
        
        self.hidden = YES;
        
        
        
        
        UIView *superview = self.superview;
        if (superview) {
            for (UIView *sibling in superview.subviews) {
                if ([sibling isKindOfClass:_logos_static_class_lookup$UIVisualEffectView()]) {
                    sibling.hidden = YES;
                    
                    break;
                }
            }
        }
    }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); { MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(openURL:options:completionHandler:), (IMP)&_logos_method$_ungrouped$UIApplication$openURL$options$completionHandler$, (IMP*)&_logos_orig$_ungrouped$UIApplication$openURL$options$completionHandler$);}{ MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(openURL:), (IMP)&_logos_method$_ungrouped$UIApplication$openURL$, (IMP*)&_logos_orig$_ungrouped$UIApplication$openURL$);}Class _logos_class$_ungrouped$UILabel = objc_getClass("UILabel"); { MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$UILabel$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$UILabel$didMoveToWindow);}Class _logos_class$_ungrouped$UIView = objc_getClass("UIView"); { MSHookMessageEx(_logos_class$_ungrouped$UIView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$UIView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$UIView$didMoveToWindow);}} }
#line 79 "/Users/macxk/Desktop/AlertPurification/AlertPurification/AlertPurification.xm"
