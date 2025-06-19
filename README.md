# AlertPurification

<details>
<summary><strong>English</strong> (Click to expand)</summary>

### 📖 Background
This project was born out of a desire to deeply purify the user experience of a specific application. The original app contained several intrusive elements, such as a "heart" animation popup with haptic feedback, a "Congratulations" notification, and links that redirected to unexpected pages.

This tweak performs surgical modifications at runtime to remove these annoyances, ensuring a cleaner experience while maintaining the stability of other app functionalities.

### ✨ Features
-   **Smart Link Redirection**: Intercepts access attempts to `t.me/blatants` and seamlessly redirects them to `baidu.com`.
-   **Complete Removal of the Heart Popup**:
    -   Precisely identifies the popup by locating a `UILabel` with the "❤️" content.
    -   Goes beyond simply hiding the window; it deallocates its root view controller, thus eradicating the associated "heartbeat" haptic feedback timer from its source.
-   **Surgical Removal of Message Notifications**:
    -   Identifies and hides the "Congratulations" popup, which is based on the `SwiftMessages` library.
    -   Traverses the view hierarchy to simultaneously remove the semi-transparent blur background (`UIVisualEffectView`), preventing UI glitches like lingering blurs or black screens.

### ⚙️ How It Works
This project is built using the **Logos** syntax to hook into and modify the application's behavior at runtime.

-   **Link Redirection**: Achieved by hooking the `-openURL:...` methods of `UIApplication`. Before the original method is called, the URL is inspected. If it matches the target, it's replaced.
-   **Popup Removal**:
    -   **Heart Popup**: We hook the `-didMoveToWindow` method of `UILabel`. When a label with the text "❤️" is added to a window, we identify its parent `UIWindow` and set its `rootViewController` to `nil`. This action dismantles the entire view hierarchy of the popup, effectively deallocating all its objects and behaviors (like timers).
    -   **"Congratulations" Popup**: We hook the `-didMoveToWindow` method of `UIView`. The view's type is checked using `isKindOfClass:%c(SwiftMessagesView)`. If it matches, we hide the view itself. Then, we iterate through its sibling views to find and hide the `UIVisualEffectView` that serves as the background, ensuring no visual remnants are left.

### 🛠️ Building from Source
1.  **Prerequisites**: A jailbroken iOS device and a development environment with Theos properly configured.
2.  Clone the repository: `git clone <your-repo-url>`
3.  Navigate to the project directory: `cd AlertPurification`
4.  Run `make package` to build the `.deb` package. You can also use `make package install` to build and automatically install it on your connected device (requires proper environment setup).
5.  The generated `.deb` file can be found in the `./packages/` directory.

### 🤝 Contributing
Pull requests and issues are welcome. Feel free to contribute to making this project better.

### 📄 License
This project is licensed under the MIT License. See the `LICENSE` file for details.

</details>

<br>

<details open>
<summary><strong>中文</strong> (点击展开/折叠)</summary>

### 📖 项目背景
本项目旨在深度净化特定应用的用户体验。原版应用中存在一些干扰性元素，例如会自动弹出并伴有震动的"心形"动画窗口、短暂出现的"恭喜"消息通知，以及会将用户引导至非预期页面的链接。

本插件通过在运行时进行精准的手术式修改，移除了这些干扰元素，在打造更纯净体验的同时，保证了应用其他功能的稳定性。

### ✨ 功能亮点
-   **智能链接重定向**：拦截对 `t.me/blatants` 的访问请求，并无缝重定向至 `baidu.com`。
-   **彻底移除心形弹窗**：
    -   通过识别内容为 "❤️" 的`UILabel`来精确定位弹窗。
    -   不止是隐藏窗口，更是通过销毁其视图控制器的方式，从根源上停止了与之关联的"心跳"震动定时器。
-   **精准屏蔽消息通知**：
    -   识别并隐藏基于 `SwiftMessages` 库的"恭喜"弹窗。
    -   通过遍历视图层级，同时移除了弹窗的半透明模糊背景(`UIVisualEffectView`)，避免了界面残留或黑屏等视觉问题。

### ⚙️ 技术实现
本项目基于 **Logos** 语法，利用其强大的 **Hook** 能力在运行时修改应用行为。

-   **链接重定向**：通过 Hook `UIApplication` 的 `-openURL:...` 系列方法实现。在原始方法被调用前，检查 URL 是否为目标链接，如果是则进行替换。
-   **弹窗移除**：
    -   **心形弹窗**：我们 Hook 了 `UILabel` 的 `-didMoveToWindow` 方法。当一个文本为 "❤️" 的标签被添加到窗口时，我们便定位到它所在的 `UIWindow`，并将其 `rootViewController` 设为 `nil`。此举会彻底销毁该弹窗的整个视图层级，从而清除其所有子对象及关联行为（如定时器）。
    -   **"恭喜"弹窗**：我们 Hook 了 `UIView` 的 `-didMoveToWindow` 方法。通过 `isKindOfClass:%c(SwiftMessagesView)` 判断视图类型。若匹配，则隐藏该视图自身，并遍历其同级视图，找到作为背景的 `UIVisualEffectView` 并一同隐藏，确保没有留下任何视觉残余。

### 🛠️ 如何编译
1.  **环境要求**：一台已越狱的 iOS 设备，以及一个已正确配置 Theos 的开发环境。
2.  克隆此仓库：`git clone <your-repo-url>`
3.  进入项目目录：`cd AlertPurification`
4.  执行 `make package` 命令来编译生成 `.deb` 包。您也可以使用 `make package install` 来直接编译并安装到已连接的设备上（需要配置好相关环境）。
5.  生成的 `.deb` 文件位于 `./packages/` 目录下。

### 🤝 贡献代码
欢迎通过提交 Pull Request 或 Issue 的方式来为本项目贡献代码，让它变得更好。
感谢 ~ 君临提供代码

### 📄 许可证
本项目采用 MIT 许可证。详情请参阅 `LICENSE` 文件。

</details> 
