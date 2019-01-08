<#-- 生成EasyUI的新增修改的Form表单 -->
<#assign flag = false>
<#if tableInfo.pagingFieldInfos?? && tableInfo.pagingFieldInfos?size gt 0>
<form id="addOrModifyWindowForm" method="post" class="easyui-form" data-options="novalidate:true">
    <#list tableInfo.pagingFieldInfos as pagingList>
    <div class="form_left_box">
        <#list pagingList as fieldInfo>
            <#if fieldInfo.isDictType>
        <span>${fieldInfo.simpleRemark}：<select id="${fieldInfo.proName}" name="${fieldInfo.proName}" style="width:153px"></select></span>
                <#assign flag = true>
            <#elseif fieldInfo.javaType=="Date">
        <span>${fieldInfo.simpleRemark}：<input id="${fieldInfo.proName}" name="${fieldInfo.proName}" class="easyui-datebox" data-options="editable:false" style="width:153px"/></span>
            <#elseif fieldInfo.javaType=="Integer">
        <span>${fieldInfo.simpleRemark}：<input id="${fieldInfo.proName}" name="${fieldInfo.proName}" class="easyui-numberbox" data-options="min:0" style="width:153px"/></span>
            <#elseif fieldInfo.javaType=="BigDecimal">
        <span>${fieldInfo.simpleRemark}：<input id="${fieldInfo.proName}" name="${fieldInfo.proName}" class="easyui-numberbox" data-options="min:0,precision:2" style="width:153px"/></span>
            <#else>
        <span>${fieldInfo.simpleRemark}：<input id="${fieldInfo.proName}" name="${fieldInfo.proName}" class="easyui-textbox" data-options="validType:'length[1,${fieldInfo.columnSize}]'" style="width:153px"/></span>
            </#if>
        </#list>
    </div>
    </#list>
    
    <input type="hidden" name="id" />
</form>
</#if>
<#if flag>

<script type="text/javascript">
<#if tableInfo.fieldInfos?? && tableInfo.fieldInfos?size gt 0>
    function initCombobox(){
    <#list tableInfo.fieldInfos as fieldInfo>
        <#if fieldInfo.isDictType>
        var ${fieldInfo.proName} = getComboboxDictData("${fieldInfo.proName}");
        $("#${fieldInfo.proName}").combobox({
            data: ${fieldInfo.proName},
            panelHeight:"auto",
            editable:false,
            required:false
        });
        
        </#if>
    </#list>
    }
</#if>
</script>
</#if>