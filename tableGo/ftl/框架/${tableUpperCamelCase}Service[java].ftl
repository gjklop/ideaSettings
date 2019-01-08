<#-- 生成Service -->
package ${moduleName}.service;

import java.util.List;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import common.bean.Paging;
import common.service.BaseService;

import entity.${moduleName}.${tableInfo.upperCamelCase}Entity;

/**
 * ${tableInfo.simpleRemark}管理模块Service接口实现
 * 
 * @author ${paramConfig.author}
 * @version 1.0.0 ${today}
 */
@Lazy
@Service
public class ${tableInfo.upperCamelCase}Service extends BaseService {
    /** SQL的命名空间 */
    private static final String SQL_NS = "${moduleName}.${tableInfo.lowerCamelCase}.";

    /**
     * 根据分页条件查询${tableInfo.simpleRemark}数据并分页
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            查询参数
     * @param paging
     *            分页参数
     * @return 分页数据
     */
    public Paging find${tableInfo.upperCamelCase}ByCondition(${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}, Paging paging) {
        paging.setStringParams(${tableInfo.lowerCamelCase});

        paging = baseMyBatisDao.findForPageHelper(SQL_NS + "find${tableInfo.upperCamelCase}ByCondition", paging);

        return paging;
    }
    
    /**
     * 根据ID查询${tableInfo.simpleRemark}信息
     * 
     * @param id
     *            ID主键
     * @return ${tableInfo.simpleRemark}信息
     */
    public ${tableInfo.upperCamelCase}Entity find${tableInfo.upperCamelCase}ById(${tableInfo.pkJavaType} id){
        return baseJpaDao.findById(${tableInfo.upperCamelCase}Entity.class, id);
    }

    /**
     * 新增${tableInfo.simpleRemark}
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            ${tableInfo.simpleRemark}信息
     */
    public void add${tableInfo.upperCamelCase}(${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}) {
        ${tableInfo.lowerCamelCase}.setId(null);
        baseJpaDao.persist(${tableInfo.lowerCamelCase});
    }

    /**
     * 修改${tableInfo.simpleRemark}
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            ${tableInfo.simpleRemark}信息
     */
    public void modify${tableInfo.upperCamelCase}(${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}) {
        baseJpaDao.merge(${tableInfo.lowerCamelCase});
    }

    /**
     * 批量删除${tableInfo.simpleRemark}
     * 
     * @param idList
     *            ID列表
     */
    public void delete${tableInfo.upperCamelCase}ByIds(List<${tableInfo.pkJavaType}> idList) {
        baseMyBatisDao.delete(SQL_NS + "delete${tableInfo.upperCamelCase}ByIds", idList);
    }

}

