package cn.edu.xcu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;


import cn.edu.xcu.entity.Student;
import cn.edu.xcu.service.IStudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author huangzy
 * @since 2019-11-15
 */
@RestController 
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private IStudentService  iStudentService;

	@RequestMapping("/list")
	//@ResponseBody                            //搜索参数         @RequestParam(defaultValue = "-1", required = false) int tid,   false表明不是必填的@RequestParam(defaultValue = "", required = false) String name,
	public IPage<Student> list(
                            @RequestParam(defaultValue = "1", required = false) int page,
			                @RequestParam(defaultValue = "2", required = false) int limit
			                ) {
		// 告诉要看那一页以及查询提交
		IPage<Student> toWhichPage = new Page<Student>(page, limit);
		QueryWrapper<Student> wrapper = new QueryWrapper<>();// 构建查询条
		IPage<Student> resuIPage = iStudentService.page(toWhichPage, wrapper);
		return resuIPage;

	}
}

