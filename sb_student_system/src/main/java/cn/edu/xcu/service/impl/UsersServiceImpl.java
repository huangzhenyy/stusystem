package cn.edu.xcu.service.impl;

import cn.edu.xcu.entity.Users;
import cn.edu.xcu.mapper.UsersMapper;
import cn.edu.xcu.service.IUsersService;
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
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements IUsersService {

}
