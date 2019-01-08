<#-- 生成为表添加字段的SQL -->
<#if tableInfo.fieldInfos?? && tableInfo.fieldInfos?size gt 0>
    <#list tableInfo.fieldInfos as fieldInfo>
ALTER TABLE ${tableInfo.tableName} ADD COLUMN ${fieldInfo.colName} ${fieldInfo.dataTypeStr} NULL COMMENT '${fieldInfo.remark}';
    </#list>
</#if>
