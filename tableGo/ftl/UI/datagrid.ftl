<#-- 生成EasyUI的DataGrid -->
<#if tableInfo.fieldInfos?? && tableInfo.fieldInfos?size gt 0>
var ${tableInfo.lowerCamelCase}Grid = $("#${tableInfo.lowerCamelCase}Grid").datagrid({
    fit:true,
    rownumbers:true,
    ctrlSelect:true,
    method:"post",
    pagination:true,
    pageSize:pageSize,
    pageList:pageList,
    toolbar:"#${tableInfo.lowerCamelCase}Toolbar",
    url:${tableInfo.lowerCamelCase}GridUrl,
    columns:[[
    <#list tableInfo.fieldInfos as fieldInfo>
        <#if fieldInfo.primaryKey>
        {field:'${fieldInfo.proName}',checkbox:true},
        <#elseif fieldInfo.isDictType>
        {field:'${fieldInfo.proName}',title:'${fieldInfo.simpleRemark}',width:100,align:'center',formatter:get${fieldInfo.upperCamelCase}Name},
        <#else>
        {field:'${fieldInfo.proName}',title:'${fieldInfo.simpleRemark}',width:100},
        </#if>
    </#list>
   ]]
});
</#if>
