# Podfile多target管理

当一个项目中有多个target的时候需要支持pod,这时候时候我们需要多target管理


第一种方式简单粗暴,将公共的部分放在最外层,特有的部分放在单独的target中

	# Uncomment the next line to define a global platform for your project
	
	inhibit_all_warnings!
	
	# 公共target
	pod 'AFNetworking', '3.1.0'
	pod 'SDWebImage',  '4.0.0'
	pod 'MJExtension', '3.0.10'
	pod 'MJRefresh'
	pod 'MBProgressHUD', '0.9.2'
	pod 'IQKeyboardManager'
	pod 'Masonry', '1.0.0'
	pod 'SDCycleScrollView','1.75'
	pod 'HUPhotoBrowser'
	pod 'DZNEmptyDataSet'
	pod 'PPBadgeView'
	pod 'PGPickerView', '1.3.4'
	pod 'WebViewJavascriptBridge'
	platform :ios, '9.0'
	
		target 'GHTestDemo' do
			# 特有target
		    pod 'PPNetworkHelper'
		end
		
		target 'GHMasonryDemo' do
		    
		end


第二种方式使用以后越来越多的target,只需要把target放在数组中

	targetsArray = ['GHTestDemo', 'GHMasonryDemo']
	
	targetsArray.each do |t|
	    target t do
	        pod 'AFNetworking', '3.1.0'
	        pod 'SDWebImage',  '4.0.0'
	        pod 'MJExtension', '3.0.10'
	        pod 'MJRefresh'
	        pod 'MBProgressHUD', '0.9.2'
	        pod 'IQKeyboardManager'
	        pod 'Masonry', '1.0.0'
	        pod 'SDCycleScrollView','1.75'
	        pod 'HUPhotoBrowser'
	        pod 'DZNEmptyDataSet'
	        pod 'PPBadgeView'
	        pod 'PGPickerView', '1.3.4'
	        pod 'WebViewJavascriptBridge'
	        pod 'PPNetworkHelper'
	    end
	 
	end

编辑完成后退出xcode 执行pod install即可编译成功