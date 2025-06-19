// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

static NSSet *blockedViewClasses;

__attribute__((constructor))
static void initializeBlockedViewClasses() {
    blockedViewClasses = [NSSet setWithArray:@[
        @"UIVisualEffectView",
        @"SwiftMessagesView",
        @"ADLaunchView",
        @"AdSkipView",
        @"TeenagerModeAlertView",   
        @"YouthModePopView",          
        @"WBAgeAlertView",            
        @"BiliTeenagerModeView",      
        @"StartupPopView",           
        @"UpgradeAlertView",         
        @"PopupContainerView",        
        @"CustomAlertView",           
        @"AlertMaskView"             
        // 添加其他需要屏蔽的类名
    ]];
}

static BOOL isViewBlocked(UIView *view) {
    return [blockedViewClasses containsObject:NSStringFromClass([view class])];
}

%hook UIApplication

- (void)openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options completionHandler:(void (^)(BOOL success))completion {
    NSString *urlString = [url absoluteString];
    if ([urlString isEqualToString:@"https://t.me/blatants"]) {
        NSURL *newURL = [NSURL URLWithString:@"https://www.baidu.com"];
        %orig(newURL, options, completion);
    } else {
        %orig(url, options, completion);
    }
}

- (BOOL)openURL:(NSURL *)url {
    NSString *urlString = [url absoluteString];
    if ([urlString isEqualToString:@"https://t.me/blatants"]) {
        NSURL *newURL = [NSURL URLWithString:@"https://www.baidu.com"];
        return %orig(newURL);
    }
    return %orig(url);
}

%end

%hook UILabel

- (void)didMoveToWindow {
    %orig;

    // 通过寻找"❤️"标签来移除心形弹窗
    if ([self.text isEqualToString:@"❤️"]) {
        UIWindow *window = self.window;
        if (window) {
            window.rootViewController = nil;
            window.hidden = YES;
        }
    }
}

%end

%hook UIView

- (void)didMoveToWindow {
    %orig;

    if (self.window && isViewBlocked(self)) {
        UIView *currentView = self;
        UIView *topView = self;

        while (currentView.superview) {
            currentView = currentView.superview;

            if ([currentView isKindOfClass:[UIWindow class]]) break;
            if ([currentView.nextResponder isKindOfClass:[UIViewController class]]) {
                topView = currentView;
            }

            if (currentView.frame.size.width > topView.frame.size.width * 0.8 &&
                currentView.frame.size.height > topView.frame.size.height * 0.8) {
                topView = currentView;
            }
        }

        topView.hidden = YES;
    }
}

%end
