@导入Java("java.util.Random")
@导入Java("org.json.*")
类 启动窗口 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,背景颜色=-1,纵向布局=真]])
	变量 根 : 线性布局
	@布局配置([[父布局=根,高度=120,宽度=-1,背景颜色=-10496,@布局对齐方式=48]])
	变量 标题栏 : 相对布局
	@布局配置([[父布局=标题栏,@位于布局左边=真,@上外边距DP=10,粗体=真,内容="无线电操作证考试模拟题题库",@左外边距DP=10,字体大小=20,字体颜色=-16777216]])
	变量 标题文本 : 文本框
	@布局配置([[父布局=标题栏,@位于布局右边=真,宽度=150,右内边距=20,内容="更多",字体颜色=-16777216,背景颜色=16777215]])
	变量 更多 : 按钮
	@布局配置([[父布局=根,高度=-1,宽度=-1,@权重=1.0,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度=-1]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,@权重=1.0,内容="随机抽题"]])
	变量 随机抽题 : 按钮
	@布局配置([[父布局=线性布局1,@权重=1.0,宽度=-1,内容="显示答案"]])
	变量 显示答案 : 按钮
	@布局配置([[父布局=线性布局2,宽度=-1,高度=50]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局2,宽度=-1,纵向布局=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度=-1,对齐方式=1,字体大小=18,粗体=真,字体颜色=-16777216,@外边距=20]])
	变量 题目 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=50]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局3,纵向布局=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度=-1]])
	变量 按钮3 : 按钮
	@布局配置([[父布局=线性布局4,宽度=-1]])
	变量 按钮4 : 按钮
	@布局配置([[父布局=线性布局4,宽度=-1]])
	变量 按钮5 : 按钮
	@布局配置([[父布局=线性布局4,宽度=-1]])
	变量 按钮6 : 按钮
	@布局配置([[父布局=线性布局2,字体大小=15]])
	变量 答案 : 文本框
	@布局配置([[父布局=根,背景颜色=-10496,宽度=-1,高度DP=55]])
	变量 底栏 : 相对布局
	@布局配置([[父布局=底栏,宽度=-1,@位于布局中间=真,对齐方式=17,内容="悠然（mituran） 制作，版权所有",粗体=真,字体大小=25]])
	变量 文本框1 : 文本框



	
	变量 对话框:对话框
	方法 下载题库对话窗(内容:文本)
		变量 框布局:弹出普通框布局
		框布局.内容.内容=内容
		框布局.按钮3.可视 = 假
		对话框.自定义布局=框布局
		对话框.显示()
		事件 框布局.按钮1:被单击()
			对话框.关闭()
			文件操作.创建目录("/sdcard/业余无线电操作证考试题库/")
			变量 对话框2:对话框
			变量 加载框布局:弹出加载框布局
			对话框2.自定义布局 = 加载框布局
			对话框2.可取消 = 假
			对话框2.显示()
			变量 下载:网络工具
			弹出提示("开始下载")
			下载.下载("http://crac.org.cn/userfiles/file/20211022/20211022155018_8471.zip","/sdcard/业余无线电操作证考试题库/20211022155018_8471.zip")
			事件 下载:下载结束(cookie : 文本)
				弹出提示("下载完成")
				弹出提示("开始解压")
				解压文件("/sdcard/业余无线电操作证考试题库/20211022155018_8471.zip","/sdcard/业余无线电操作证考试题库/")
				弹出提示("解压完成")
				对话框2.关闭()
				题库处理()
			结束 事件
		结束 事件
		事件 框布局.按钮2:被单击()
			结束对话框()
		结束 事件
	结束 方法
	方法 结束对话框()
		对话框.关闭()
	结束 方法
	变量 题库:JSON数组
	方法 题库处理()
		弹出提示("正在处理题库")
		变量 对话框2:对话框
		变量 加载框布局:弹出加载框布局
		对话框2.自定义布局 = 加载框布局
		对话框2.可取消 = 假
		对话框2.显示()
		变量 题库文本:文本集合=文件操作.读入文本文件("/storage/emulated/0/业余无线电操作证考试题库/TXT题库包(v20211022)/A类题库(v20211022).txt","GB2312").分割文本("\\[P\\]\n")
		变量 临时JSON:JSON对象
		变量 临时文本:文本
		//弹出提示(题库文本[0].截取文本("[Q]"，"[A]"))
		变量 临时:文本="["
		循环(i, 0, 题库文本.长度)
			临时文本=题库文本[i]
			临时JSON.置入("Q",临时文本.截取文本("[Q]"，"[A]"))
			临时JSON.置入("A",临时文本.截取文本("[A]"，"[B]"))
			临时JSON.置入("B",临时文本.截取文本("[B]"，"[C]"))
			临时JSON.置入("C",临时文本.截取文本("[C]"，"[D]"))
			临时JSON.置入("D",临时文本.截取文本("[D]"，临时文本[临时文本.长度-1].到文本())+临时文本[临时文本.长度-1])
			题库[i]=临时JSON
			//题库.置入([[{"1":"2"}]])
			临时=临时+题库.取对象(i).到文本()+","
		结束 循环
		//写出文本文件("/storage/emulated/0/业余无线电操作证考试题库/a.TXT",临时.取文本左边(临时.长度-1)+"]")
		临时=临时.取文本左边(临时.长度-1)+"]"
		对话框2.关闭()
		//@code
		//JSONArray ay= new JSONArray(#临时);
		//#题库=ay;
		//@end
		题库=临时
		题库.写出到文件("/storage/emulated/0/业余无线电操作证考试题库/a类题处理.json")
		
		弹出提示("题库处理完成")
	结束 方法
	方法 是否题库已处理() 为 逻辑型
		如果 文件是否存在("/storage/emulated/0/业余无线电操作证考试题库/a类题处理.json") 则
			返回 真
		否则
			返回 假
		结束 如果
	结束 方法
	
	事件 启动窗口:创建完毕()
		申请所有权限()
		本对象.显示标题栏 = 假
		本对象.沉浸模式 = 真
		如果 文件是否存在("/sdcard/业余无线电操作证考试题库/TXT题库包(v20211022)/A类题库(v20211022).txt") 则
			如果 是否题库已处理() 则
				题库=读入文本文件("/storage/emulated/0/业余无线电操作证考试题库/a类题处理.json")
			否则
				题库处理()
			结束 如果
		否则
			下载题库对话窗("检测到未下载题库或题库丢失，是否立即下载？")
			题库处理()
		结束 如果
		订阅事件()
	结束 事件
	变量 当前题号:整数
	//用户在组件上单击事件
	事件 随机抽题:被单击()
		答案.内容 = ""
		变量 随机数:整数
		变量 题库长度:整数=题库.长度
		@code
		#随机数=new Random().nextInt(#题库长度);
		@end
		当前题号=随机数
		变量 临时json:JSON对象=题库.取JSON对象(随机数)
		题目.内容=临时json.取文本("Q")
		变量 选项:文本集合
		选项.添加成员(临时json.取文本("A"))
		选项.添加成员(临时json.取文本("B"))
		选项.添加成员(临时json.取文本("C"))
		选项.添加成员(临时json.取文本("D"))
		@code
		Random r =new Random();
		@end
        循环(i,0,4)
            变量 index:整数
			code #index= r.nextInt(4);
            变量 temp:文本 =选项.取成员(i);
            选项.置成员(i,选项.取成员(index))
            选项.置成员(index,temp)
        结束 循环
		按钮3.内容 = 选项[0]
		按钮4.内容 = 选项[1]
		按钮5.内容 = 选项[2]
		按钮6.内容 = 选项[3]
	结束 事件

	//用户在组件上单击事件
	事件 显示答案:被单击()
		答案.内容=题库.取JSON对象(当前题号).取文本("A")
	结束 事件

