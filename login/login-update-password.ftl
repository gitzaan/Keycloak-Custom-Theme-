<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <p>${msg("Please Update your Password")}</p>
        
        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            
            <div class="form-group">
                <label for="password-new" class="control-label">${msg("passwordNew")}</label>
                <input type="password" id="password-new" name="password-new" class="form-control" autofocus autocomplete="new-password" />
            </div>

            <div class="form-group">
                <label for="password-confirm" class="control-label">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" name="password-confirm" class="form-control" autocomplete="new-password" />
            </div>

            <div id="kc-form-buttons" class="form-group">
                <input class="login-btn" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>