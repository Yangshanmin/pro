package com.nba.mgr.pro.dao;

import com.nba.mgr.pro.entity.PlayerInfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;

import org.free.persistence.model.PageResult;
import org.free.persistence.repository.CrudDao;
import org.springframework.stereotype.Repository;

/**
 * (PlayerInfo)表数据库访问层
 *
 * @author makejava
 * @since 2019-03-05 19:57:19
 */
@Repository
public interface PlayerInfoDao extends CrudDao<PlayerInfo> {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    PlayerInfo queryById(Long id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<PlayerInfo> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param playerInfo 实例对象
     * @return 对象列表
     */
    List<PlayerInfo> queryAll(PlayerInfo playerInfo);

    /**
     * 新增数据
     *
     * @param playerInfo 实例对象
     * @return 影响行数
     */
    int insert(PlayerInfo playerInfo);

    /**
     * 修改数据
     *
     * @param playerInfo 实例对象
     * @return 影响行数
     */
    int update(PlayerInfo playerInfo);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

    void del(@Param("id") String id);

    List<PlayerInfo> scoreList();

    List<PlayerInfo> backboardList();

    List<PlayerInfo> assistsList();

    PageResult<PlayerInfo> queryByArgsList();

}