结束 类

类 弹出普通框布局:组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真,背景颜色=-16777216]])
	变量 线性布局0 : 线性布局
	@布局配置([[父布局=线性布局0,宽度=-1,高度=-1,纵向布局=真,背景颜色=-1,@外边距=8]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,对齐方式=17,字体大小=24,内容="提示",@上外边距DP=12]])
	变量 标题 : 文本框
	@布局配置([[父布局=线性布局1,@上外边距DP=10,@下外边距DP=10,@左外边距DP=8,@右外边距DP=8]])
	变量 内容 : 文本框
	@布局配置([[父布局=线性布局1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,内容="确定",@权重=1.0,@布局对齐方式=17,对齐方式=17]])
	变量 按钮1 : 按钮
	@布局配置([[父布局=线性布局2,内容="取消",@权重=1.0,@布局对齐方式=17,对齐方式=17]])
	变量 按钮2 : 按钮
	@布局配置([[父布局=线性布局1,内容="按钮3"]])
	变量 按钮3 : 按钮
	
	事件 弹出普通框布局:创建完毕()
		置圆角背景(线性布局0,0XFF000000,
		10,10,10,10)
		置圆角背景(线性布局1,0XFFFFFFFF,
		10,10,10,10)
		订阅事件()
	结束 事件
结束 类
类 弹出加载框布局:组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真,背景颜色=-16777216]])
	变量 线性布局0 : 线性布局
	@布局配置([[父布局=线性布局0,宽度=-1,高度=-1,纵向布局=真,背景颜色=-1,@外边距=8]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,对齐方式=17,字体大小=24,内容="正在下载",@上外边距DP=12]])
	变量 标题 : 文本框
	@布局配置([[父布局=线性布局1]])
	变量 进度圈1 : 进度圈
	@布局配置([
