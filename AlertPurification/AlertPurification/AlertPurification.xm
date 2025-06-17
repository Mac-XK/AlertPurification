// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

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

    // 通过类名移除"恭喜"弹窗
    if ([self isKindOfClass:%c(SwiftMessagesView)]) {
        self.hidden = YES;
        
        UIView *superview = self.superview;
        if (superview) {
            for (UIView *sibling in superview.subviews) {
                if ([sibling isKindOfClass:%c(UIVisualEffectView)]) {
                    sibling.hidden = YES;
                    break;
                }
            }
        }
    }
}

%end
