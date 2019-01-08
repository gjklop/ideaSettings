<#-- 生成MyBatis的Mapper条件查询 -->
<#if tableInfo.fieldInfos?? && tableInfo.fieldInfos?size gt 0>
    <#list tableInfo.fieldInfos as fieldInfo>
        <#if fieldInfo.isDictType>
            <if test="${fieldInfo.proName} != null<#if fieldInfo.javaType == "String"> and ${fieldInfo.proName} != ''</#if>">
                AND ${fieldInfo.colName} = ${"#"}{${fieldInfo.proName}}     <!-- ${fieldInfo.returnRemark} -->
            </if>
        <#else>
            <if test="${fieldInfo.proName} != null<#if fieldInfo.javaType == "String"> and ${fieldInfo.proName} != ''</#if>">
                AND ${fieldInfo.colName}<#if fieldInfo.javaType == "String"> LIKE '%' || ${"#"}{${fieldInfo.proName}} || '%'<#else> = ${"#"}{${fieldInfo.proName}}</#if>        <!-- ${fieldInfo.returnRemark} -->
            </if>
        </#if>
    </#list>
</#if>