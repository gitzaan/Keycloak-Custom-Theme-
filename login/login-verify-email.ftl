<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <p>${msg("emailVerifyInstruction1")}</p>
        
        <div id="kc-info-message">
            <p class="instruction">${msg("emailVerifyInstruction2")}</p>
            <p><a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}</p>
        </div>
        
        <div class="back-link-container">
            <a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        </div>
    </#if>
</@layout.registrationLayout>