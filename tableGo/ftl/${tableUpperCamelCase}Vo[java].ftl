<#-- 用于生成JavaBean的自定义模板 -->
/******************************************************************
** 类    名：${tableInfo.upperCamelCase}Vo
** 描    述：${tableInfo.remark}
** 创 建 者：${paramConfig.author}
** 创建时间：${today} ${currentTime}
******************************************************************/

<#if packagePath1?? && packagePath1?trim != "">
package ${packagePath1}

</#if>
<#assign importDate = false />
<#assign importBigDecimal = false />
<#list tableInfo.fieldInfos as fieldInfo>
    <#if !importDate && fieldInfo.javaType == "Date">
        <#assign importDate = true />
    <#elseif !importBigDecimal && fieldInfo.javaType == "BigDecimal">
        <#assign importBigDecimal = true />
    </#if>
</#list>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
<#if importDate>import java.util.Date;</#if>
<#if importBigDecimal>import java.math.BigDecimal;</#if>

/**
 * ${tableInfo.remark}(${tableInfo.tableName})
 * 
 * @author ${paramConfig.author}
 * @version 1.0.0 ${today}
 */
@ApiModel(description = "${tableInfo.simpleRemark}")
public class ${tableInfo.upperCamelCase}Vo implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = ${tableInfo.serialVersionUID!'1'}L;
<#if tableInfo.fieldInfos??>
    <#list tableInfo.fieldInfos as fieldInfo>

<#if paramConfig.buildFieldRemark == 0>
    /** <#if fieldInfo.remark?? && fieldInfo.remark?trim != "">${fieldInfo.remark}<#else>${fieldInfo.proName}</#if> */
</#if>
    @ApiModelProperty(value = "${fieldInfo.remark}")
    <#if fieldInfo.javaType == "Date">
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    </#if>
    private ${fieldInfo.javaType} ${fieldInfo.proName};
    </#list>
    <#list tableInfo.fieldInfos as fieldInfo>
    
    <#if paramConfig.buildFieldRemark == 0>
    /**
     * 获取<#if fieldInfo.remark?? && fieldInfo.remark?trim != "">${fieldInfo.remark}<#else>${fieldInfo.proName}</#if>
     * 
     * @return <#if fieldInfo.simpleRemark?? && fieldInfo.simpleRemark?trim != "">${fieldInfo.simpleRemark}<#else>${fieldInfo.proName}</#if>
     */
    </#if>
    public ${fieldInfo.javaType} get${fieldInfo.upperCamelCase}() {
        return this.${fieldInfo.proName};
    }
    
    <#if paramConfig.buildFieldRemark == 0>
    /**
     * 设置<#if fieldInfo.remark?? && fieldInfo.remark?trim != "">${fieldInfo.remark}<#else>${fieldInfo.proName}</#if>
     * 
     * @param ${fieldInfo.proName}
<#if fieldInfo.simpleRemark?? && fieldInfo.simpleRemark?trim != "">
     *          ${fieldInfo.simpleRemark}
</#if>
     */
    </#if>
    public void set${fieldInfo.upperCamelCase}(${fieldInfo.javaType} ${fieldInfo.proName}) {
        this.${fieldInfo.proName} = ${fieldInfo.proName};
    }
    </#list>
</#if>
}