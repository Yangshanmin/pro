package com.nba.mgr.pro.dao;

import com.nba.mgr.pro.entity.TeamUser;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.free.persistence.repository.CrudDao;
import org.springframework.stereotype.Repository;

/**
 * (TeamUser)表数据库访问层
 *
 * @author makejava
 * @since 2019-03-06 22:05:40
 */
@Repository
public interface TeamUserDao extends CrudDao<TeamUser> {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TeamUser queryById(Long id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TeamUser> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param teamUser 实例对象
     * @return 对象列表
     */
    List<TeamUser> queryAll(TeamUser teamUser);

    /**
     * 新增数据
     *
     * @param teamUser 实例对象
     * @return 影响行数
     */
    int insert(TeamUser teamUser);

    /**
     * 修改数据
     *
     * @param teamUser 实例对象
     * @return 影响行数
     */
    int update(TeamUser teamUser);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

    void del(@Param("id") String id);
}