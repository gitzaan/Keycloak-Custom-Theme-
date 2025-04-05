<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("infoTitle")?no_esc}
    <#elseif section = "form">
        <div id="kc-info-message">
            <p class="instruction">${message.summary}</p>
            <#if skipLink??>
            <#else>
                <#if pageRedirectUri??>
                    <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                <#elseif actionUri??>
                    <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                <#elseif (client.baseUrl)?has_content>
                    <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                </#if>
            </#if>
        </div>
        
        <div class="back-link-container">
            <a href="${url.loginUrl}" class="back-link">${msg("backToLogin")}</a>
        </div>
    </#if>
</@layout.registrationLayout>