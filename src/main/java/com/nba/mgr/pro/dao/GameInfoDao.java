package com.nba.mgr.pro.dao;

import com.nba.mgr.pro.entity.GameInfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.free.persistence.repository.CrudDao;
import org.springframework.stereotype.Repository;

/**
 * (GameInfo)表数据库访问层
 *
 * @author makejava
 * @since 2019-03-07 13:29:12
 */
@Repository
public interface GameInfoDao extends CrudDao<GameInfo> {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    GameInfo queryById(Long id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<GameInfo> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param gameInfo 实例对象
     * @return 对象列表
     */
    List<GameInfo> queryAll(GameInfo gameInfo);

    /**
     * 新增数据
     *
     * @param gameInfo 实例对象
     * @return 影响行数
     */
    int insert(GameInfo gameInfo);

    /**
     * 修改数据
     *
     * @param gameInfo 实例对象
     * @return 影响行数
     */
    int update(GameInfo gameInfo);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

}