package cn.edu.xcu.auto;




import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.TemplateConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class CodeGenerator {

	public static void main(String[] args) {
		//全局配置
//		
//		GlobalConfig gc = new GlobalConfig();
//        gc.setOutputDir(objPath); // 配置路径
//        gc.setOpen(false); // 是否打开生成的文件夹
//        gc.setAuthor("author"); // author
//        /* 自定义文件命名，注意 %s 会自动填充表实体属性！ */
//        gc.setMapperName("%sMapper"); // 设置mapper接口后缀
//        gc.setServiceName("%sService"); // 设置Service接口后缀
//        gc.setServiceImplName("%sServiceImpl"); // 设置Service实现类后缀
//        gc.setControllerName("%sController"); // 设置controller类后缀
//        gc.setXmlName("%sMapper"); // 设置sql映射文件后缀
//        gc.setFileOverride(false); // 是否覆盖同名文件，默认是false
//        gc.setActiveRecord(false); // 不需要ActiveRecord特性的请改为false
//        gc.setEnableCache(false); // XML 二级缓存
//        gc.setBaseResultMap(true); // XML ResultMap
//        gc.setBaseColumnList(false); // XML columList
//        mpg.setGlobalConfig(gc);
		
		//全局配置
		GlobalConfig  globalConfig=new GlobalConfig();
		 globalConfig.setOutputDir(System.getProperty("user.dir")+"/src/main/java");  // 配置路径 
		 globalConfig.setAuthor("huangzy");
		 globalConfig.setOpen(true);// 是否打开生成的文件夹
		//正确的  jdbc:mysql://localhost:3306/mysqweb?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Hongkong  
		//原来错误的 jdbc:mysql://localhost:3306/mysqweb?useUnicode=true&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=Hongkong
	    // 链接到数据库
		 DataSourceConfig  dataSourceConfig =new DataSourceConfig(); 
		 dataSourceConfig.setUrl("jdbc:mysql://localhost:3306/xcustu?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Hongkong");
		 dataSourceConfig.setDriverName("com.mysql.cj.jdbc.Driver");
		 dataSourceConfig.setUsername("root");
		 dataSourceConfig.setPassword("123456");
		 
		 //自定义代码模板
		TemplateConfig  templateConfig=new TemplateConfig();
		
		//自定义属性注入
		 InjectionConfig injectionConfig =new InjectionConfig () {

			@Override
			public void initMap() {
				
			    }
		 };
		 //包配置
		 PackageConfig packageConfig = new PackageConfig();
		 packageConfig.setParent("cn.edu.xcu");
		 //生成策略
		 StrategyConfig strategyConfig=new StrategyConfig();
		 strategyConfig.setTablePrefix("t");//告诉数据库表名的前缀
		 //这里把数据库中表名t_user_role转为驼峰命名法
		 strategyConfig.setNaming(NamingStrategy.underline_to_camel);//告诉类命名策略是什么
		 
		 AutoGenerator autoGenerator =new AutoGenerator();
		 autoGenerator.setGlobalConfig(globalConfig);
		 autoGenerator.setDataSource(dataSourceConfig);
		 autoGenerator.setTemplate(templateConfig);
		 autoGenerator.setCfg(injectionConfig);
		 autoGenerator.setPackageInfo(packageConfig);
		 autoGenerator.setStrategy(strategyConfig);
		
		 
		 autoGenerator.execute();//执行生成
		 
		 
	}

}
