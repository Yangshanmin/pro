package com.nba.mgr.pro.dao;

import com.nba.mgr.pro.entity.MailCode;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.free.persistence.repository.CrudDao;
import org.springframework.stereotype.Repository;


/**
 * (MailCode)表数据库访问层
 *
 * @author makejava
 * @since 2019-01-09 15:05:10
 */
@Repository 
public interface MailCodeDao extends CrudDao<MailCode> {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    MailCode queryById(Long id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<MailCode> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param mailCode 实例对象
     * @return 对象列表
     */
    List<MailCode> queryAll(MailCode mailCode);

    /**
     * 新增数据
     *
     * @param mailCode 实例对象
     * @return 影响行数
     */
    int insert(MailCode mailCode);

    /**
     * 修改数据
     *
     * @param mailCode 实例对象
     * @return 影响行数
     */
    int update(MailCode mailCode);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

    MailCode queryByMail (@Param("mail") String mail);
}