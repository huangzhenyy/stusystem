package cn.edu.xcu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author huangzy
 * @since 2019-11-15
 */
@TableName("t_student")
public class Student implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String name;

    private String gernder;

    private Integer chengj;

    private String yuanxi;


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

    public String getGernder() {
        return gernder;
    }

    public void setGernder(String gernder) {
        this.gernder = gernder;
    }

    public Integer getChengj() {
        return chengj;
    }

    public void setChengj(Integer chengj) {
        this.chengj = chengj;
    }

    public String getYuanxi() {
        return yuanxi;
    }

    public void setYuanxi(String yuanxi) {
        this.yuanxi = yuanxi;
    }

    @Override
    public String toString() {
        return "Student{" +
        "id=" + id +
        ", name=" + name +
        ", gernder=" + gernder +
        ", chengj=" + chengj +
        ", yuanxi=" + yuanxi +
        "}";
    }
}
