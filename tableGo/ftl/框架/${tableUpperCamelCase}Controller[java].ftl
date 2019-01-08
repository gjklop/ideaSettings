<#-- 生成Controller -->
package ${moduleName}.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

import java.util.List;
import javax.validation.Valid;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import common.bean.Paging;
import common.bean.ResultJsonWrap;
import common.controller.BaseController;

import entity.${moduleName}.${tableInfo.upperCamelCase}Entity;
import ${moduleName}.service.${tableInfo.upperCamelCase}Service;

/**
 * ${tableInfo.simpleRemark}管理模块Controller
 * 
 * @author ${paramConfig.author}
 * @version 1.0.0 ${today}
 */
@Api(tags = {"${tableInfo.simpleRemark}管理模块"})
@Lazy
@RestController
@RequestMapping(value = "/${moduleName}/${tableInfo.lowerCamelCase}/*")
public class ${tableInfo.upperCamelCase}Controller extends BaseController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ${tableInfo.upperCamelCase}Service ${tableInfo.lowerCamelCase}Service;
	
    /**
     * 根据参数查询${tableInfo.simpleRemark}列表和分页数据
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            查询参数
     * @param paging
     *            分页参数
     * @return 分页数据
     */
    @ApiOperation(value = "根据参数查询${tableInfo.simpleRemark}列表和分页数据", notes = "根据参数查询${tableInfo.simpleRemark}列表和分页数据")
	@PostMapping(value = "/list")
	public Paging<${tableInfo.upperCamelCase}Entity> list(${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}, Paging<${tableInfo.upperCamelCase}Entity> paging) {
		paging.clearRows();

		try {
			paging = ${tableInfo.lowerCamelCase}Service.find${tableInfo.upperCamelCase}ByCondition(${tableInfo.lowerCamelCase}, paging);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return paging;
	}
	    
    /**
     * 新增${tableInfo.simpleRemark}
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            ${tableInfo.simpleRemark}信息
     * @return 结果数据
     */
    @ApiOperation(value = "新增${tableInfo.simpleRemark}", notes = "新增${tableInfo.simpleRemark}")
    @PostMapping(value = "/add")
    public ResultJsonWrap<String> add(@Valid ${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}) {
        ResultJsonWrap<String> result = new ResultJsonWrap<>();

        try {
            ${tableInfo.lowerCamelCase}Service.add${tableInfo.upperCamelCase}(${tableInfo.lowerCamelCase});
            result.setMsg("新增${tableInfo.simpleRemark}成功！");
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            result.setErrorMsg("新增${tableInfo.simpleRemark}失败！");
        }

        return result;
    }

    /**
     * 修改${tableInfo.simpleRemark}
     * 
     * @param ${tableInfo.lowerCamelCase}
     *            ${tableInfo.simpleRemark}信息
     * @return 结果数据
     */
    @ApiOperation(value = "修改${tableInfo.simpleRemark}", notes = "修改${tableInfo.simpleRemark}")
    @PostMapping(value = "/modify")
    public ResultJsonWrap<String> modify(@Valid ${tableInfo.upperCamelCase}Entity ${tableInfo.lowerCamelCase}) {
        ResultJsonWrap<String> result = new ResultJsonWrap<>();
        
        ${tableInfo.pkJavaType} id = ${tableInfo.lowerCamelCase}.getId();
        if (<#if tableInfo.pkJavaType == "String">StringUtils.isBlank(id)<#else>id == null</#if>) {
            result.setErrorMsg("请选择需要修改的数据！");
            return result;
        }

        try {
            ${tableInfo.lowerCamelCase}Service.modify${tableInfo.upperCamelCase}(${tableInfo.lowerCamelCase});
            result.setMsg("修改${tableInfo.simpleRemark}成功！");
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            result.setErrorMsg("修改${tableInfo.simpleRemark}失败！");
        }

        return result;
    }

    /**
     * 批量删除${tableInfo.simpleRemark}
     * 
     * @param idList
     *            ID列表
     * @return 结果数据
     */
    @ApiOperation(value = "批量删除${tableInfo.simpleRemark}", notes = "批量删除${tableInfo.simpleRemark}")
    @ApiImplicitParam(name = "idList", value = "ID列表", allowMultiple = true)
    @PostMapping(value = "/deleteList")
    public ResultJsonWrap<String> deleteList(@RequestBody List<${tableInfo.pkJavaType}> idList) {
        ResultJsonWrap<String> result = new ResultJsonWrap<>();

        if (CollectionUtils.isEmpty(idList)) {
            result.setErrorMsg("请选择需要删除的数据！");
            return result;
        }

        try {
            ${tableInfo.lowerCamelCase}Service.delete${tableInfo.upperCamelCase}ByIds(idList);
            result.setMsg("删除${tableInfo.simpleRemark}成功！");
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            result.setErrorMsg("删除${tableInfo.simpleRemark}失败！");
        }

        return result;
    }

}