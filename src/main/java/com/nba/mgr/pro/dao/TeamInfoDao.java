package com.nba.mgr.pro.dao;

import com.nba.mgr.pro.entity.TeamInfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.free.persistence.repository.CrudDao;
import org.springframework.stereotype.Repository;

/**
 * (TeamInfo)表数据库访问层
 *
 * @author makejava
 * @since 2019-01-08 21:10:23
 */
@Repository
public interface TeamInfoDao extends CrudDao<TeamInfo> {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TeamInfo queryById(Long id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TeamInfo> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param teamInfo 实例对象
     * @return 对象列表
     */
    List<TeamInfo> queryAll(TeamInfo teamInfo);

    /**
     * 新增数据
     *
     * @param teamInfo 实例对象
     * @return 影响行数
     */
    int insert(TeamInfo teamInfo);

    /**
     * 修改数据
     *
     * @param teamInfo 实例对象
     * @return 影响行数
     */
    int update(TeamInfo teamInfo);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

    void del(@Param("id") String id);

}