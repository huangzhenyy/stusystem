package cn.edu.xcu.mybatisconfig;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;

@Configuration 
@MapperScan("cn.edu.xcu.mapper") //自动生成实现类
public class MyBatisConfig { 
 @Bean 
    public PaginationInterceptor paginationInterceptor() { 
  System.out.println("+++++++++++++++++++++++++++++++++++++++"); 
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor(); 
        // 设置请求的页面大于最大页后操作， true 调回到首页，false 继续请求  默认 false 
        // paginationInterceptor.setOverflow(false); 
        // 设置最大单页限制数量，默认 500 条，-1 不受限制 
        // paginationInterceptor.setLimit(500); 
        return paginationInterceptor; 
    } 
} 
