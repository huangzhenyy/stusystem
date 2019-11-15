package cn.edu.xcu.service.impl;

import cn.edu.xcu.entity.Student;
import cn.edu.xcu.mapper.StudentMapper;
import cn.edu.xcu.service.IStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author huangzy
 * @since 2019-11-15
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}
