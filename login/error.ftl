<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div class="error-wrapper">
            <div class="error-icon"></div>
            <div class="error-details">
                <h2 class="error-subtitle">${msg("errorTitleHtml")?no_esc}</h2>
                <p class="error-message">${message.summary?no_esc}</p>
                
                <div class="error-actions">
                    <#if client?? && client.baseUrl?has_content>
                        <a id="backToApplication" href="${client.baseUrl}" class="btn-secondary">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </#if>
                    <a href="${url.loginUrl}" class="btn-outlined">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>