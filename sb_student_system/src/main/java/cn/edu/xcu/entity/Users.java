package cn.edu.xcu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangzy
 * @since 2019-11-15
 */
@TableName("t_users")
public class Users implements Serializable {

    private static final long serialVersionUID=1L;

    private Integer id;

    private String name;

    private String pwd;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "Users{" +
        "id=" + id +
        ", name=" + name +
        ", pwd=" + pwd +
        "}";
    }
}
