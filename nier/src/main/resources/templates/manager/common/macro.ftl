<#macro select data id="" value="" key="" text="" headKey="" headValue="">  
     <select class="selectpicker" id="${id}" name="${id}">   
          <#if headValue!="">  
               <option value="${headKey}">${headValue}</option>  
          </#if>  
          <#list data as it>  
              <#if key!="">  
                  <#if value == it[key]?string>  
                    <option value="${it[key]}" selected>${it[text]}</option>  
                  <#else>  
                    <option value="${it[key]}">${it[text]}</option>  
                  </#if>  
              <#else>  
                  <#if value == it>  
                    <option value="${it}" selected>${it}</option>  
                  <#else>  
                    <option value="${it}">${it}</option>  
              	  </#if>  
              </#if>   
          </#list>  
     </select>  
</#macro>  